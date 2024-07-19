terraform {
  required_providers {
    apko      = { source = "chainguard-dev/apko" }
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    admission  = string
    background = string
    cleanup    = string
    cli        = string
    init       = string
    reports    = string
  })
}

# needed to create a disposable wget image to unwedge this test
# see https://github.com/docker-library/busybox/issues/134#issuecomment-1122717673
variable "target_repository" {}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

data "apko_config" "testing-wget" {
  extra_packages = ["dash", "dash-binsh", "cmd:sleep", "wget"]
  config_contents = jsonencode({
    accounts   = { run-as = 0 }
    entrypoint = { command = "/usr/bin/wget" }
  })
}

resource "apko_build" "testing-wget" {
  # NOTE: This uses the same repo as the image being tested, but since it is
  # never tagged it is never synced downstream.
  repo   = var.target_repository
  config = data.apko_config.testing-wget.config
}

resource "imagetest_harness_k3s" "this" {
  name      = "kyverno"
  inventory = data.imagetest_inventory.this
}

locals { testing_wget_parsed = provider::oci::parse(apko_build.testing-wget.image_ref) }

module "helm" {
  # Use a separate module because this chart is re-used by
  # the kyverno-policy-reporter tests
  source = "./helm"
  values = {
    test = {
      image = {
        registry   = local.testing_wget_parsed.registry
        repository = local.testing_wget_parsed.repo
        tag        = local.testing_wget_parsed.pseudo_tag
      }
    }
    admissionController = {
      container = {
        image = {
          registry   = local.parsed["admission"].registry
          repository = local.parsed["admission"].repo
          tag        = local.parsed["admission"].pseudo_tag
        }
      }
      initContainer = {
        image = {
          registry   = local.parsed["init"].registry
          repository = local.parsed["init"].repo
          tag        = local.parsed["init"].pseudo_tag
        }
      }
    }
    backgroundController = {
      container = {
        image = {
          registry = local.parsed["background"].registry
          registry = local.parsed["background"].repo
          tag      = local.parsed["background"].pseudo_tag
        }
      }
    }
    cleanupController = {
      container = {
        image = {
          registry = local.parsed["cleanup"].registry
          registry = local.parsed["cleanup"].repo
          tag      = local.parsed["cleanup"].pseudo_tag
        }
      }
    }
    reportsController = {
      container = {
        image = {
          registry = local.parsed["reports"].registry
          registry = local.parsed["reports"].repo
          tag      = local.parsed["reports"].pseudo_tag
        }
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the kyverno helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      # TODO: These aren't exhaustive, but they seem to be pretty
      # representative outside the full upstream sweep.
      name = "helm test"
      cmd  = "helm test -n kyverno kyverno"
    }
  ]

  labels = {
    type = "k8s"
  }
}
