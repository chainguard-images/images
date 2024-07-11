terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["istio-pilot-discovery", "istio-pilot-discovery-compat"]
  description = "The additional packages to install (e.g. istio-pilot-discovery, istio-pilot-discovery-1.18.2-compat)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/local/bin/pilot-discovery"
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
    },
    "paths" : [
      {
        "path" : "/run",
        "type" : "directory",
        "permissions" : 493
      }
    ]
  })
}

