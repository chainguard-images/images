terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "open-telemetry-daemonset" {
  name = "open-telemetry"

  repository       = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart            = "opentelemetry-collector"
  namespace        = "open-telemetry-daemonset"
  create_namespace = true

  values = [jsonencode({
    mode = "deployment"
    image = {
      digest     = data.oci_string.ref.digest
      repository = "${data.oci_string.ref.registry}/${data.oci_string.ref.repo}"
    }
  })]
}

data "oci_exec_test" "custom-config" {
  digest = var.digest
  script = "${path.module}/custom_config.sh"
}

resource "helm_release" "open-telemetry-custom-config" {
  name = "open-telemetry"

  repository       = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart            = "opentelemetry-collector"
  namespace        = "open-telemetry-custom-config"
  create_namespace = false

  values = [jsonencode({
    mode = "daemonset"
    configMap = {
      create : false
    }
    image = {
      digest     = data.oci_string.ref.digest
      repository = "${data.oci_string.ref.registry}/${data.oci_string.ref.repo}"
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
          name : "custom"
        }
      }
    ]
  })]
  depends_on = [data.oci_exec_test.custom-config]
}
