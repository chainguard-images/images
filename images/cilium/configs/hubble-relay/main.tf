terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["cilium-hubble-relay", "gops"]
  description = "The additional packages to install (e.g. gops, hubble-relay...)"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/hubble-relay"
    },
    "accounts" : {
      "run-as" : "65532",
      "users" : [
        {
          "username" : "nobody",
          "uid" : 65532,
          "gid" : 65532
        }
      ],
      "groups" : [
        {
          "groupname" : "nonroot",
          "gid" : 65532
        }
      ]
    }
  })
}

