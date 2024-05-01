module "accts" {
  source = "../../../tflib/accts"
  # we have to run it as root because it runs `ip` command
  # unless we run it as root, it will fail with permission denied error like the following:
  # could not add ip: operation not permitted
  run-as = 0
}

variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = ["kube-vip"]
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/kube-vip"
    }
  })
}
