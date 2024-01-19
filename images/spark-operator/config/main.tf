variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["spark-operator"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["spark-operator-oci-entrypoint"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/entrypoint.sh"
    }
  })
}
