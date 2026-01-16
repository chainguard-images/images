variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
}

variable "entrypoint" {
  description = "The entrypoint command for the image"
  type        = string
}

variable "cmd" {
  description = "The default command arguments"
  type        = string
  default     = ""
}

module "accts" {
  gid    = 65532
  run-as = 65532
  source = "../../../tflib/accts"
  uid    = 65532
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    paths = [{
      path : "/work",
      type : "directory",
      permissions = 511
    }]
    accounts = module.accts.block
    entrypoint = {
      command = var.entrypoint
    }
    work-dir = "/work"
    cmd      = var.cmd
  })
}

