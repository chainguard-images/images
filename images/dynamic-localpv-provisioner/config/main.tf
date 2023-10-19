variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["dynamic-localpv-provisioner"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.extra_packages, ["busybox"])
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/provisioner-localpv"
    }
  })
}
