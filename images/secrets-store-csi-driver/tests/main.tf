terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

# Variables definition
variable "crds" {
  type    = bool
  default = false # Set this to true to enable the crds block
}

variable "crds_repository" {
  type    = string
  default = "default-crds-repo" # Default value, can be overridden
}

variable "crds_tag" {
  type    = string
  default = "default-crds-tag" # Default value, can be overridden
}

data "imagetest_inventory" "inventory" {}

resource "imagetest_harness_k3s" "k3s" {
  name      = "k3s"
  inventory = data.imagetest_inventory.inventory

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }

  hooks = {
    # To fix the `"/var/lib/kubelet" but it is not a shared mount` issue.
    post_start = [
      "mount --make-shared /var/lib/kubelet",
      "mount --make-rshared /",
    ]
  }
}

module "helm-secrets-store-csi-driver" {
  source = "../../../tflib/imagetest/helm"

  name      = "csi-secrets-store"
  namespace = "default"
  repo      = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart     = "secrets-store-csi-driver"

  values = merge(
    {
      linux = {
        image = {
          repository = local.parsed.registry_repo
          tag        = local.parsed.pseudo_tag
        }
      }
      syncSecret = {
        enabled = true
      }
    },
    var.crds ? {
      linux = {
        crds = {
          enabled = true
          image = {
            repository = var.crds_repository
            tag        = var.crds_tag
          }
        }
      }
    } : {}
  )
}

module "helm-vault" {
  source = "../../../tflib/imagetest/helm"

  name      = "vault"
  namespace = "default"
  chart     = "vault"
  repo      = "https://helm.releases.hashicorp.com"

  values = {
    csi = {
      enabled = true
    }
    injector = {
      enabled = false
    }
    server = {
      dev = {
        enabled = true
      }
      image = {
        repository = "cgr.dev/chainguard/vault"
        tag        = "latest"
      }
    }
  }
}

variable "additional_test_steps_post_hooks" {
  type = list(object({
    name = string
    cmd  = string
  }))
  default = []
}

resource "imagetest_feature" "helm" {
  name        = "secrets-store-csi-driver helm test"
  description = "Basic Helm test"
  harness     = imagetest_harness_k3s.k3s

  steps = concat([
    {
      name = "Install vault"
      cmd  = module.helm-vault.install_cmd
    },
    {
      name = "Install secrets-store-csi-driver"
      cmd  = module.helm-secrets-store-csi-driver.install_cmd
    },
    {
      name = "Do necessary pre-required steps for CSI driver"
      cmd  = <<EOVault
        kubectl wait --for=condition=Ready pods --all -n default --timeout=600s
        kubectl exec vault-0 -- vault kv put secret/db-pass password="db-secret-password"
        kubectl exec vault-0 -- vault kv get secret/db-pass
        kubectl exec vault-0 -- vault auth enable kubernetes
        kubectl exec vault-0 -- vault write auth/kubernetes/config token_reviewer_jwt=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token) kubernetes_host=https://10.43.0.1:443 kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
        kubectl exec vault-0 -- sh -c 'echo "path \"secret/data/db-pass\" { capabilities = [\"read\"] }" | vault policy write internal-app -'

  
        kubectl exec vault-0 -- vault write auth/kubernetes/role/database bound_service_account_names=webapp-sa bound_service_account_namespaces=default policies=internal-app ttl=20m

        cat > spc-vault-database.yaml <<EOF
        apiVersion: secrets-store.csi.x-k8s.io/v1
        kind: SecretProviderClass
        metadata:
          name: vault-database
        spec:
          provider: vault
          parameters:
            vaultAddress: "http://vault.default:8200"
            roleName: "database"
            objects: |
              - objectName: "db-password"
                secretPath: "secret/data/db-pass"
                secretKey: "password"
EOF

        kubectl apply -f spc-vault-database.yaml

        kubectl create serviceaccount webapp-sa

        cat > webapp-pod.yaml <<EOF
          kind: Pod
          apiVersion: v1
          metadata:
            name: webapp
          spec:
            serviceAccountName: webapp-sa
            containers:
            - image: jweissig/app:0.0.1
              name: webapp
              volumeMounts:
              - name: secrets-store-inline
                mountPath: "/mnt/secrets-store"
                readOnly: true
            volumes:
              - name: secrets-store-inline
                csi:
                  driver: secrets-store.csi.k8s.io
                  readOnly: true
                  volumeAttributes:
                    secretProviderClass: "vault-database"
EOF

        kubectl apply -f webapp-pod.yaml

        kubectl wait --for=condition=Ready pods --all -n default --timeout=300s

        password=$(kubectl exec webapp -- cat /mnt/secrets-store/db-password)

        if [ "$password" != "db-secret-password" ]; then
          echo "Password is not correct"
          echo "the password is $password but it should be \"db-secret-password\""
          exit 1
        fi
EOVault
    }
  ], var.additional_test_steps_post_hooks)

  labels = {
    type = "k8s"
  }
}
