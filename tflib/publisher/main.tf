terraform {
  required_providers {
    cosign = {
      source  = "chainguard-dev/cosign"
      version = "0.0.6"
    }
    apko = {
      source  = "chainguard-dev/apko"
      version = "0.9.2"
    }
    oci = {
      source  = "chainguard-dev/oci"
      version = "0.0.7"
    }
  }
}

variable "target_repository" {}

variable "config" {}

variable "extra_packages" {
  type    = list(string)
  default = ["wolfi-baselayout"]
}

variable "name" {
  type    = string
  default = "TODO" // TODO remove this
}

output "path" {
  value = basename(path.cwd)
}

locals {
  updated_config = merge(yamldecode(var.config),
    var.name == "TODO" ? {} :
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
  version = "0.0.6"

  target_repository = var.target_repository
  config            = yamlencode(local.updated_config)
  extra_packages    = var.extra_packages
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
      error_message = "image.uri annotation must be edu.chainguard.dev (got '${module.this.config.annotations["org.opencontainers.image.url"]}')"
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

output "config" {
  value = module.this.config
}
