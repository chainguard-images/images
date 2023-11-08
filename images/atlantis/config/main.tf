variable "suffix" {
  description = "Package name suffix (e.g. version stream)"
  default     = ""
}

variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = []
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      # List of packages as runtime dependencies for Atlantis
      # https://github.com/runatlantis/atlantis/blob/main/Dockerfile#L44
      packages = concat([
        "atlantis${var.suffix}",
        "busybox",
        "conftest${var.suffix}",
        "curl",
        "git",
        "git-lfs",
        "openssh-server",
        "libcap",
        "dumb-init",
        "gnupg",
        "openssl",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/atlantis"
    }
  })
}
