variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["airflow", "bash", "busybox", "findutils", "dumb-init", "curl"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 50000
  uid    = 50000
  gid    = 50000
  name   = "airflow"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    environment = merge({
      "PATH" : "/opt/airflow/venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
      "LANGUAGE" : "C.UTF-8",
      "LANG" : "C.UTF-8",
      "LC_ALL" : "C.UTF-8",
      "AIRFLOW_HOME" : "/opt/airflow",
      "AIRFLOW_USER_HOME_DIR" : "/home/airflow"
    }, var.environment)
    entrypoint = {
      command = "airflow standalone"
    }
    paths = [{
      path        = "/home/airflow"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493 // 0o755 (HCL explicitly does not support octal literals)
      recursive   = true
      },
      {
        path        = "/opt/airflow"
        type        = "directory"
        uid         = module.accts.block.run-as
        gid         = module.accts.block.run-as
        permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
        recursive   = true
    }]
  })
}