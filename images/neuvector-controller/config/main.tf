terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}
      
variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["neuvector-controller", "neuvector-monitor", "busybox"]
}
      
variable "environment" {
  default = {}
}
      
module "accts" {
  source = "../../../tflib/accts"
}
      
output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages 
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/local/bin/neuvector-monitor"
    }
  })
}