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
    events              = string
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

module "helm_workflows" {
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

module "helm_events" {
  source = "../../../tflib/imagetest/helm"

  name      = "argo-events"
  namespace = "argo-events"
  chart     = "argo-events"
  repo      = "https://argoproj.github.io/argo-helm"

  values = {
    image = {
      tag = ""
    }
    global = {
      image = {
        repository = local.parsed["events"].registry_repo
        tag        = local.parsed["events"].pseudo_tag

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
      name = "Helm install workflows"
      cmd  = module.helm_workflows.install_cmd
    },
    {
      name    = "Argo Workflows Helm tests"
      workdir = "/tests"
      cmd     = <<EOF
        ./check-argo-workflow.sh
      EOF
    },
    {
      name = "Helm install events"
      cmd  = module.helm_events.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
