variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["aws-efs-csi-driver"]
}

module "accts" {
  source = "../../../tflib/accts"

  # This package expects to run as root, context:
  # https://github.com/kubernetes-sigs/aws-efs-csi-driver/issues/1121#issuecomment-1714003621
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/aws-efs-csi-driver"
    }
  })
}
