variable "extra_packages" {
  type        = list(string)
  description = "The additional packages to install"
  default     = []
}

variable "command" {
  type        = string
  description = "The command to run when the container starts"
  default     = ""
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = var.command
    }
    paths = [{
      type        = "symlink"
      source      = "/usr/bin"
      path        = "/usr/local/bin"
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
    }]
  })
}
