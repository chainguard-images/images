terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install."
  type        = list(string)
  default = [
    "bash",
    "busybox",
    "ca-certificates",
    "ca-certificates-bundle",
    "libnspr",
    "curl",
    "sqlite-libs",
    "openssl",
    "harbor-core",
  ]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
  uid    = 65532
  gid    = 65532
  name   = "harbor"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    environment = merge({
      "HOME" : "/home/harbor"
      "PWD" : "/harbor"
    }, var.environment)
    entrypoint = {
      command = "/harbor/harbor_core"
    }
    paths = [{
      path        = "//etc/pki/tls/certs"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      }, {
      path        = "/harbor"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
    }]
  })
}
