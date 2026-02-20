variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "hollywood",
        "coreutils",
        "grep",
        "procps",
        "sed",
        "bash",
        "bash-binsh",
        "byobu",
        "tmux",
        "atop",
        "cmatrix",
        "ccze",
        "htop",
        "jp2a",
        "openssh-client",
        "ncurses-terminfo",
        "tree",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/hollywood"
    }
  })
}
