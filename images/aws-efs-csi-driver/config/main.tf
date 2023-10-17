variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["aws-efs-csi-driver"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.extra_packages, ["umount", "mount"])
    }
    accounts = {
      groups = [{
        groupname = "nonroot"
        gid       = 65532
      }]
      users = [{
        username = "nonroot"
        uid       = 65532
        gid       = 65532
      }]
      # This package expects to run as root, context:
      # https://github.com/kubernetes-sigs/aws-efs-csi-driver/issues/1121#issuecomment-1714003621
      run-as = 0
    }
    entrypoint = {
      command = "/usr/bin/aws-efs-csi-driver"
    }
  })
}
