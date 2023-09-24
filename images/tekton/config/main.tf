variable "package" {
  description = "Package name (e.g. tkn, tekton-chains, tekton-pipelines)"
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

locals {
  # tekton-pipelines is the exception, where the binary name differs.
  binary = var.package != "tekton-pipelines" ? "/usr/bin/${var.package}" : "/usr/bin/tekton-pipelines-controller"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["${var.package}${var.suffix}"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = local.binary
    }
    # Certain images assume that they are built with ko and expect the
    # binary in a particular place to support copying it to a shared volume.
    paths = [{
      type        = "symlink"
      source      = local.binary
      path        = "/ko-app/${trimprefix(var.package, "tekton-pipelines-")}"
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
    }]
  })
}
