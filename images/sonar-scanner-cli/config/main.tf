variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = []
}

module "accts" {
  source = "../../../tflib/accts"
  uid    = 65532
  gid    = 65532
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "openjdk-17-default-jvm", "nodejs-18", "pylint", "sonar-scanner-cli-entrypoint", "sonar-scanner-cli-compat", "coreutils",
      ], var.extra_packages)
    }
    work-dir = "/usr/src"
    accounts = module.accts.block
    environment = merge({
      "PATH" : "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/sonar-scanner/bin",
      "JAVA_HOME" : "/usr/lib/jvm/default-jvm"
    })
    entrypoint = {
      command = "/usr/bin/entrypoint.sh"
    }
  })
}
