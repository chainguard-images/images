variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

variable "entrypoint" {
  type    = string
  default = ""
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = var.entrypoint
    }
    cmd = "--v=4 --stderrthreshold=info"
  })
}
