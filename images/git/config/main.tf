variable "extra_packages" {
  description = "Extra packages to install."
  type        = list(string)
  default     = []
}

variable "extra_repositories" {
  description = "Extra repositories to add."
  type        = list(string)
  default     = []
}

variable "root" {
  description = "Whether to run as root."
  type        = bool
  default     = false
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = var.root ? 0 : 65532
  name   = "git"
}

output "config" {
  value = jsonencode({
    contents = {
      repositories = var.extra_repositories
      packages = concat([
        "git",
        "git-lfs",
        "openssh-client",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/git"
    }
    work-dir = "/home/git"
  })
}
