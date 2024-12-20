variable "target_repository" {
  type        = string
  description = "The repository to publish to (e.g., cgr.dev/chainguard/foo)."
}

variable "config" {
  type        = string
  description = "The YAML-encoded locked image config."
}

variable "extra_packages" {
  type        = list(string)
  default     = []
  description = "Extra packages to install in the image."
}

variable "extra_dev_packages" {
  type        = list(string)
  default     = []
  description = "Extra packages to install in the dev variant of the image. This makes build-dev default to true."
}

variable "check-apk-update" {
  type        = bool
  default     = false
  description = "This variable does nothing."
}

variable "build-dev" {
  type        = bool
  default     = false
  description = "If true, build a dev variant of the image. If extra_dev_packages is non-empty, then build-dev is implicitly true."
}

variable "update-repo" {
  type        = bool
  default     = true
  description = "Whether to update the Chainguard image repo resource."
}

variable "check-sbom" {
  type        = bool
  default     = true
  description = "Whether to run the NTIA conformance checker over the images we produce prior to attesting the SBOMs."
}

// Note: unused
variable "main_package" {
  type        = string
  default     = ""
  description = "If set, this determines which package in the image will be used to generate version tags."
}

variable "origin_package" {
  type        = string
  description = "This determines which is the origin package in the image when it differs from the main package. e.g. kubectl origin package is kubernetes."
  default     = ""
}

// Note: unused
variable "eol" {
  type        = bool
  default     = false
  description = "If provided, this image will be marked as EOL via attestation (predicateType: https://chainguard.dev/end-of-life)"
}

variable "name" {
  type        = string
  description = "Name of the image, which gets used in the image annotations."
}

locals {
  build-dev = var.build-dev || length(var.extra_dev_packages) > 0
}

output "path" {
  value = basename(path.cwd)
}

locals {
  updated_config = merge(yamldecode(var.config),
    { "annotations" = {
      "org.opencontainers.image.authors" : "Chainguard Team https://www.chainguard.dev/",
      "org.opencontainers.image.url" : "https://images.chainguard.dev/directory/image/${var.name}/overview",
      "org.opencontainers.image.source" : "https://github.com/chainguard-images/images/tree/main/images/${var.name}",
      "org.opencontainers.image.vendor" : "Chainguard",
      "dev.chainguard.package.main" : (var.origin_package == "" ? var.main_package : var.origin_package),
      },
    },
  )
}

module "this" {
  source  = "chainguard-dev/apko/publisher"
  version = "0.0.17"

  target_repository = var.target_repository
  config            = yamlencode(local.updated_config)
  extra_packages    = var.extra_packages

  check_sbom = var.check-sbom
  spdx_image = "ghcr.io/wolfi-dev/spdx-tools:latest@sha256:884a57d646f24c7ac09f90b9049234e9d5a1e36ef8811676138d0f38dc3a23d6"
}

module "this-dev" {
  count   = local.build-dev ? 1 : 0
  source  = "chainguard-dev/apko/publisher"
  version = "0.0.17"

  target_repository = var.target_repository

  # Make the dev variant an explicit extension of the
  # locked original.
  config = jsonencode(module.this.config)
  extra_packages = concat([
    "apk-tools",
    "bash",
    "busybox",
    "git",
    "wget",
  ], var.extra_dev_packages)

  check_sbom = var.check-sbom
  spdx_image = "ghcr.io/wolfi-dev/spdx-tools:latest@sha256:884a57d646f24c7ac09f90b9049234e9d5a1e36ef8811676138d0f38dc3a23d6"
}

data "oci_exec_test" "check-reproducibility" {
  digest = module.this.image_ref
  script = "${path.module}/check-reproducibility.sh"

  # TODO(jonjohnson): Make this faster!
  # Currently some builds (e.g. golang) take more than the
  # default 5m, so give them 10m
  timeout_seconds = 600
}

data "oci_structure_test" "structure" {
  digest = data.oci_exec_test.check-reproducibility.tested_ref

  conditions {
    env {
      key   = "SSL_CERT_FILE"
      value = "/etc/ssl/certs/ca-certificates.crt"
    }
    // TODO: Some images have different PATHs
    //env {
    //  key   = "PATH"
    //  value = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    //}
    files { path = "/etc/ssl/certs/ca-certificates.crt" }
    files { path = "/lib/apk/db/installed" }
    files { path = "/etc/os-release" } // TODO: we can check the contents
  }

  lifecycle {
    precondition {
      condition     = module.this.config.annotations["org.opencontainers.image.authors"] == "Chainguard Team https://www.chainguard.dev/"
      error_message = "image.authors annotation must be Chainguard Team (got '${module.this.config.annotations["org.opencontainers.image.authors"]}')"
    }
    precondition {
      condition     = startswith(module.this.config.annotations["org.opencontainers.image.url"], "https://images.chainguard.dev/directory/image/")
      error_message = "image.url annotation must be images.chainguard.dev (got '${module.this.config.annotations["org.opencontainers.image.url"]}')"
    }
    precondition {
      condition     = startswith(module.this.config.annotations["org.opencontainers.image.source"], "https://github.com/chainguard-images/images/tree/main/images/")
      error_message = "image.source annotation must be github.com/chainguard-images (got '${module.this.config.annotations["org.opencontainers.image.source"]}')"
    }
    precondition {
      condition     = module.this.config.annotations["org.opencontainers.image.vendor"] == "Chainguard"
      error_message = "image.vendor annotation must be Chainguard (got '${module.this.config.annotations["org.opencontainers.image.vendor"]}')"
    }
  }
}

output "image_ref" {
  value = data.oci_structure_test.structure.tested_ref
}

output "dev_ref" {
  depends_on = [data.oci_structure_test.structure]
  value      = local.build-dev ? module.this-dev[0].image_ref : ""
}

output "config" {
  value = module.this.config
}

// A form of tag_map that includes "latest" tags.
output "latest_tag_map" {
  value = merge(
    { "latest" : data.oci_structure_test.structure.tested_ref },
    local.build-dev ? { "latest-dev" : module.this-dev[0].image_ref } : {},
  )
}

# Just return "latest" and "latest-dev" to
# plumb into the image summary
output "tag_list" {
  value = flatten(["latest", local.build-dev ? ["latest-dev"] : []])
}
