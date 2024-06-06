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

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

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
          tag        = local.parsed["kas"].pseudo_tag
          repository = local.parsed["kas"].registry_repo
        }
      }
      gitlab-exporter = {
        image = {
          tag        = local.parsed["exporter"].pseudo_tag
          repository = local.parsed["exporter"].registry_repo
        }
        extraEnv = {
          CONFIG_FILENAME = "gitlab-exporter.yml"
        }
      }
      gitlab-pages = {
        image = {
          tag        = local.parsed["pages"].pseudo_tag
          repository = local.parsed["pages"].registry_repo
        }
        resources = {
          requests = {
            memory = "250M"
            cpu    = "50m"
          }
        }
      }
      webservice = {
        minReplicas = 1
        maxReplicas = 1
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
        minReplicas = 1
        maxReplicas = 1
        image = {
          tag        = local.parsed["shell"].pseudo_tag
          repository = local.parsed["shell"].registry_repo
        }
      }
    }
    postgresql = {
      image = {
        tag = "13.6.0"
      }
    }
    certmanager = {
      # NOTE: Explicitly disabled since it sometimes conflicts with the
      # cert-manager tests.
      install = false
    }
    prometheus = {
      install = false
    }
    gitlab-runner = {
      # TODO: This won't work without a valid cert, which we explicitly
      # disable. Use a more real but still fake cert when we want to enable
      # this.
      install = false
    }
    registry = {
      hpa = { minReplicas = 1, maxReplicas = 1 }
    }
    global = {
      ingress = {
        configureCertmanager = false
      }
      pages = {
        enabled = true
      }
      hosts = {
        domain     = "example.com"
        externalIP = "10.10.10.10"
      }
    }
    nginx-ingress = {
      controller = {
        replicaCount = 1
        minAvailable = 1
        resources = {
          requests = {
            cpu = "20m"
          }
        }
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
