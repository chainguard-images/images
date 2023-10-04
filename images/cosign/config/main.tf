variable "extra_packages" {
  description = "The additional packages to install (e.g. cosign)."
  default     = ["cosign"]
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
      command = "/usr/bin/cosign"
    }
    cmd = "help"
  })
}
