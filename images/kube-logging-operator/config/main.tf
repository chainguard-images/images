variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["kube-logging-operator"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["kube-logging-operator-compat"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/manager"
    }
  })
}
