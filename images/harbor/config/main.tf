terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "component" {
  default = {}
}

locals {
  commands = {
    "core" : "/harbor/harbor_core",
    "jobservice" : "/harbor/harbor_jobservice -c /etc/jobservice/config.yml",
    "registry" : "/usr/bin/registry_DO_NOT_USE_GC serve /etc/registry/config.yml"
    "registryctl" : "/harbor/harbor_registryctl -c /etc/registryctl/config.yml",
  }
}

variable "extra_packages" {
  description = "The additional packages to install."
  type        = list(string)
  default     = []
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 65532
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
      command = local.commands[var.component]
    }
    paths = [{
      path        = "/etc/pki/tls/certs" // all
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      }, {
      path        = "/etc/registry" // registry, registryctl
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      }, {
      path        = "/etc/registryctl" // registryctl
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      }, {
      path        = "/harbor" // all
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      }, {
      path        = "/storage" // registry
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      }, {
      path        = "/var/lib/registry" // registryctl
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      }, {
      path        = "/var/log/jobs" // jobservice
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
    }]
  })
}
