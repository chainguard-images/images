locals {
  baseline_packages = ["bash", "bind-tools", "busybox", "crane", "curl", "dhcping", "drill", "dstat", "fatrace", "git", "gperf", "grpcurl", "iproute2", "jq", "ltrace", "mycli", "net-tools", "ngrep", "nmap", "openssl", "oras", "py3-pgcli", "redis", "socat", "strace", "sysstat", "tcptraceroute", "yq"]
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = []
  description = "The additional packages to install."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/bin/bash -c"
    }
  })
}

