variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["aws-ebs-csi-driver"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.extra_packages, ["umount", "mount"])
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/aws-ebs-csi-driver"
    }
  })
}
