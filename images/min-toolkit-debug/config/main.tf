locals {
  shared_packages = [
    "bash",
    "bind-tools",
    "busybox",
    "coreutils",
    "curl",
    "dhcping",
    "drill",
    "dstat",
    "fatrace",
    "findutils",
    "git",
    "gperf",
    "iproute2",
    "jq",
    "ltrace",
    "mycli",
    "net-tools",
    "ngrep",
    "nmap",
    "openssl",
    "py3-pgcli",
    "redis",
    "socat",
    "strace",
    "sysstat",
    "tcptraceroute",
  ]
}

output "shared_packages" {
  description = "The list of shared_packages b/w fips and non-fips image"
  value       = local.shared_packages
}

variable "extra_packages" {
  default     = []
  description = "The additional packages to install."
}

variable "extra_repositories" {
  description = "The additional repositores to install from (e.g. extras)."
  default     = []
}

output "config" {
  value = jsonencode({
    "contents" = {
      "repositories" : var.extra_repositories,
      "packages" = concat(var.extra_packages, local.shared_packages)
    }
    "entrypoint" = {
      "command" = "/bin/bash -c"
    }
  })
}

