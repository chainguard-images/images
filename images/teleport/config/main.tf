variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = []
}

module "accts" {
  source = "../../../tflib/accts"
  uid    = 65532
  gid    = 65532
  run-as = 65532
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        // TODO: Add any other packages here that are *always* needed.
      ], var.extra_packages)
    }
    //
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/dumb-init /usr/local/bin/teleport start -c /etc/teleport/teleport.yaml"
    }
    paths = [{
      path        = "/var/lib/teleport"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
      },
      {
        path        = "/etc"
        type        = "directory"
        uid         = module.accts.uid
        gid         = module.accts.gid
        permissions = 511
    }]
  })
}
