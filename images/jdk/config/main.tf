variable "run-as" {
  description = "The UID used to run the container."
  default     = 65532
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. openjdk-17)."
  default     = ["default-jdk"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = var.run-as
  name   = "java"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "glibc-locale-en",
        "busybox",
        "libstdc++",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    work-dir = "/home/build"
    environment = merge({
      "LANG" : "en_US.UTF-8",
      "JAVA_HOME" : "/usr/lib/jvm/default-jvm"
    }, var.environment)
    paths = [{
      path        = "/home/build"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493 // 0o755 (HCL explicitly does not support octal literals)
    }]
  })
}
