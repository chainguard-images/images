locals {
  baseline_packages = ["ntpd-rs"]
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["ntpd-rs"]
  description = "The additional packages to install (e.g. ntpd-rs)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/ntp-daemon"
    },
    "accounts" : {
      "users" : [
        {
          "username" : "ntpd-rs",
          "uid" : 65532
        }
      ],
      "groups" : [
        {
          "groupname" : "ntpd-rs",
          "gid" : 65532
        }
      ]
    }
  })
}

