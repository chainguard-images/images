variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["nats-server"]
}

module "accts" {
  source = "../../../tflib/accts"
  name   = "nats"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages # nats-server comes in from var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/nats-server"
    }
    cmd = "--config=/etc/nats/nats-server.conf"
  })
}
