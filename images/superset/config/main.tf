variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["superset", "bash", "busybox"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    environment = merge({
      "PATH" : "/usr/share/superset/venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
      "LANG" : "C.UTF-8",
      "LC_ALL" : "C.UTF-8",
      "SUPERSET_ENV" : "production",
      "FLASK_APP" : "superset.app:create_app()",
      "SUPERSET_PORT" : "8088",
    }, var.environment)
    entrypoint = {
      command = "/usr/bin/run-server.sh"
    }
  })
}