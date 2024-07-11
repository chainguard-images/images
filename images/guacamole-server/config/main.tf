locals {
  baseline_packages = ["busybox", "guacamole-server", "libguac-client-rdp", "libguac-client-ssh", "libguac-client-telnet", "libguac-client-vnc", "netcat-openbsd", "openssl-provider-legacy", "ttf-dejavu"]
}

module "accts" {
  gid    = 1000
  name   = "guacd"
  source = "../../../tflib/accts"
  uid    = 1000
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = []
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {},
    "cmd" : "/bin/sh -c '/usr/sbin/guacd  -b 0.0.0.0 -L $GUACD_LOG_LEVEL -f'",
    "accounts" : module.accts.block,
    "environment" : {
      "GUACD_LOG_LEVEL" : "info",
      "LC_ALL" : "C.UTF-8",
      "LD_LIBRARY_PATH" : "/usr/lib"
    }
  })
}

