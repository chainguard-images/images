variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["etcd"]
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
    environment = {
      "ETCD_DATA_DIR" = "/var/lib/etcd"
    }
  })
}
