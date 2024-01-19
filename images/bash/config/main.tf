variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "bash",
        "busybox",
        "curl",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/bin/bash -c"
    }
  })
}
