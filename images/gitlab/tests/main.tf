terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    kas      = string
    pages    = string
    shell    = string
    exporter = string
  })
}

resource "random_pet" "suffix" {}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "helm_release" "gitlab" {
  name = "gitlab"

  repository = "https://charts.gitlab.io"
  chart      = "gitlab"

  namespace        = "gitlab-${random_pet.suffix.id}"
  create_namespace = true

  timeout = 400

  // Set to false to then wait for the specific images are deployed
  wait = false

  values = [jsonencode({
    gitlab = {
      kas = {
        image = {
          tag        = data.oci_string.ref["kas"].pseudo_tag
          repository = data.oci_string.ref["kas"].registry_repo
        }
      }
      gitlab-exporter = {
        image = {
          tag        = data.oci_string.ref["exporter"].pseudo_tag
          repository = data.oci_string.ref["exporter"].registry_repo
        }
        extraEnv = {
          CONFIG_FILENAME = "gitlab-exporter.yml"
        }
      }
      gitlab-pages = {
        image = {
          tag        = data.oci_string.ref["pages"].pseudo_tag
          repository = data.oci_string.ref["pages"].registry_repo
        }
        resources = {
          requests = {
            memory = "250M"
            cpu    = "50m"
          }
        }
      }
      webservice = {
        resources = {
          requests = {
            cpu    = "50m"
            memory = "250M"
          }
        }
      }
      sidekiq = {
        enabled = false
      }
      gitlab-shell = {
        image = {
          tag        = data.oci_string.ref["shell"].pseudo_tag
          repository = data.oci_string.ref["shell"].registry_repo
        }
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
      pages = {
        enabled = true
      }
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
  script     = "kubectl rollout status deploy -n ${helm_release.gitlab.namespace} gitlab-kas --timeout 360s"
}

# Wait for the gitlab-pages to come up
data "oci_exec_test" "install-pages-up" {
  depends_on = [helm_release.gitlab]
  digest     = var.digests.pages
  script     = "kubectl rollout status deploy -n ${helm_release.gitlab.namespace} gitlab-gitlab-pages --timeout 360s"
}

# Wait for the gitlab-shell to come up
data "oci_exec_test" "install-shell-up" {
  depends_on = [helm_release.gitlab]
  digest     = var.digests.shell
  script     = "kubectl rollout status deploy -n ${helm_release.gitlab.namespace} gitlab-gitlab-shell --timeout 360s"
}

# Wait for the gitlab-exporter to come up
data "oci_exec_test" "install-exporter-up" {
  depends_on = [helm_release.gitlab]
  digest     = var.digests.exporter
  script     = "kubectl rollout status deploy -n ${helm_release.gitlab.namespace} gitlab-gitlab-exporter --timeout 360s"
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.install-kas-up, data.oci_exec_test.install-pages-up, data.oci_exec_test.install-shell-up, data.oci_exec_test.install-exporter-up]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.gitlab.id
  namespace  = helm_release.gitlab.namespace
}
