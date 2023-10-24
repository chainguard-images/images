variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["ko"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["busybox", "build-base", "go"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/ko"
    }
  })
}

