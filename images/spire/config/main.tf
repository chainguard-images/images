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

module "accts" {
  source = "../../../tflib/accts"
  # agent runs as root while others as non-root, this condition is for that
  run-as = var.name == "agent" ? 0 : 65532
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["spire-${var.name}"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      ## agent and server require `run` while oidc-discovery-provider doesn't, this condition tries to handle that
      command = var.name == "agent" || var.name == "server" ? "/usr/bin/spire-${var.name} run" : "/usr/bin/${var.name}"
    }
  })
}