terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. kafka)."
  default     = ["kafka", "openjdk-11-default-jvm"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 65532
  uid    = 65532
  gid    = 65532
  name   = "kafka"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "bash",
        "busybox",
        "kafka-bitnami-compat",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    environment = merge({
      "BITNAMI_APP_NAME" : "kafka"
    }, var.environment)
    entrypoint = {
      command = "/opt/bitnami/scripts/kafka/entrypoint.sh /opt/bitnami/scripts/kafka/run.sh"
    }
    paths = [{
      path        = "/usr/lib/kafka/logs"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493 // 0o755 (HCL explicitly does not support octal literals)
      recursive   = true
      }, {
      path        = "/opt/bitnami"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493 // 0o755 (HCL explicitly does not support octal literals)
      recursive   = true
      }, {
      path        = "/bitnami"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493 // 0o755 (HCL explicitly does not support octal literals)
      recursive   = true
    }]
    }
  )
}
