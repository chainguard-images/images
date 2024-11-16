locals {
  plugins = [
    "fluent-plugin-elasticsearch",
    "fluent-plugin-cloudwatch-logs",
    "fluent-plugin-newrelic",
    "fluent-plugin-tag-normaliser",
    "fluent-plugin-detect-exceptions",
    "fluent-plugin-label-router",
    "fluent-plugin-prometheus",
    "fluent-plugin-record-modifier",
    "fluent-plugin-rewrite-tag-filter",
    "fluent-plugin-s3",
    "fluent-plugin-splunk-hec",
    "fluent-plugin-opensearch",
    "fluent-plugin-multi-format-parser",
    "fluent-plugin-concat",
    "fluent-plugin-grok-parser",
    "fluent-plugin-kubernetes_metadata_filter",
    "fluent-plugin-systemd",
  ]
}

module "accts" {
  name   = "fluent"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["ruby3.2-fluentd"]
  description = "The additional packages to install (e.g. kubectl-default, kubectl-1.28-default)."
}

output "plugins" {
  description = "The list of fluentd plugins"
  value       = local.plugins
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : concat(var.extra_packages, local.plugins, ["libpq"])
    },
    "entrypoint" : {
      "command" : "/usr/bin/fluentd"
    },
    "accounts" : module.accts.block,
    "environment" : {
      "FLUENTD_CONF" : "fluent.conf",
      "LD_PRELOAD" : ""
    },
    "paths" : [
      {
        "path" : "/fluentd/log",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      },
      {
        "path" : "/fluentd/etc",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      },
      {
        "path" : "/fluentd/plugins",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      },
      {
        "path" : "/etc/fluent/fluent.conf",
        "type" : "empty-file",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 420
      }
    ]
  })
}

