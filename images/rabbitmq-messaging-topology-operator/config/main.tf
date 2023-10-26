variable "extra_packages" {
  description = "The additional packages to install (e.g. rabbitmq-messaging-topology-operator)."
  default     = ["rabbitmq-messaging-topology-operator", "rabbitmq-messaging-topology-operator-compat"]
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 1001
  uid    = 1001
  gid    = 1001
  name   = "messaging-topology-operator"
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
