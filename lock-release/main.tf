terraform {
  required_providers {
    apko       = { source = "chainguard-dev/apko" }
    oci        = { source = "chainguard-dev/oci" }
    cosign     = { source = "chainguard-dev/cosign" }
    chainguard = { source = "chainguard-dev/chainguard" }
  }

  backend "inmem" {}
}

variable "target_repository" {
  type        = string
  description = "Root registry for image publication."
}

variable "image_name" {
  type        = string
  description = "Image directory name to build. Must have a locked_config.json in images/<image_name>/."
}

variable "skip-tagging" {
  type        = bool
  default     = false
  description = "Whether to skip tagging after builds."
}

variable "archs" {
  type        = list(string)
  default     = ["x86_64", "aarch64"]
  description = "The architectures to build for. If empty, defaults to x86_64 and aarch64."
}

variable "extra_keyring" {
  type        = list(string)
  default     = []
  description = "Extra keyrings to use when finding packages."
}

provider "apko" {
  default_archs = var.archs
  extra_keyring = var.extra_keyring

  size_limits = {
    apk_control_max_size            = -1
    apk_data_max_size               = -1
    apk_index_decompressed_max_size = -1
    http_response_max_size          = -1
  }
}

provider "cosign" { default_attestation_entry_type = "dsse" }

locals {
  lock  = jsondecode(file("${path.module}/../images/${var.image_name}/locked_config.json"))
  locks = local.lock.imageLocks

  # Only entries that have a populated devConfigs map.
  dev_locks = { for k, v in local.locks : k => v if can(v.devConfigs) && length(v.devConfigs) > 0 }
}

module "build" {
  for_each = local.locks
  source   = "../tflib/publisher"

  # configs["index"] is a JSON string of {"config": {<apko config>}}.
  # We decode to extract the inner config object, then re-encode as JSON
  # (valid YAML) for the publisher's yamldecode() call.
  config = jsonencode(jsondecode(each.value.configs["index"]).config)

  target_repository = "${var.target_repository}/${split("/", each.value.repo)[1]}"
  name              = split("/", each.value.repo)[1]
  build-dev         = false
  update-repo       = false
}

// Only builds if devConfigs are populated in the lock file.
module "build-dev" {
  for_each = local.dev_locks
  source   = "../tflib/publisher"

  config = jsonencode(jsondecode(each.value.devConfigs["index"]).config)

  target_repository = "${var.target_repository}/${split("/", each.value.repo)[1]}"
  name              = split("/", each.value.repo)[1]
  build-dev         = false
  update-repo       = false
}

module "tagger" {
  for_each = var.skip-tagging ? {} : local.locks
  source   = "../tflib/tagger"
  tags     = { for tag in each.value.tags : tag => module.build[each.key].image_ref }
}

# Dev tags are the prod tags with a "-dev" suffix appended.
module "tagger-dev" {
  for_each = var.skip-tagging ? {} : local.dev_locks
  source   = "../tflib/tagger"
  tags     = { for tag in local.locks[each.key].tags : "${tag}-dev" => module.build-dev[each.key].image_ref }
}
