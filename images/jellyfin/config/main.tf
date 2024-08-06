terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. docker-selenium)."
  type        = list(string)
  default = [
    "busybox",
    "jellyfin",
    "jellyfin-web",
  ]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 65532
  uid    = 65532
  gid    = 65532
  name   = "jellyfin"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    environment = merge({
      "NVIDIA_DRIVER_CAPABILITIES" : "all"
      "NVIDIA_VISIBLE_DEVICES" : "all"
      "HEALTHCHECK_URL" : "http://localhost:8096/health"
      "LC_ALL" : "en_US.UTF-8"
      "LANG" : "en_US.UTF-8"
      "LANGUAGE" : "en_US:en"
      "JELLYFIN_DATA_DIR" : "/config"
      "JELLYFIN_CACHE_DIR" : "/cache"
      "JELLYFIN_CONFIG_DIR" : "/config/config"
      "JELLYFIN_LOG_DIR" : "/config/log"
      "JELLYFIN_WEB_DIR" : "/usr/lib/jellyfin/jellyfin-web"
      "HOME" : "/home/jellyfin"
    }, var.environment)
    entrypoint = {
      command = "/usr/bin/jellyfin"
    }
    paths = [{
      path        = "/cache"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/config"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/jellyfin"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/usr/lib/jellyfin"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
    }]
  })
}
