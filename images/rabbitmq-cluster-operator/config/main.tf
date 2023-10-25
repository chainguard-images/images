variable "extra_packages" {
  description = "The additional packages to install (e.g. rabbitmq-cluster-operator)."
  default     = ["rabbitmq-cluster-operator", "rabbitmq-cluster-operator-compat"]
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 1000
  uid    = 1000
  gid    = 1000
  name   = "rabbitmq-cluster-operator"
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
