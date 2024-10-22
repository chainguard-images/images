variable "extra_packages" {
  default     = []
  description = "The additional packages to install"
  type        = list(string)
}

module "accts" {
  gid    = 1000
  name   = "git"
  run-as = 1000
  source = "../../../tflib/accts"
  uid    = 1000
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    environment = {
      "HOME"                      = "/home/git"
      "LANG"                      = "C.UTF-8"
      "CONFIG_TEMPLATE_DIRECTORY" = "/etc/gitlab-pages"
    }
    entrypoint = {
      command = "/scripts/entrypoint.sh"
    }
    cmd = "/scripts/start-pages"
    paths = [{
      path        = "/etc/gitlab-pages"
      type        = "directory"
      permissions = 493
      uid         = module.accts.uid
      gid         = module.accts.gid
      recursive   = true
      }, {
      path        = "/srv/gitlab-pages"
      type        = "directory"
      permissions = 493
      uid         = module.accts.uid
      gid         = module.accts.gid
      recursive   = true
      }, {
      path        = "/var/log/gitlab-pages"
      type        = "directory"
      permissions = 493
      uid         = module.accts.uid
      gid         = module.accts.gid
      recursive   = true
      }, {
      path        = "/home/git"
      type        = "directory"
      permissions = 493
      uid         = module.accts.uid
      gid         = module.accts.gid
      recursive   = true
    }]
  })
}

