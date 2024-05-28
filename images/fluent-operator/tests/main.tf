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
  name      = "fluent-operator"
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

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name = "fluent-operator"

  repo      = "https://fluent.github.io/helm-charts"
  chart     = "fluent-operator"
  namespace = "fluent"

  values = {
    operator = {
      container = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  name    = "k3s test"
  harness = imagetest_harness_k3s.this

  steps = [
    {
      name = "Install helm chart"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Install and configure fluentd and fluent-bit"
      cmd  = "/tests/install-and-configure.sh"
    },
    {
      name = "Wait for deployment and http forwarder sts"
      cmd  = <<EOF
        kubectl wait --for=condition=available --timeout=600s deployment/fluent-operator -n fluent
        kubectl wait --for=condition=ready --timeout=600s pod/fluentd-http-0 -n fluent
      EOF
    }
  ]
}
