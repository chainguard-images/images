variable "extra_packages" {
  default     = ["dfc"]
  description = "The additional packages to install"
  type        = list(string)
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
      packages = concat([], var.extra_packages)
    }
    paths = [{
      path : "/work",
      type : "directory",
      permissions = 511
    }]
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/dfc"
    }
    work-dir = "/work"
    cmd      = "--help"
  })
}

