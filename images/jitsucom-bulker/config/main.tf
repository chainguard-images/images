variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

variable "main_package" {
  description = "The main package to install."
  type        = string
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["jitsucom-bulker-${var.main_package}", "jitsucom-bulker-${var.main_package}-compat"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/app/${var.main_package}"
    }
    paths = [{
      path        = "~/.${var.main_package}" # https://github.com/jitsucom/bulker/blob/315237cd54707f2d9395db087ec2d4b2ed1297f4/jitsubase/appbase/app_base.go#L33
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
    }]
  })
}
