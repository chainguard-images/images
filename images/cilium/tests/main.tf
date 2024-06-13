terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The digests to run tests over."
  type = object({
    agent             = string
    hubble-relay      = string
    hubble-ui         = string
    hubble-ui-backend = string
    operator          = string
    k3s-image         = string
  })
}

variable "chart_version" {
  description = "The version of the Cilium to install. This chooses the Helm chart"
  type        = string
  default     = "1.15.5"
}

data "imagetest_inventory" "this" {}

module "helm" {
  source        = "../../../tflib/imagetest/helm"
  name          = "cilium"
  namespace     = "kube-system"
  repo          = "https://helm.cilium.io/"
  chart         = "cilium"
  chart_version = var.chart_version

  values = {
    hubble = {
      relay = {
        enabled = true
        image = {
          override = var.digests.hubble-relay
        }
      }
      ui = {
        enabled = true
        frontend = {
          image = {
            override = var.digests.hubble-ui
          }
        }
        backend = {
          image = {
            override = var.digests.hubble-ui-backend
          }
        }
      }
    }
    image = {
      override = var.digests.agent
    }
    operator = {
      replicas = 1
      image = {
        override = var.digests.operator
      }
    }
  }
}

resource "imagetest_harness_k3s" "this" {
  name      = "cilium"
  inventory = data.imagetest_inventory.this
  image     = var.digests.k3s-image

  disable_network_policy = true
  disable_cni            = true

  sandbox = {
    mounts = [{
      source      = path.module
      destination = "/test"
    }]

    envs = {
      AGENT_IMAGE             = var.digests.agent
      HUBBLE_RELAY_IMAGE      = var.digests.hubble-relay
      HUBBLE_UI_IMAGE         = var.digests.hubble-ui
      HUBBLE_UI_BACKEND_IMAGE = var.digests.hubble-ui-backend
      OPERATOR_IMAGE          = var.digests.operator
      CHART_VERSION           = var.chart_version
    }
  }

  hooks = {
    post_start = [
      # Cilium needs shared /sys/fs/bpf
      # https://github.com/cilium/cilium/issues/32357
      # https://github.com/k3d-io/k3d/pull/1268
      <<EOF
        mount bpffs -t bpf /sys/fs/bpf
        mount --make-shared /sys/fs/bpf
        mkdir -p /run/cilium/cgroupv2
        mount -t cgroup2 none /run/cilium/cgroupv2
        mount --make-shared /run/cilium/cgroupv2/
        mount --make-rshared /
      EOF
    ]
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Functionality tests for cilium"

  steps = [
    {
      name = "Install helm"
      cmd  = module.helm.install_cmd
      }, {
      name = "Run tests"
      cmd  = "/test/cilium-install.sh"
    }
  ]

  labels = {
    type = "k8s"
  }
}
