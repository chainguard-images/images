variable "rootless" {
  description = "Whether to run as root or not."
  type        = bool
  default     = true
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

module "rootfull" {
  source = "../../../tflib/accts"
  name   = "root"
  uid    = 0
  gid    = 0
  run-as = 0
}

module "rootless" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["buildkitd", "buildctl", "runc"], var.extra_packages)
    }
    accounts = var.rootless ? module.rootless.block : null
    entrypoint = {
      command = "/usr/bin/buildkitd"
    }
    environment = {
      BUILDKIT_SETUP_CGROUPV2_ROOT = 1
    }
    volumes = ["/var/lib/buildkit"]
  })
}
