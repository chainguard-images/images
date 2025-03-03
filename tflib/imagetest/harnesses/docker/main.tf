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

variable "use_data_volume" {
  description = "Whether to create and use a module mounted in /data"
  type        = bool
  default     = false
}

variable "mounts" {
  description = "Additional mounts to add to container"
  type = list(object({
    source      = string
    destination = string
  }))
  default = []
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

module "test_libs" { source = "../../libs/" }

data "imagetest_inventory" "this" {
  count = var.inventory != null ? 0 : 1
}

resource "imagetest_container_volume" "volume" {
  count     = var.use_data_volume ? 1 : 0
  name      = "data-volume"
  inventory = local.inventory
}

resource "imagetest_harness_docker" "this" {
  name      = local.name
  inventory = local.inventory

  packages = concat([
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

  volumes = concat([],
    (var.use_data_volume ? [
      {
        source      = imagetest_container_volume.volume[0],
        destination = "/data"
      },
    ] : [])
  )

  mounts = concat([
    {
      source      = var.cwd
      destination = "/it/work"
    }
  ], module.test_libs.mounts, var.mounts)

  envs = merge(
    {
      "WORK" : "/it/work",
      "LIBS" : "/it/lib",
    },
    (var.use_data_volume ? {
      "DATA_VOLUME_ID" : imagetest_container_volume.volume[0].id
    } : {}),
    var.envs
  )
}

output "harness" {
  value = imagetest_harness_docker.this
}
