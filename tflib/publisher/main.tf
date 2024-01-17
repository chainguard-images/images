terraform {
  required_providers {
    cosign = {
      source  = "chainguard-dev/cosign"
      version = "0.0.17"
    }
    apko = {
      source  = "chainguard-dev/apko"
      version = "0.13.1"
    }
    oci = {
      source  = "chainguard-dev/oci"
      version = "0.0.10"
    }
  }
}

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

variable "build-dev" {
  type        = bool
  default     = false
  description = "If true, build a dev variant of the image. If extra_dev_packages is non-empty, then build-dev is implicitly true."
}

variable "check-sbom" {
  type        = bool
  default     = false
  description = "Whether to run the NTIA conformance checker over the images we produce prior to attesting the SBOMs."
}

variable "main_package" {
  type        = string
  default     = ""
  description = "If set, this determines which package in the image will be used to generate version tags."
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
      "org.opencontainers.image.url" : "https://edu.chainguard.dev/chainguard/chainguard-images/reference/${var.name}/",
      "org.opencontainers.image.source" : "https://github.com/chainguard-images/images/tree/main/images/${var.name}",
      },
    },
  )
}

module "this" {
  source  = "chainguard-dev/apko/publisher"
  version = "0.0.11"

  target_repository = var.target_repository
  config            = yamlencode(local.updated_config)
  extra_packages    = var.extra_packages

  check_sbom   = var.check-sbom
  sbom_checker = "cgr.dev/chainguard/ntia-conformance-checker:latest@sha256:75c1f8dcdf53d365bf30cdd630f800fa7a3b5d572ffc58346da6e5f1360e0787"
}

module "this-dev" {
  count   = local.build-dev ? 1 : 0
  source  = "chainguard-dev/apko/publisher"
  version = "0.0.11"

  target_repository = var.target_repository

  # Make the dev variant an explicit extension of the
  # locked original.
  config = jsonencode(module.this.config)
  extra_packages = concat([
    "apk-tools",
    "bash",
    "busybox",
    "git",
  ], var.extra_dev_packages)

  check_sbom   = var.check-sbom
  sbom_checker = "cgr.dev/chainguard/ntia-conformance-checker:latest@sha256:75c1f8dcdf53d365bf30cdd630f800fa7a3b5d572ffc58346da6e5f1360e0787"
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
      condition     = startswith(module.this.config.annotations["org.opencontainers.image.url"], "https://edu.chainguard.dev/chainguard/chainguard-images/reference/")
      error_message = "image.url annotation must be edu.chainguard.dev (got '${module.this.config.annotations["org.opencontainers.image.url"]}')"
    }
    precondition {
      condition     = startswith(module.this.config.annotations["org.opencontainers.image.source"], "https://github.com/chainguard-images/images/tree/main/images/")
      error_message = "image.source annotation must be github.com/chainguard-images (got '${module.this.config.annotations["org.opencontainers.image.source"]}')"
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
