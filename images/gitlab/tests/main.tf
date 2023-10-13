terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    kas = string
  })
}

variable "namespace" {
  description = "The namespace to install Gitlab in."
}

// Invoke the image's version command.
// $IMAGE_NAME is populated with the image name by digest.
// TODO: Update or remove this test as appropriate.
data "oci_exec_test" "kas-version" {
  digest = var.digests.kas
  script = "docker run --rm $IMAGE_NAME -v"
}

resource "random_pet" "suffix" {}

locals {
  namespace = "gitlab-${random_pet.suffix.id}"
}

data "oci_string" "kas-ref" { input = var.digests.kas }

resource "helm_release" "gitlab" {
  name = "gitlab"

  repository = "https://charts.gitlab.io"
  chart      = "gitlab"

  namespace        = local.namespace
  create_namespace = true

  timeout = 400

  // Set to false to then wait for the specific images are deployed
  wait = false

  values = [jsonencode({
    gitlab = {
      kas = {
        image = {
          tag        = data.oci_string.kas-ref.pseudo_tag
          repository = data.oci_string.kas-ref.registry_repo
        }
      }
      webservice = {
        enabled = false
      }
      sidekiq = {
        enabled = false
      }
    }
    postgresql = {
      image = {
        tag = "13.6.0"
      }
    }
    certmanager-issuer = {
      email = "me@example.com"
    }
    prometheus = {
      install = false
    }
    gitlab-runner = {
      install = false
    }
    global = {
      hosts = {
        domain     = "example.com"
        externalIP = "10.10.10.10"
      }
    }
  })]
}

# Wait for the KAS agent to come up
data "oci_exec_test" "install-kas-up" {
  depends_on = [helm_release.gitlab]
  digest     = var.digests.kas
  script     = "kubectl rollout status deploy -n ${local.namespace} gitlab-kas --timeout 360s"
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.install-kas-up]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.gitlab.id
  namespace  = local.namespace
}
