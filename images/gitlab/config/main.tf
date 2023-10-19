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

variable "suffix" {
  description = "Package name suffix (e.g. version stream)"
  default     = ""
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["gitlab-${var.name}${var.suffix}"], var.extra_packages)
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
