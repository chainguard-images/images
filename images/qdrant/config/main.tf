locals {
  baseline_packages = ["bash", "busybox", "qdrant-oci-compat", "qdrant-oci-entrypoint"]
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["qdrant"]
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
      "command" : "/usr/lib/qdrant/entrypoint.sh"
    },
    "work-dir" : "/qdrant",
    "accounts" : {
      "run-as" : "0",
      "users" : [
        {
          "username" : "qdrant",
          "uid" : 1000,
          "gid" : 1000
        }
      ],
      "groups" : [
        {
          "groupname" : "qdrant",
          "gid" : 1000
        },
        {
          "groupname" : "fsgroup",
          "gid" : 3000,
          "members" : [
            "qdrant"
          ]
        }
      ]
    },
    "environment" : {
      "RUN_MODE" : "production"
    },
    "paths" : [
      {
        "path" : "/qdrant",
        "type" : "directory",
        "uid" : 1000,
        "gid" : 1000,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}

