locals {
  baseline_packages = ["busybox", "datadog-agent-oci-compat"]
}

module "accts" {
  run-as = 0
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["datadog-agent"]
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
    "cmd" : "/bin/entrypoint.sh",
    "accounts" : module.accts.block,
    "environment" : {
      "CURL_CA_BUNDLE" : "/opt/datadog-agent/embedded/ssl/certs/cacert.pem",
      "DD_SECRET_BACKEND_COMMAND_ALLOW_GROUP_EXEC_PERM" : "true",
      "PATH" : "/opt/datadog-agent/bin/agent/:/opt/datadog-agent/embedded/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/jvm/java-11-openjdk/bin",
      "PYTHONPATH" : "/usr/share/datadog-agent/lib/python3.11/site-packages",
      "S6-LOGGING" : "0",
      "S6_BEHAVIOR_IF_STAGE2_FAILS" : "2",
      "S6_KEEP_ENV" : "1",
      "S6_READ_ONLY_ROOT" : "1"
    },
    "paths" : [
      {
        "path" : "/etc/datadog-agent",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/opt/datadog-agent",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/etc/s6",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      }
    ],
    "volumes" : [
      "/var/run/s6",
      "/var/log/datadog"
    ]
  })
}

