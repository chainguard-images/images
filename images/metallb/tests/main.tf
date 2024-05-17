terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    controller = string
    speaker    = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "metallb"
  inventory = data.imagetest_inventory.this
}

module "helm_metallb" {
  source = "./install"

  values = {
    controller = {
      image = {
        repository = local.parsed["controller"].registry_repo
        tag        = local.parsed["controller"].pseudo_tag
      }
    }
    speaker = {
      image = {
        repository = local.parsed["speaker"].registry_repo
        tag        = local.parsed["speaker"].pseudo_tag
      }
      frr = {
        enabled = false
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the metallb helm chart."

  steps = [
    {
      name = "Install metallb",
      cmd  = module.helm_metallb.install_cmd
    },
    {
      name  = "Check CRDs, service, and pods",
      cmd   = <<EOF
        kubectl get crd |grep metallb
        kubectl get svc/metallb-webhook-service -n metallb
        kubectl wait --for=condition=Ready po -n metallb -l app.kubernetes.io/component=controller
        kubectl wait --for=condition=Ready po -n metallb -l app.kubernetes.io/component=speaker
      EOF
      retry = { attempts = 5, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
