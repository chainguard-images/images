terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    agent         = string
    cluster-agent = string
  })
}

variable "namespace" {
  default = "datadog-agent-system"
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "datadog-agent"
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

module "helm" {
  source = "../../../tflib/imagetest/helm"

  namespace = var.namespace
  repo      = "https://helm.datadoghq.com"
  chart     = "datadog"

  # https://github.com/DataDog/helm-charts/blob/main/examples/datadog/agent_basic_values.yaml
  values = {
    agents = {
      image = {
        repository    = data.oci_string.ref["agent"].registry_repo
        tag           = data.oci_string.ref["agent"].pseudo_tag
        doNotCheckTag = true # pseudo_tag
      }
    }
    clusterAgent = {
      image = {
        repository    = data.oci_string.ref["cluster-agent"].registry_repo
        tag           = data.oci_string.ref["cluster-agent"].pseudo_tag
        doNotCheckTag = true # pseudo_tag
      }
    }
    targetSystem = "linux"
    datadog = {
      apiKey      = "dummy"
      clusterName = "chainguard"
      dd_url      = "http://fakeintake.${var.namespace}.svc.cluster.local"
      logs = {
        enabled                    = true
        containerCollectAll        = false
        containerCollectUsingFiles = true
      }
      apm = {
        portEnabled    = true
        socketPath     = "/var/run/datadog/apm.socket"
        hostSocketPath = "/var/run/datadog/"
      }
      processAgent = {
        enabled           = true
        processCollection = false
      }
      systemProbe = {
        # These don't work on k3d/kind clusters
        enabled = false
      }
      env = [
        {
          name = "DD_HOSTNAME"
          valueFrom = {
            fieldRef = {
              fieldPath = "spec.nodeName"
            }
          }
        }
      ]
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Basic datadog-agent Helm install test"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Setup fakeintake"
      cmd  = "kubectl apply --wait -f /tests/fakeintake.yaml"
    },
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      # The chart doesn't check this for us because of the DS healthchecks, but
      # they do emit proper readiness signals
      name  = "Check datadog-agent pods"
      cmd   = "kubectl wait --for=condition=Ready pods --all --namespace ${var.namespace}"
      retry = { attempts = 5, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s",
  }
}
