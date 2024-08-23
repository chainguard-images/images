variable "name" {
  description = "Package name (e.g. kubernetes-csi-external-snapshot-validation-webhook, kubernetes-csi-external-csi-snapshotter)"
}

variable "component" {
  description = "Package component (e.g. snapshot-controller, snapshot-validation-webhook, or snapshotter)"
}

variable "extra_packages" {
  default     = []
  description = "The additional packages to install"
  type        = list(string)
}

module "accts" {
  run-as = var.component != "snapshot-validation-webhook" ? 0 : 65532
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["${var.name}"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/${var.component}"
    }
  })
}

