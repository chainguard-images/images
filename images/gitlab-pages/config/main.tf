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
    entrypoint = {
      command = "/scripts/start-pages"
    }
    paths = [{
      path        = "/etc/gitlab-pages"
      type        = "directory"
      permissions = 493
      recursive   = true
      }, {
      path        = "/srv/gitlab-pages"
      type        = "directory"
      permissions = 493
      recursive   = true
      }, {
      path        = "/var/log/gitlab-pages"
      type        = "directory"
      permissions = 493
      recursive   = true
    }]
  })
}

