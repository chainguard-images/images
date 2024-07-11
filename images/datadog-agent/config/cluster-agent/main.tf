module "accts" {
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["datadog-cluster-agent", "datadog-cluster-agent-oci-compat"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/entrypoint.sh"
    },
    "cmd" : "datadog-cluster-agent start",
    "accounts" : module.accts.block,
    "environment" : {
      "DD_SECRET_BACKEND_COMMAND_ALLOW_GROUP_EXEC_PERM" : "true",
      "DOCKER_DD_AGENT" : "true",
      "PATH" : "/opt/datadog-agent/bin/agent/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/jvm/java-11-openjdk/bin"
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
      }
    ],
    "volumes" : [
      "/etc/datadog-agent",
      "/var/log/datadog",
      "/tmp"
    ]
  })
}

