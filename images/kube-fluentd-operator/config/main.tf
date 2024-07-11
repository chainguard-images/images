locals {
  baseline_packages = ["kube-fluentd-operator-compat", "kube-fluentd-operator-default-config", "kube-fluentd-operator-oci-entrypoint"]
}

module "accts" {
  run-as = 0
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["kube-fluentd-operator"]
  description = "The additional packages to install."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/fluentd/entrypoint.sh"
    },
    "accounts" : module.accts.block,
    "environment" : {
      "FLUENTD_CONF" : "fluent.conf",
      "GEM_HOME" : "/usr/lib/gem/home",
      "GEM_PATH" : "/usr/lib/ruby/gems/3.2.0:/usr/lib/gem/home",
      "LD_PRELOAD" : "/usr/lib/libjemalloc.so.2",
      "PATH" : "/usr/lib/gem/home/bin:usr/local/bundle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    }
  })
}

