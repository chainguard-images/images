module "accts" {
  name   = "haproxy"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "slim" {
  default     = false
  description = "minimal (no bash) image"
}

variable "extra_packages" {
  default     = ["haproxy"]
  description = "The additional packages to install."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : distinct(concat(var.extra_packages))
    },
    "entrypoint" : {
      "command" : var.slim == false ? "/usr/local/bin/docker-entrypoint.sh" : "/usr/sbin/haproxy"
    },
    "cmd" : var.slim == false ? "haproxy -f /usr/local/etc/haproxy/haproxy.cfg" : ""
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/var/lib/haproxy",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      },
      {
        "path" : "/var/run",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}
