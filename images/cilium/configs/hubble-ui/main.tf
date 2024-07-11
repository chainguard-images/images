locals {
  baseline_packages = ["nginx"]
}

module "accts" {
  name   = "nginx"
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["hubble-ui"]
  description = "The additional packages to install (e.g. hubble-ui...)"
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "type" : "service-bundle",
      "services" : {
        "nginx" : "/usr/sbin/nginx -c /etc/frontend/nginx.conf -g \"daemon off;\""
      }
    },
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/s6",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      },
      {
        "path" : "/var/lib/nginx",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/run/nginx",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/var/log/nginx",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/var/lib/nginx/tmp",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/etc/nginx",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/etc/frontend",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}

