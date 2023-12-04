variable "name" {
  description = "Package name (e.g. cainjector, acmeresolver, controller, webhook)"
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

# agent runs as root while others as non-root, this variable is for that
variable "run-as" {
  description = "The user with which this should run as"
  default     = 65532
}

# agent and server require `run` while oidc-discovery-provider doesn't, this variable tries to handle that
variable "entrypoint-cmd" {
  description = "The command to be used as the entrypoint"
}

# oidc-discovery-provider begins wiht --help command after entrypoint, this is to handle that
variable "cmd" {
  description = "The command followed by entrypoint"
  default     = ""
}
module "accts" {
  source = "../../../tflib/accts"
  run-as = var.run-as
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["spire-${var.name}"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = var.entrypoint-cmd
    }
    cmd = var.cmd
  })
}