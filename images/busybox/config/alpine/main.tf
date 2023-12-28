variable "extra_packages" {
  description = "Extra packages to install."
  type        = list(string)
  default     = []
}

module "accts" { source = "../../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "busybox",
        "ssl_client", # ssl_client allows the busybox wget applet to use https.
      ], var.extra_packages)
    }
    accounts = module.accts.block
  })
}
