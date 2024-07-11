locals {
  baseline_packages = ["busybox"]
}

module "accts" {
  name   = "grafana"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["grafana", "grafana-oci-compat"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/opt/grafana/run.sh"
    },
    "work-dir" : "/usr/share/grafana",
    "accounts" : module.accts.block,
    "environment" : {
      "GF_PATHS_CONFIG" : "/etc/grafana/grafana.ini",
      "GF_PATHS_DATA" : "/var/lib/grafana",
      "GF_PATHS_HOME" : "/usr/share/grafana",
      "GF_PATHS_LOGS" : "/var/log/grafana",
      "GF_PATHS_PLUGINS" : "/var/lib/grafana/plugins",
      "GF_PATHS_PROVISIONING" : "/etc/grafana/provisioning",
      "LANG" : "en_US.UTF-8",
      "PATH" : "/usr/share/grafana/bin:/usr/sbin:/sbin:/usr/bin:/bin"
    },
    "paths" : [
      {
        "path" : "/etc/grafana/provisioning/alerting",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      },
      {
        "path" : "/etc/grafana/provisioning/datasources",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      },
      {
        "path" : "/etc/grafana/provisioning/dashboards",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      },
      {
        "path" : "/etc/grafana/provisioning/notifiers",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      },
      {
        "path" : "/etc/grafana/provisioning/plugins",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      },
      {
        "path" : "/var/log/grafana",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      },
      {
        "path" : "/var/lib/grafana/plugins",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      },
      {
        "path" : "/var/lib/grafana",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      },
      {
        "path" : "/var/log/grafana",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      }
    ]
  })
}

