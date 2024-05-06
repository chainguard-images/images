terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    cli                 = string
    exec                = string
    worfkflowcontroller = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "argo"
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

  name      = "argo-workflows"
  namespace = "argo-workflows"
  chart     = "argo-workflows"
  repo      = "https://argoproj.github.io/argo-helm"

  values = {
    image = {
      tag = ""
    }
    server = {
      image = {
        registry   = join("", [local.parsed["cli"].registry, ""])
        repository = local.parsed["cli"].repo
        tag        = local.parsed["cli"].pseudo_tag

      }
      executor = {
        image = {
          registry   = join("", [local.parsed["exec"].registry, ""])
          repository = local.parsed["exec"].repo
          tag        = local.parsed["exec"].pseudo_tag
        }
      }
      controller = {
        image = {
          registry   = join("", [local.parsed["worfkflowcontroller"].registry, ""])
          repository = local.parsed["worfkflowcontroller"].repo
          tag        = local.parsed["worfkflowcontroller"].pseudo_tag
        }
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the argo helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name    = "Argo Helm tests"
      workdir = "/tests"
      cmd     = <<EOF
        ./check-argo-workflow.sh
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
