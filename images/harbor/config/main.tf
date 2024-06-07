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
    "portal" : "nginx -g 'daemon off;'"
    "registry" : "/usr/bin/registry_DO_NOT_USE_GC serve /etc/registry/config.yml"
    "registryctl" : "/harbor/harbor_registryctl -c /etc/registryctl/config.yml",
    "trivy-adapter" : "/usr/bin/scanner-trivy",
  }

  certs_path = {
    path        = "/etc/pki/tls/certs"
    type        = "directory"
    uid         = module.accts.block.run-as
    gid         = module.accts.block.run-as
    permissions = 493
    recursive   = true
  }

  harbor_path = {
    path        = "/harbor"
    type        = "directory"
    uid         = module.accts.block.run-as
    gid         = module.accts.block.run-as
    permissions = 493
    recursive   = true
  }

  registry_conf_path = {
    path        = "/etc/registry"
    type        = "directory"
    uid         = module.accts.block.run-as
    gid         = module.accts.block.run-as
    permissions = 493
    recursive   = true
  }

  paths = {
    "core" : [{
      path        = "/etc/core"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      },
      local.certs_path,
      local.harbor_path,
    ]
    "jobservice" : [{
      path        = "/var/log/jobs"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      },
      local.certs_path,
      local.harbor_path,
    ]
    "portal" : [{
      path        = "/var/cache/nginx"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      }, {
      path        = "/var/lib/nginx"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      }, {
      path        = "/var/lib/nginx/logs"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 511
      recursive   = true
      }, {
      path        = "/var/lib/nginx/tmp"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 511
      recursive   = true
      }, {
      path        = "/var/log/nginx"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      }, {
      path        = "/var/run"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 511
      recursive   = true
      }, {
      path        = "/run"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
    }]
    "registry" : [{
      path        = "/storage"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      },
      local.harbor_path,
      local.registry_conf_path,
    ]
    "registryctl" : [{
      path        = "/var/lib/registry"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493
      recursive   = true
      },
      local.harbor_path,
      local.registry_conf_path,
    ]
    "trivy-adapter" : [
      local.certs_path,
    ]
  }

  users = {
    "core" : "harbor",
    "jobservice" : "harbor",
    "portal" : "nginx",
    "registry" : "harbor",
    "registryctl" : "harbor",
    "trivy-adapter" : "scanner",
  }

  work-dirs = {
    "core" : "/harbor",
    "jobservice" : "/harbor",
    "portal" : "/",
    "registry" : "/",
    "registryctl" : "/",
    "trivy-adapter" : "/",
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
  run-as = 10000
  uid    = 10000
  gid    = 10000
  name   = local.users[var.component]
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    entrypoint = {
      command = local.commands[var.component]
    }
    accounts    = module.accts.block
    environment = var.environment
    paths       = local.paths[var.component]
    work-dir    = local.work-dirs[var.component]
  })
}
