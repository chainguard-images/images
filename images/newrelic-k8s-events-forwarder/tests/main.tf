terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "license_key" {}

variable "target_repository" {}

variable "digest" {
  description = "The image digests to run tests over."
  type        = string
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  repo  = "https://helm-charts.newrelic.com"
  chart = "nri-bundle"

  values = {
    global = {
      cluster    = "test"
      licenseKey = var.license_key
    }

    newrelic-infrastructure = {
      privileged = true
      kubelet = {
        // We use some extra volume mounts needed when running in a docker-in-docker environment
        extraVolumeMounts = [{
          mountPath = "/var/run/newrelic-infra"
          name      = "var-run-newrelic-infra"
        }]
        extraVolumes = [{
          hostPath = {
            path = "/var/run/newrelic-infra"
          }
          name = "var-run-newrelic-infra"
        }]
      }
      images = {
        forwarder = {
          registry   = local.parsed.registry
          repository = local.parsed.repo
          tag        = local.parsed.pseudo_tag
        }
      }
    }

    nri-kube-events = {
      enabled = true
      images = {
        agent = {
          registry   = local.parsed.registry
          repository = local.parsed.repo
          tag        = local.parsed.pseudo_tag
        }
      }
    }

    kube-state-metrics = {
      enabled = true
    }

    nri-metadata-injection       = { enabled = false }
    newrelic-pixie               = { enabled = false }
    pixie-chart                  = { enabled = false }
    newrelic-infra-operator      = { enabled = false }
    newrelic-k8s-metrics-adapter = { enabled = false }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Helm Install"
      cmd  = module.helm.install_cmd
    }
  ]

  labels = {
    type = "k8s"
  }
}