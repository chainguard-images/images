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
    "argocd-extension-installer",
    "ca-certificates-bundle",
  ]
}
module "accts" {
  source = "../../../tflib/accts"
  run-as = 65532
  uid    = 65532
  gid    = 65532
  name   = "ext-installer"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "./install.sh"
    },
    paths = [{
      path        = "/tmp/extensions/resources"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
    }]
    work-dir = "/home/ext-installer"
  })
}
