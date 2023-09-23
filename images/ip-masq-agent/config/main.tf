variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["ip-masq-agent"]
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "iptables",
        "ip6tables",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/ip-masq-agent"
    }
  })
}
