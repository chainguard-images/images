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

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

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
        registry   = join("", [data.oci_string.ref["cli"].registry, ""])
        repository = data.oci_string.ref["cli"].repo
        tag        = data.oci_string.ref["cli"].pseudo_tag

      }
      executor = {
        image = {
          registry   = join("", [data.oci_string.ref["exec"].registry, ""])
          repository = data.oci_string.ref["exec"].repo
          tag        = data.oci_string.ref["exec"].pseudo_tag
        }
      }
      controller = {
        image = {
          registry   = join("", [data.oci_string.ref["worfkflowcontroller"].registry, ""])
          repository = data.oci_string.ref["worfkflowcontroller"].repo
          tag        = data.oci_string.ref["worfkflowcontroller"].pseudo_tag
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
