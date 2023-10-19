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
      // The recommended daemonless mode script requires this to be set, or else it will fail.
      // https://github.com/moby/buildkit/blob/8dfc926965e6275db51888431778416a837f7f61/examples/buildctl-daemonless/buildctl-daemonless.sh#L30
      //
      // Definition: (https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables)
      // > $XDG_RUNTIME_DIR defines the base directory relative to which user-specific non-essential runtime files and other file objects
      // > (such as sockets, named pipes, ...) should be stored. The directory MUST be owned by the user, and he MUST be the only one having
      // > read and write access to it. Its Unix access mode MUST be 0700.
      //
      // Since containers generally run with a single user, using /tmp seems like an appropriate choice.
      XDG_RUNTIME_DIR = "/tmp"
    }
    volumes = ["/var/lib/buildkit"]
  })
}
