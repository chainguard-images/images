terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "trust-manager"
  inventory = data.imagetest_inventory.this
}

module "cert-manager" {
  source = "../../../tflib/imagetest/helm"

  namespace = "cert-manager"
  chart     = "cert-manager"
  repo      = "https://charts.jetstack.io"

  values = {
    installCRDs = true
  }
}

module "trust-manager" {
  source = "../../../tflib/imagetest/helm"

  namespace = "cert-manager"
  chart     = "trust-manager"
  repo      = "https://charts.jetstack.io"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the trust-manager helm chart."

  steps = [
    {
      name = "cert-manager helm install"
      cmd  = module.cert-manager.install_cmd
    },
    {
      name = "trust-manager helm install"
      cmd  = module.trust-manager.install_cmd
    },
    {
      name = "Ensure we can create and inspect a bundle"
      cmd  = <<EOT
kubectl apply --wait -f - <<EOF
apiVersion: trust.cert-manager.io/v1alpha1
kind: Bundle
metadata:
  name: example-bundle
spec:
  sources:
  - useDefaultCAs: true
  target:
    configMap:
      key: "trust-bundle.pem"
EOF

kubectl wait --for=condition=Synced bundle example-bundle --timeout 1m
kubectl get configmap example-bundle -o "jsonpath={.data['trust-bundle\.pem']}"
      EOT
    },
  ]

  labels = {
    type = "k8s"
  }
}
