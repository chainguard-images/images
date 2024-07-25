variable "extra_packages" {
  default     = []
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
      packages = concat(["busybox", "build-base", "go", "git"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/ko"
    }
  })
}

