variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = []
}

variable "extra_environment" {
  description = "Additional apko environment."
  type        = map(string)
  default     = {}
}

module "accts" {
  source = "../../../tflib/accts"
  uid    = 65532
  gid    = 65532
  run-as = 65532
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
      ], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/mvn"
    }
    work-dir = "/home/build"
    environment = merge({
      JAVA_HOME = "/usr/lib/jvm/default-jvm"
      LANG      = "en_US.UTF-8"
    }, var.extra_environment)
    paths = [
      {
        path        = "/home/build"
        type        = "directory"
        uid         = 65532
        gid         = 65532
        permissions = 493
      }
    ]
  })
}
