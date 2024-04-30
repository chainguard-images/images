terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "name" {
  default = "nvidia-device-plugin"
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = var.name
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
  source    = "../../../tflib/imagetest/helm"
  name      = "nvdp"
  repo      = "https://nvidia.github.io/k8s-device-plugin"
  chart     = "nvidia-device-plugin"
  namespace = "nvidia-device-plugin"

  values = {
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = "unused@${element(split("@", var.digest), 1)}"
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the image."

  steps = [
    {
      name  = "Helm install"
      cmd   = <<EOF
        kubectl label "$(kubectl get node -o name)" --overwrite nvidia.com/gpu.present=true
      EOF
      retry = { attempts = 10, delay = "10s" }
    },
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name  = "Test filebeat"
      cmd   = <<EOF
        kubectl wait --for=jsonpath='{.status.containerStatuses[0].state.waiting.reason}'=CrashLoopBackOff pod --selector app.kubernetes.io/name=nvidia-device-plugin -n nvidia-device-plugin

        POD=$(kubectl get pod -l app.kubernetes.io/name=nvidia-device-plugin -n nvidia-device-plugin -ojsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}'); echo $POD
        kubectl logs "$POD" -n nvidia-device-plugin > /tmp/log

        grep "Starting FS watcher" /tmp/log
        grep "Starting OS watcher" /tmp/log
        grep "Incompatible platform detected" /tmp/log
      EOF
      retry = { attempts = 10, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
