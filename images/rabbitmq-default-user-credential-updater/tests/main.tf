terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "rabbitmq-default-user-credential-updater"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

locals {
  namespace = "rabbitmq-system"
  latest    = <<EOF
      LATEST=$(curl -s "https://api.github.com/repos/rabbitmq/cluster-operator/releases/latest" | jq -r '.tag_name')
  EOF
}

module "helm-vault" {
  source = "../../../tflib/imagetest/helm"

  repo      = "https://helm.releases.hashicorp.com"
  chart     = "vault"
  namespace = local.namespace
  name      = "vault"

  values = {
    server = {
      dev      = { enabled = true }
      logLevel = "debug"
    }
    injector = {
      logLevel = "debug"
    }
  }
}

resource "imagetest_feature" "vault" {
  harness     = imagetest_harness_k3s.this
  name        = "Vault"
  description = "Integration test with RabbitMQ and Hashicorp Vault."

  steps = [
    {
      name = "Create required namespace"
      cmd  = <<EOF
        kubectl create ns ${local.namespace}
      EOF
    },
    {
      name = "Helm deploy Vault"
      cmd  = module.helm-vault.install_cmd
    },
    {
      name = "Wait for deployment to finish, then run setup.sh script"
      cmd  = <<EOF
        sleep 5
        kubectl wait --for=condition=Ready pod/vault-0 -n ${local.namespace}
        chmod +x /tests/setup.sh
        RABBITMQ_NAMESPACE=${local.namespace} /tests/setup.sh
      EOF
    },
    {
      name = "Depoly rabbit mq with custom default-user-credential-updater image"
      cmd  = <<EOF
        apk add kustomize
cat > kustomization.yaml <<kust
resources:
- "https://github.com/rabbitmq/cluster-operator/releases/download/${local.latest}/cluster-operator.yml"
patches:
- patch: |-
    - op: add
      path: "/spec/template/spec/containers/0/env/-"
      value: 
        name: DEFAULT_USER_UPDATER_IMAGE
        value: ${data.oci_string.ref.registry_repo}
  target:
    kind: Deployment
    namespace: rabbitmq-system
    name: rabbitmq-cluster-operator
kust
        kustomize build . | kubectl apply -f -
        kubectl apply -f /tests/rabbitmq.yaml -n ${local.namespace}
        sleep 30
        kubectl wait --for=condition=Ready pod/vault-default-user-server-0 -n ${local.namespace} --timeout 600s
      EOF
    },
    {
      name = "Run test.sh script"
      cmd  = <<EOF
        apk add jq
        chmod +x /tests/test.sh
        RABBITMQ_NAMESPACE=${local.namespace}  /tests/test.sh
      EOF
    }
  ]

  labels = {
    type = "k8s"
  }
}