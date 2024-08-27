terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "opentelemetry-collector"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

module "helm-otelc-deploy" {
  source = "../../../tflib/imagetest/helm"

  repo      = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart     = "opentelemetry-collector"
  namespace = "otelc-deploy"

  values = {
    mode = "deployment"
    configMap = {
      create : false
    }
    image = {
      digest     = local.parsed.digest
      repository = local.parsed.registry_repo
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
          name : "otelc-deploy"
          items : [
            {
              key : "custom-deploy-config.yaml"
              path : "custom-config.yaml"
            }
          ]
        }
      }
    ]
  }
}

module "helm-otelc-daemonset" {
  source = "../../../tflib/imagetest/helm"

  repo      = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart     = "opentelemetry-collector"
  namespace = "otelc-daemonset"

  values = {
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
      digest     = local.parsed.digest
      repository = local.parsed.registry_repo
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
          name : "otelc-daemonset"
          items : [
            {
              key : "custom-ds-config.yaml"
              path : "custom-config.yaml"
            }
          ]
        }
      }
    ]
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the otel-collector helm chart."

  steps = [
    {
      name = "Create namespace and configmap with custom configuration for the deployment"
      cmd  = <<EOF
        NAMESPACE=otelc-deploy
        kubectl create namespace $NAMESPACE
        kubectl create configmap $NAMESPACE --namespace $NAMESPACE --from-file=/tests/custom-deploy-config.yaml
      EOF
    },
    {
      name = "Helm deploy opentelemetry-collector as a deployment"
      cmd  = module.helm-otelc-deploy.install_cmd
    },
    {
      name = "Create namespace and configmap with custom configuration for the daemonset"
      cmd  = <<EOF
        NAMESPACE=otelc-daemonset
        kubectl create namespace $NAMESPACE
        kubectl create configmap $NAMESPACE --namespace $NAMESPACE --from-file=/tests/custom-ds-config.yaml
      EOF
    },
    {
      name = "Helm deploy opentelemetry-collector as a daemonset"
      cmd  = module.helm-otelc-daemonset.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
