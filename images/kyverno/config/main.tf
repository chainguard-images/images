variable "component" {
  description = "The component to build."
  type        = string
}

variable "main_package" {
  description = "The main package to install "
}

locals {
  entrypoints = {
    "admission" : "/usr/bin/kyverno",
    "background" : "/usr/bin/background-controller",
    "cleanup" : "/usr/bin/cleanup-controller",
    "cli" : "/usr/bin/kubectl-kyverno",
    "init" : "/usr/bin/kyvernopre",
    "reports" : "/usr/bin/reports-controller",
  }
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = ["kubectl-latest", var.main_package]
    }
    accounts = module.accts.block
    entrypoint = {
      command = local.entrypoints[var.component]
    }
  })
}

