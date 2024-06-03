terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "component" {
  default = {}
}

locals {
  commands = {
    "controller" : "/usr/local/bin/monitor -c",
    "enforcer" : "/usr/local/bin/monitor -r",
    "manager" : "java -Xms256m -Xmx2048m -Djdk.tls.rejectClientInitiatedRenegotiation=true -jar /usr/local/bin/admin-assembly-1.0.jar",
    "prometheus-exporter" : "python3 /usr/bin/nv_exporter.py"
    "scanner" : "/usr/local/bin/monitor",
    "updater" : "sleep 30"
  }
}

variable "extra_packages" {
  description = "The additional packages to install."
  type        = list(string)
  default     = []
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = var.component == "manager" ? 1000 : 0
  uid    = var.component == "manager" ? 1000 : 65532
  gid    = var.component == "manager" ? 1000 : 65532
  name   = var.component == "manager" ? "manager" : "nonroot"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    entrypoint = {
      command = local.commands[var.component]
    }
    accounts = module.accts.block
  })
}
