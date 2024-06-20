variable "extra_packages" {
  default     = ["spdx-tools-java"]
  description = "The additional packages to install"
  type        = list(string)
}

module "accts" {
  source = "../../../tflib/accts"
}

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

