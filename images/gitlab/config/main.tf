terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "name" {
  description = "Package name (e.g. kas, pages, shell, ...)"
}

variable "entrypoint_cmd" {
  description = "Entrypoint command to be executed (e.g. /usr/bin/kas, /usr/local/bin/start-pages, ...)"
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

module "accts" { source = "../../../tflib/accts" }

locals {
  scripts_package = var.name == "kas" ? [] : ["gitlab-${var.name}-scripts"]
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["gitlab-base", "gitlab-${var.name}"], local.scripts_package, var.extra_packages)
    }
    accounts = module.accts.block

    paths = [{
      path : "/etc/gitlab-${var.name}",
      type : "directory",
      permissions = 511
      }, {
      path : "/srv/gitlab-${var.name}",
      type : "directory",
      permissions = 511
      }, {
      path : "/var/log/gitlab-${var.name}",
      type : "directory",
      permissions = 511
      }, {
      path : "/etc/ssh",
      type : "directory",
      permissions = 511
    }]
    entrypoint = {
      command = "${var.entrypoint_cmd}"
    }
  })
}
