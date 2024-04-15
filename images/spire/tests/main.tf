terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    server                  = string
    agent                   = string
    oidc-discovery-provider = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "spire"
  inventory = data.imagetest_inventory.this
}

module "spire_crds" {
  source = "../../../tflib/imagetest/helm"

  namespace = "spire-system"
  chart     = "spire-crds"
  repo      = "https://spiffe.github.io/helm-charts-hardened/"
}

module "spire" {
  source = "../../../tflib/imagetest/helm"

  name      = "spire"
  namespace = "spire-system"
  chart     = "spire"
  repo      = "https://spiffe.github.io/helm-charts-hardened/"

  values = {
    spire-server = {
      enabled = true
      image = {
        registry   = data.oci_string.ref["server"].registry
        repository = data.oci_string.ref["server"].repo
        tag        = data.oci_string.ref["server"].pseudo_tag
      }
      tools = {
        kubectl = {
          image = {
            registry   = "cgr.dev"
            repository = "chainguard/kubectl"
            tag        = "latest"
          }
        }
      }
    }
    spire-agent = {
      enabled = true
      image = {
        registry   = data.oci_string.ref["agent"].registry
        repository = data.oci_string.ref["agent"].repo
        tag        = data.oci_string.ref["agent"].pseudo_tag
      }
      tools = {
        kubectl = {
          image = {
            registry   = "cgr.dev"
            repository = "chainguard/kubectl"
            tag        = "latest"
          }
        }
      }
    }
    spiffe-oidc-discovery-provider = {
      enabled = true
      image = {
        registry   = data.oci_string.ref["oidc-discovery-provider"].registry
        repository = data.oci_string.ref["oidc-discovery-provider"].repo
        tag        = data.oci_string.ref["oidc-discovery-provider"].pseudo_tag
      }
      config = {
        acme = {
          tosAccepted = true
        }
      }
      tools = {
        kubectl = {
          image = {
            registry   = "cgr.dev"
            repository = "chainguard/kubectl"
            tag        = "latest"
          }
        }
      }
      tests = {
        toolkit = {
          image = {
            repository = "chainguard/min-toolkit-debug"
            tag        = "latest"
          }
        }
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the spire helm chart."

  steps = [
    {
      name = "spire CRDs helm install"
      cmd  = module.spire_crds.install_cmd
    },
    {
      name = "spire helm install"
      cmd  = module.spire.install_cmd
    },
    {
      # shoutout to the spire chart maintainers, these tests are actually
      # pretty good!
      name = "spire helm tests"
      cmd  = <<EOF
        helm test -n spire-system spire
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
