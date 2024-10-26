variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = []
}

variable "extra_repositories" {
  default     = ["https://packages.cgr.dev/extras"]
  description = "The additional repositores to install from (e.g. extras)."
}

variable "extra_keyring" {
  default     = ["https://packages.cgr.dev/extras/chainguard-extras.rsa.pub"]
  description = "The additional keys to use (e.g. extras)."
}


module "accts" {
  source = "../../../tflib/accts"
  # required because terraform needs mkdir for initializing plugins
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages     = var.extra_packages
      repositories = var.extra_repositories
      keyring      = var.extra_keyring
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/terraform"
    }
    cmd : "--help",
  })
}
