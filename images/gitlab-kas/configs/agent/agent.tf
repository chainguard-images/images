variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = []
}

variable "name" {
  description = "Package name without suffix"
  default     = "gitlab-agent"
}

variable "suffix" {
  description = "Package name suffix (e.g. version stream)"
  default     = ""
}

module "accts" {
  source = "../../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["${var.name}${var.suffix}"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/agentk"
    }
  })
}
