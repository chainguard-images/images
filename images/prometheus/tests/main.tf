terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    alertmanager           = string
    core                   = string
    config-reloader        = string
    elasticsearch-exporter = string
    mysqld-exporter        = string
    operator               = string
    postgres-exporter      = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "oci_exec_test" "version" {
  for_each = var.digests
  digest   = each.value
  script   = "docker run --rm $${IMAGE_NAME} --version"
}

data "oci_exec_test" "healthy" {
  digest = var.digests["core"]
  script = "${path.module}/02-healthy.sh"
}

resource "helm_release" "kube-prometheus-stack" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  values = [
    jsonencode({
      prometheusOperator = {
        prometheusConfigReloader = {
          image = {
            registry   = data.oci_string.ref["config-reloader"].registry,
            repository = data.oci_string.ref["config-reloader"].repo,
            tag        = data.oci_string.ref["config-reloader"].pseudo_tag,
          }
        }
        image = {
          registry   = data.oci_string.ref["operator"].registry,
          repository = data.oci_string.ref["operator"].repo,
          tag        = data.oci_string.ref["operator"].pseudo_tag,
        }
      }
    })
  ]
}

