variable "main_package" {
  description = "Main package to install."
  type        = string
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "tini",
        var.main_package,
      ], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/sbin/tini -g --"
    }
    cmd = var.main_package == "dask-gateway" ? "/usr/bin/dask-gateway-server --config /etc/dask-gateway/dask_gateway_config.py" : ""
  })
}
