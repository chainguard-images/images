variable "main_package" {
  description = "Main package to install."
  type        = string
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = ["tini", var.main_package]
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/sbin/tini -g --"
    }
    cmd = var.main_package == "dask-gateway" ? "/usr/bin/dask-gateway-server --config /etc/dask-gateway/dask_gateway_config.py" : ""
  })
}

