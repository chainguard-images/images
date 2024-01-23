terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

resource "random_pet" "suffix" {}

resource "helm_release" "kube-prometheus-stack" {
  name       = "prometheus-config-reloader-${random_pet.suffix.id}"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  namespace        = "prometheus-config-reloader-${random_pet.suffix.id}"
  create_namespace = true

  set {
    name  = "prometheusOperator.prometheusConfigReloader.image.registry"
    value = data.oci_string.ref.registry
  }
  set {
    name  = "prometheusOperator.prometheusConfigReloader.image.repository"
    value = data.oci_string.ref.repo
  }
  set {
    name  = "prometheusOperator.prometheusConfigReloader.image.tag"
    value = data.oci_string.ref.pseudo_tag
  }
}

data "oci_exec_test" "helm_cleanup" {
  depends_on = [resource.helm_release.kube-prometheus-stack]
  digest     = var.digest
  script     = <<EOF
set -e

if ! command -v flock; then
  echo "flock not installed; please install it."
  exit 1
fi

# Run with `flock` to ensure that only one cleanup process runs at a time.
flock -e -w 1200 /tmp/prometheus-config-reloader ${path.module}/cleanup.sh
EOF

  env {
    name  = "CHART_NAME"
    value = helm_release.kube-prometheus-stack.name
  }
  env {
    name  = "NAMESPACE"
    value = helm_release.kube-prometheus-stack.namespace
  }
}
