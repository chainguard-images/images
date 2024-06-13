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
  })
}

variable "chart_version" {
  description = "The version of the Cilium to install. This chooses the Helm chart"
  type        = string
  default     = "1.14.6"
}

# data "oci_exec_test" "cilium-install" {
#   script          = "${path.module}/cilium-install.sh"
#   digest          = var.digests.agent
#   timeout_seconds = 1200
#   env = [{
#     name  = "AGENT_IMAGE"
#     value = var.digests.agent
#     }, {
#     name  = "HUBBLE_RELAY_IMAGE"
#     value = var.digests.hubble-relay
#     }, {
#     name  = "HUBBLE_UI_IMAGE"
#     value = var.digests.hubble-ui
#     }, {
#     name  = "HUBBLE_UI_BACKEND_IMAGE"
#     value = var.digests.hubble-ui-backend
#     }, {
#     name  = "OPERATOR_IMAGE"
#     value = var.digests.operator
#     }, {
#     name  = "CHART_VERSION"
#     value = var.chart_version
#     }, {
#     name  = "CLUSTER_NAME"
#     value = "cilium-test-${random_id.suffix.hex}"
#   }]
# }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "cilium"
  inventory = data.imagetest_inventory.this

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
      name = "Run tests"
      cmd  = "/test/cilium-install.sh"
    }
  ]

  labels = {
    type = "k8s"
  }
}
