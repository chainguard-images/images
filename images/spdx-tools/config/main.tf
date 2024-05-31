variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = ["spdx-tools-java"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["busybox"], var.extra_packages)
    }
    accounts = module.accts.block
    environment = {
      "LANG" : "en_US.UTF-8",
      "JAVA_HOME" : "/usr/lib/jvm/default-jvm"
    }
    entrypoint = {
      command = "/usr/bin/tools-java"
    }
  })
}
