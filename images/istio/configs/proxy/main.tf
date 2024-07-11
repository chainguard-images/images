locals {
  baseline_packages = ["glibc", "ip6tables", "iptables", "libmnl", "libnetfilter_conntrack", "libnfnetlink"]
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["istio-envoy", "istio-envoy-compat", "istio-pilot-agent", "istio-pilot-agent-compat"]
  description = "The additional packages to install (e.g. istio-envoy, istio-proxy-agent-1.18.2-compat)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/local/bin/pilot-agent"
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
    "environment" : {
      "ISTIO_META_ISTIO_PROXY_SHA" : "f826f1dbddd3326abee19009ea9f019e8a9d5997"
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

