variable "extra_packages" {
  description = "The additional packages to install (e.g. grype)."
  default     = ["grype"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      # From the upstream .ko.yaml
      # We need a shell for a lot of redirection/piping to work
      packages = concat(["busybox"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/grype"
    }
    cmd = "help"
    paths = [{
      path        = "/var/lib/grype"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
    }]
  })
}

