terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "license_key" {}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    prometheus-configurator = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "helm_release" "nri-bundle" {
  name       = "nri-bundle"
  namespace  = "default"
  repository = "https://helm-charts.newrelic.com"
  chart      = "nri-bundle"

  values = [
    jsonencode({
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
          agent = {
            registry   = data.oci_string.ref["infrastructure-bundle"].registry
            repository = data.oci_string.ref["infrastructure-bundle"].repo
            tag        = data.oci_string.ref["infrastructure-bundle"].pseudo_tag
          }
        }
      }

      nri-prometheus = {
        enabled = true
        image = {
          registry   = data.oci_string.ref["prometheus"].registry
          repository = data.oci_string.ref["prometheus"].repo
          tag        = data.oci_string.ref["prometheus"].pseudo_tag
        }
      }

      newrelic-logging = {
        enabled = true
        image = {
          # `registry` doesn't exist here, it isn't consistent with the rest of the subcharts
          repository = data.oci_string.ref["fluent-bit-output"].registry_repo
          tag        = data.oci_string.ref["fluent-bit-output"].pseudo_tag
        }
      }

      newrelic-prometheus-agent = {
        enabled = true
        images = {
          configurator = {
            registry   = data.oci_string.ref["prometheus-configurator"].registry
            repository = data.oci_string.ref["prometheus-configurator"].repo
            tag        = data.oci_string.ref["prometheus-configurator"].pseudo_tag
          }
          prometheus = {
            registry   = "cgr.dev"
            repository = "chainguard/prometheus"
            tag        = "latest"
          }
        }
      }

      nri-metadata-injection       = { enabled = false }
      kube-state-metrics           = { enabled = false }
      newrelic-pixie               = { enabled = false }
      pixie-chart                  = { enabled = false }
      newrelic-infra-operator      = { enabled = false }
      newrelic-k8s-metrics-adapter = { enabled = false }
    })
  ]
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.nri-bundle.id
}
