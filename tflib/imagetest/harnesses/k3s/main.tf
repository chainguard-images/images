terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
    apko      = { source = "chainguard-dev/apko" }
  }
}

variable "name" {
  description = "The name of the harness."
  default     = ""
}

variable "inventory" {
  description = "The inventory where the harness will be registered; one will be created if not specified."
  default     = null
}

variable "target_repository" {
  description = "The repository where the sandbox image will be pushed."
}

variable "cwd" {
  description = "The current working directory of the image's tests. This is almost always just 'path.module'."
}

variable "envs" {
  description = "Environment variables to set in the sandbox."
  type        = map(string)
  default     = {}
}

variable "extra_packages" {
  description = "Packages to add to the sanbox."
  type        = list(string)
  default     = []
}

variable "k3s_image" {
  description = "The image to use for the k3s cluster."
  # Null this means use the default set by the provider.
  default = null
}

variable "resources" {
  default = {
    cpu = {
      request = ""
    }
    memory = {
      request = ""
    }
  }

  type = object({
    cpu = object({
      request = string
    })
    memory = object({
      request = string
    })
  })
}

variable "mounts" {
  description = "Additional mounts to add to container"
  type = list(object({
    source      = string
    destination = string
  }))
  default = []
}

variable "extra_post_start_hooks" {
  description = "additional post_start hooks for the k3s cluster"
  type        = list(string)
  default     = []
}

variable "disable_network_policy" {
  description = "When true, the builtin network policy controller will be disabled."
  default     = false
}
variable "disable_cni" {
  description = "When true, the builtin (flannel) CNI will be disabled."
  default     = false
}

locals {
  inventory = var.inventory != null ? var.inventory : data.imagetest_inventory.this[0]
  name      = var.name != "" ? var.name : basename(var.cwd)
}

data "apko_config" "sandbox" {
  extra_packages = concat([
    "apk-tools",
    "bash",
    "busybox",
    "curl",
    "git",
    "helm",
    "k9s",
    "kubectl",
    "kustomize",
    "patch",
    "wolfi-base",
    "wget",
  ], var.extra_packages)
  config_contents = jsonencode({
    accounts   = { run-as = 0 }
    entrypoint = { command = "tail -f /dev/null" }
    work-dir   = "/it/work"
    environment = {
      "WORK" : "/it/work",
      "LIBS" : "/it/lib",
    }
  })
}

resource "apko_build" "sandbox" {
  # NOTE: This uses the same repo as the image being tested, but since it is
  # never tagged it is never synced downstream.
  repo   = var.target_repository
  config = data.apko_config.sandbox.config
}

module "test_libs" { source = "../../libs/" }

data "imagetest_inventory" "this" {
  count = var.inventory != null ? 0 : 1
}

resource "imagetest_harness_k3s" "this" {
  name      = local.name
  inventory = local.inventory
  image     = var.k3s_image

  resources = var.resources

  disable_cni            = var.disable_cni
  disable_network_policy = var.disable_network_policy

  sandbox = {
    image = apko_build.sandbox.image_ref
    # TODO: Replace these mounts (which are not concurent-safe) with an
    # `oci_append` image which offers a truer workspace sandbox independent
    # across tests.
    mounts = concat([
      {
        # Test directory
        source      = var.cwd
        destination = "/it/work"
      },
    ], module.test_libs.mounts, var.mounts)

    envs = var.envs
  }

  hooks = {
    # many drivers require using same mount as k3s, so make it shared
    post_start = concat(
      [
        "mount --make-shared /var/lib/kubelet",
        "mount --make-rshared /",
      ],
      var.extra_post_start_hooks
    )
  }
}

output "harness" {
  value = imagetest_harness_k3s.this
}
