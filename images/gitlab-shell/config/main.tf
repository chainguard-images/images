variable "extra_packages" {
  default     = []
  description = "The additional packages to install"
  type        = list(string)
}

variable "entrypoint" {
  default     = "/scripts/entrypoint.sh"
  description = "The entrypoint to use for the container"
  type        = string
}

module "accts" {
  gid    = 1000
  name   = "git"
  run-as = "git"
  source = "../../../tflib/accts"
  uid    = 1000
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    cmd      = "/scripts/process-wrapper"
    entrypoint = {
      command = var.entrypoint
    }
    environment = {
      "CONFIG_TEMPLATE_DIRECTORY" = "/srv/gitlab-shell"
      "LANG"                      = "C.UTF-8"
      "HOME"                      = "/home/git"
    }
    paths = [
      {
        path        = "/scripts"
        type        = "directory"
        uid         = 1000
        gid         = 1000
        permissions = 511
        recursive   = true
      },
      {
        path        = "/srv"
        type        = "directory"
        uid         = 0
        gid         = 0
        permissions = 511
        recursive   = true
      },
      {
        path        = "/etc/ssh"
        type        = "directory"
        uid         = 1000
        gid         = 1000
        permissions = 511
        recursive   = true
      },
      {
        path        = "/var/log/gitlab-shell"
        type        = "directory"
        uid         = 1000
        gid         = 1000
        permissions = 511
        recursive   = true
      }
    ]
  })
}

