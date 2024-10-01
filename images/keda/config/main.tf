variable "name" {
  description = "Component name (e.g. keda, keda-metrics-apiserver, keda-admission-webhooks)"
}

variable "package" {
  description = "Package name (e.g. keda-2.14)"
}

variable "extra_packages" {
  default     = []
  description = "Additional packages to install."
  type        = list(string)
}

locals {
  entrypoints = {
    "keda"                    = "/usr/bin/keda --zap-log-level=info --zap-encoder=console",
    "keda-metrics-apiserver"  = "/usr/bin/keda-adapter --secure-port=6443 --logtostderr=true --v=0",
    "keda-admission-webhooks" = "/usr/bin/keda-admission-webhooks --zap-log-level=info --zap-encoder=console",
  }
}

module "accts" {
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        var.package, // keda, keda-metrics-apiserver, keda-admission-webhooks
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

