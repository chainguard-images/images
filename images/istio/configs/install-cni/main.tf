terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["iptables", "istio-cni", "istio-cni-compat", "istio-install-cni", "istio-install-cni-compat"]
  description = "The additional packages to install (e.g. istio-install-cni, istio-cni...)"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/local/bin/install-cni"
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

