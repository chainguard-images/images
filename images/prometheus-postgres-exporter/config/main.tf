variable "extra_packages" {
  description = "The additional packages to install (e.g. cosign)."
  default     = ["prometheus-postgres-exporter"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["busybox"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/postgres_exporter"
    }
  })
}
