locals {
  entrypoint = {
    "cli" : "/usr/bin/flux"
    "helm-controller" : "/usr/bin/helm-controller"
    "image-automation-controller" : "/usr/bin/image-automation-controller"
    "image-reflector-controller" : "/usr/bin/image-reflector-controller"
    "kustomize-controller" : "/usr/bin/kustomize-controller"
    "notification-controller" : "/usr/bin/notification-controller"
    "source-controller" : "/usr/bin/source-controller"
  }
  cmd = {
    "cli" : "help"
  }
  paths = {
    "image-automation-controller" : [{
      path : "/data"
      type : "directory"
      permissions : 511 // 0o777 (HCL explicitly does not support octal literals)
      uid : 65532
      gid : 65532
      recursive : true
    }]
    "source-controller" : [{
      # Writes to /home/nonroot/ for caching things like rekor public keys (/home/nonroot/.sigstore)
      path : "/home/nonroot"
      type : "directory"
      permissions : 511 // 0o777 (HCL explicitly does not support octal literals)
      uid : 1337
      gid : 1337
      recursive : true
    }]
  }
  # Upstream charts deploy with fsGroup: 1337 by default.
  run-as = var.component == "source-controller" ? 1337 : 65532
}

variable "component" { description = "The component to build" }

variable "packages" {
  description = "The packages to build"
  type        = list(string)
}

module "accts" {
  source = "../../../tflib/accts"
  uid    = local.run-as
  gid    = local.run-as
  run-as = local.run-as
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = lookup(local.entrypoint, var.component, null)
    }
    cmd   = lookup(local.cmd, var.component, null)
    paths = lookup(local.paths, var.component, null)
  })
}
