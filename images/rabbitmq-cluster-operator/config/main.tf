variable "extra_packages" {
  default     = []
  description = "The additional packages to install (e.g. rabbitmq-cluster-operator)."
}

module "accts" {
  gid    = 1000
  name   = "rabbitmq-cluster-operator"
  run-as = 1000
  source = "../../../tflib/accts"
  uid    = 1000
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/manager"
    }
  })
}

