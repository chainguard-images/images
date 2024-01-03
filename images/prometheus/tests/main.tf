terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    alertmanager    = string
    core            = string
    mysqld-exporter = string
    pushgateway     = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "oci_exec_test" "version" {
  for_each = { for k, v in var.digests : k => v }
  digest   = each.value
  script   = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "healthy" {
  digest = var.digests["core"]
  script = "${path.module}/02-healthy.sh"
}

resource "random_pet" "suffix" {}

resource "helm_release" "kube-prometheus-stack" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  namespace        = "prometheus"
  create_namespace = true

  // NOTE: we use "set" over "values" here because the upstream
  // values.yaml is 4000 lines long, and it isn't worth trying
  // to sort out which of the many knobs to stand things up properly.

  // prometheus
  set {
    name  = "prometheus.prometheusSpec.image.registry"
    value = data.oci_string.ref["core"].registry
  }
  set {
    name  = "prometheus.prometheusSpec.image.repository"
    value = data.oci_string.ref["core"].repo
  }
  set {
    name  = "prometheus.prometheusSpec.image.sha"
    value = trimprefix(data.oci_string.ref["core"].digest, "sha256:")
  }

  // alertmanager
  set {
    name  = "alertmanager.alertmanagerSpec.image.registry"
    value = data.oci_string.ref["alertmanager"].registry
  }
  set {
    name  = "alertmanager.alertmanagerSpec.image.repository"
    value = data.oci_string.ref["alertmanager"].repo
  }
  set {
    name  = "alertmanager.alertmanagerSpec.image.sha"
    value = trimprefix(data.oci_string.ref["alertmanager"].digest, "sha256:")
  }

  // Test with our kube-state-metrics, even if its not a fresh build.
  set {
    name  = "kube-state-metrics.image.registry"
    value = "cgr.dev"
  }
  set {
    name  = "kube-state-metrics.image.repository"
    value = "chainguard/kube-state-metrics"
  }
  set {
    name  = "kube-state-metrics.image.tag"
    value = "latest"
  }
}


resource "helm_release" "pushgateway" {
  name       = "pushgateway-${random_pet.suffix.id}"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-pushgateway"

  namespace        = "prometheus-pushgateway"
  create_namespace = true

  set {
    name  = "image.repository"
    value = data.oci_string.ref["pushgateway"].registry_repo
  }
  set {
    name  = "image.tag"
    value = data.oci_string.ref["pushgateway"].pseudo_tag
  }
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.kube-prometheus-stack.id
  namespace = helm_release.kube-prometheus-stack.namespace
}
