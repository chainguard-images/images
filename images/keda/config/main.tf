variable "name" {
  description = "Package name (e.g. keda, keda-adapter, keda-admission-webhooks)"
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

locals {
  entrypoints = {
    "keda"                    = "/usr/bin/keda --zap-log-level=info --zap-encoder=console",
    "keda-adapter"            = "/usr/bin/keda-adapter --secure-port=6443 --logtostderr=true --v=0",
    "keda-admission-webhooks" = "/usr/bin/keda-admission-webhooks --zap-log-level=info --zap-encoder=console",
  }
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        var.name, // keda, keda-adapter, keda-admission-webhooks
        "busybox",
        "keda-compat",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = local.entrypoints[var.name]
    }
  })
}
