variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["spark-3.5", "spark-operator"]
}

module "accts" {
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "busybox",
        "spark-compat",
        "spark-operator-oci-entrypoint",
        "openjdk-17-default-jvm"
        ],
      var.extra_packages)
    }
    accounts = module.accts.block

    environment = {
      SPARK_HOME = "/opt/spark"
      JAVA_HOME  = "/usr/lib/jvm/default-jvm"
    }

    entrypoint = {
      command = "/usr/bin/entrypoint.sh"
    }
  })
}
