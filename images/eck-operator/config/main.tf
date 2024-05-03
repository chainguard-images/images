terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  // TODO: Add any other packages here you want to conditionally include,
  // or update this default to [] if this isn't a version stream image.
  default = [
    "eck-operator",
    // Other packages your image needs
  ]
}

variable "extra_repositories" {
  description = "The additional repositores to install from (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras"]
}

variable "extra_keyring" {
  description = "The additional keys to use (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras/chainguard-extras.rsa.pub"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages     = var.extra_packages
      repositories = var.extra_repositories
      keyring      = var.extra_keyring
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/elastic-operator"
    }
    cmd = "manager"
  })
}
