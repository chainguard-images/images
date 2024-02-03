variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["spark", "spark-operator"]
}

module "accts" {
  source = "../../../tflib/accts"
}

# TODO: procps should be moved to a runtime dependency of the spark-operator
# package. At the time of writing, encountering issues loading runtime deps into
# images.
output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "busybox",
        "spark-compat",
        "spark-operator-oci-entrypoint"
        ],
      var.extra_packages)
    }
    accounts = module.accts.block

    environment = {
      SPARK_HOME = "/opt/spark"
    }

    entrypoint = {
      command = "/usr/bin/entrypoint.sh"
    }
  })
}
