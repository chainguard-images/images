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
      command = "/scripts/entrypoint.sh"
    }
    cmd = "/scripts/process-wrapper"
    environment = {
      "CONFIG_TEMPLATE_DIRECTORY" = "/etc/gitlab-exporter"
      "CONFIG_DIRECTORY"          = "/etc/gitlab-exporter"
      "CONFIG_FILENAME"           = "gitlab-exporter.yml"
    }
    paths = [{
      path        = "/etc/gitlab-exporter"
      type        = "directory"
      permissions = 511
      recursive   = true
      }, {
      path        = "/var/opt/gitlab-exporter"
      type        = "directory"
      permissions = 511
      recursive   = true
      }, {
      path        = "/var/opt/gitlab-exporter/templates"
      type        = "directory"
      permissions = 511
      recursive   = true
    }]
  })
}

