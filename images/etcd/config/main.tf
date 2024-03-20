variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["etcd"]
}

variable "environment" {
  description = "Additional environment variables to set in the image."
  type        = map(string)
  default     = {}
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/etcd"
    }
    paths = [{
      path        = "/var/lib/etcd"
      type        = "directory"
      uid         = 65532
      gid         = 65532
      permissions = 493 // 0o755 (HCL explicitly does not support octal literals)
    }]
    environment = merge(var.environment, {
      "ETCD_DATA_DIR" : "/var/lib/etcd",
    })
  })
}
