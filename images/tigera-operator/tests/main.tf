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
  name      = "tigera-operator"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  # Use a separate module because this chart is re-used by the calico tests
  source = "./helm"

  values = {
    tigeraOperator = {
      registry = data.oci_string.ref.registry
      image    = data.oci_string.ref.repo
      version  = data.oci_string.ref.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "basic"
  description = "Basic functionality of calico as a cni"

  steps = [
    {
      name = "Install tigera-operator with the helm chart"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Ensure we can install calico with the operator"
      cmd  = <<EOF
kubectl apply -f - <<EOm
apiVersion: operator.tigera.io/v1
kind: Installation
metadata:
  name: default
spec:
  variant: Calico
EOm

kubectl wait --for=condition=Ready --timeout=5m installation default
      EOF
    },
  ]
}
