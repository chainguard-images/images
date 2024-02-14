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
  name      = "rmqmto"
  inventory = data.imagetest_inventory.this
}

module "cert_manager_install" {
  source = "../../cert-manager/tests/install"
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the cert-manager helm chart."

  steps = [
    {
      name = "Install cert-manager"
      cmd  = module.cert_manager_install.install_cmd
    },
    {
      name = "Deploy RabbitMQ Messaging Topology Operator"
      cmd  = <<EOF
apk add kustomize

cat > kustomization.yaml <<kust
resources:
- https://github.com/rabbitmq/messaging-topology-operator/releases/latest/download/messaging-topology-operator-with-certmanager.yaml

images:
- name: rabbitmqoperator/messaging-topology-operator
  newName: ${data.oci_string.ref.registry_repo}
  newTag: ${data.oci_string.ref.pseudo_tag}
kust

kustomize build . | kubectl apply -f -
      EOF
    },
    {
      name  = "Ensure it comes up healthy"
      cmd   = "kubectl wait --for=condition=ready pods -n rabbitmq-system --all --timeout=300s"
      retry = { attempts = 3, delay = "2s", factor = 2 }
    },
    # TODO: Most functionality requires RMQ. Install RMQ and actually test something
  ]

  labels = {
    type = "k8s"
  }
}
