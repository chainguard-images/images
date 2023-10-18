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

locals {
  // Packages only needed for rootless builds.
  rootless_packages = var.rootless ? ["rootlesskit", "rootlesskit-config-nonroot"] : []
}

module "rootless" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["buildkitd", "buildctl", "runc"], var.extra_packages, local.rootless_packages)
    }
    accounts = var.rootless ? module.rootless.block : null
    entrypoint = {
      command = "/usr/bin/buildkitd"
    }
    environment = {
      BUILDKIT_SETUP_CGROUPV2_ROOT = 1
      XDG_RUNTIME_DIR              = "/tmp"
    }
    volumes = ["/var/lib/buildkit"]
  })
}
