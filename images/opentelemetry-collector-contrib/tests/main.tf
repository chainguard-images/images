terraform {
  required_providers {
    oci        = { source = "chainguard-dev/oci" }
    helm       = { source = "hashicorp/helm" }
    kubernetes = { source = "hashicorp/kubernetes" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "open-telemetry-deploy" {
  name = "otelc"

  repository       = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart            = "opentelemetry-collector"
  namespace        = "otelc-deploy"
  create_namespace = true

  // After https://github.com/open-telemetry/opentelemetry-helm-charts/pull/892 we
  // fail to install because of unrecognized exporters.
  version = "0.69.0"

  values = [jsonencode({
    mode = "deployment"
    image = {
      digest     = data.oci_string.ref.digest
      repository = data.oci_string.ref.registry_repo
    }
    # Enable everything testable for a deployment based install
    presets = {
      clusterMetrics       = { enabled = true }
      kubernetesAttributes = { enabled = true }
      kubeletMetrics       = { enabled = true }
      hostMetrics          = { enabled = true }
      logsCollection = {
        enabled              = true
        includeCollectorLogs = true
      }
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.open-telemetry-deploy.id
  namespace = helm_release.open-telemetry-deploy.namespace
}

resource "kubernetes_namespace" "open-telemetry-custom-config" {
  metadata {
    name = "otelc-daemonset"
  }
}

resource "kubernetes_config_map" "open-telemetry-custom-config" {
  metadata {
    name      = "otelc-daemonset-custom-config"
    namespace = kubernetes_namespace.open-telemetry-custom-config.metadata[0].name
  }

  data = {
    "custom-config.yaml" = file("${path.module}/custom-config.yaml")
  }
}

resource "helm_release" "open-telemetry-custom-config" {
  name = "otelc-daemonset"

  repository       = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart            = "opentelemetry-collector"
  namespace        = kubernetes_namespace.open-telemetry-custom-config.metadata[0].name
  create_namespace = false

  values = [jsonencode({
    mode = "daemonset"
    configMap = {
      create : false
    }
    # Enable testable daemonset things not covered by Deployment install
    presets = {
      # clusterMetrics       = { enabled = true }
      kubernetesAttributes = { enabled = true }
      kubeletMetrics       = { enabled = true }
    }
    image = {
      digest     = data.oci_string.ref.digest
      repository = data.oci_string.ref.registry_repo
    }
    command = {
      extraArgs = [
        "--config=/conf/custom-config.yaml"
      ]
    }
    extraVolumeMounts : [
      {
        name : "custom-vm",
        mountPath : "/conf"
      }
    ]
    extraVolumes : [
      {
        name : "custom-vm",
        configMap : {
          name : kubernetes_config_map.open-telemetry-custom-config.metadata[0].name
        }
      }
    ]
  })]
}

module "custom_helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.open-telemetry-custom-config.id
  namespace = helm_release.open-telemetry-custom-config.namespace
}
