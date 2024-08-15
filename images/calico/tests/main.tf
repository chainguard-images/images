terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "operator_version" {
  description = "The version of the Tigera operator to use for running the test."
  default     = "3.28.0"

  validation {
    condition     = length(var.operator_version) > 0
    error_message = "The operator_version must not be empty. Please provide a valid version."
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    node                  = string
    cni                   = string
    kube-controllers      = string
    pod2daemon            = string
    csi                   = string
    typha                 = string
    node-driver-registrar = string
    calicoctl             = string
    apiserver             = string
    key-cert-provisioner  = optional(string)
  })
}

locals {
  parsed        = { for k, v in var.digests : k => provider::oci::parse(v) if v != null }
  split_repo    = split("/", local.parsed["node"].repo)
  num_parts     = length(local.split_repo)
  filtered_repo = [for part in local.split_repo : part if part != local.split_repo[local.num_parts - 1]]
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "calico"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      CALICO_VERSION               = module.tigera-operator.tigera_version
      IMAGE_REGISTRY               = local.parsed["node"].registry
      IMAGE_PATH                   = join("/", local.filtered_repo)
      DIGEST_NODE                  = local.parsed["node"].digest,
      DIGEST_CNI                   = local.parsed["cni"].digest,
      DIGEST_CONTROLLERS           = local.parsed["kube-controllers"].digest,
      DIGEST_FLEXVOL               = local.parsed["pod2daemon"].digest,
      DIGEST_CSI                   = local.parsed["csi"].digest,
      DIGEST_TYPHA                 = local.parsed["typha"].digest,
      DIGEST_APISERVER             = local.parsed["apiserver"].digest,
      DIGEST_NODE_DRIVER_REGISTRAR = local.parsed["node-driver-registrar"].digest,
      DIGEST_KEY_CERT_PROVISIONER  = lookup(local.parsed, "key-cert-provisioner", null) != null ? local.parsed["key-cert-provisioner"].digest : ""
    }

    mounts = [
      {
        source      = path.module,
        destination = "/tests"
      }
    ]
  }

  hooks = {
    # the calico csi node driver tries to use the same mount as k3s (in
    # docker), so make it shared
    post_start = [
      "mount --make-shared /var/lib/kubelet",
      "mount --make-rshared /",
    ]
  }

  # Disable k3s' builtin (flannel) so we can later use the installed calico as the CNI
  disable_cni = true
}

module "tigera-operator" {
  source         = "../../tigera-operator/tests/helm"
  tigera_version = var.operator_version
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "basic"
  description = "Basic functionality of calico as a cni"

  steps = [
    {
      name = "Install tigera-operator"
      cmd  = module.tigera-operator.install_cmd
    },
    {
      name = "Install calico"
      cmd  = "/tests/run-tests.sh"
    }
  ]

  labels = {
    type = "k8s"
  }
}
