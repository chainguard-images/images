terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["cilium-operator-generic", "gops"]
  description = "The additional packages to install (e.g. gops, cilium-operator-generic...)"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/cilium-operator-generic"
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

