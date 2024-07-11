locals {
  baseline_packages = ["solr-oci-compat"]
}

module "accts" {
  gid    = 8983
  name   = "solr"
  run-as = 8983
  source = "../../../tflib/accts"
  uid    = 8983
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["solr"]
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
      "command" : "/usr/share/java/solr/docker/scripts/docker-entrypoint.sh"
    },
    "cmd" : "solr-foreground",
    "work-dir" : "/usr/share/java/solr",
    "accounts" : module.accts.block,
    "environment" : {
      "LOG4J_PROPS" : "/var/solr/log4j2.xml",
      "PATH" : "/usr/share/java/solr/bin:/usr/share/java/solr/bin:/usr/share/java/solr/docker/scripts:/usr/share/java/solr/prometheus-exporter/bin:/usr/sbin:/sbin:/usr/bin:/bin",
      "SOLR_HOME" : "/var/solr/data",
      "SOLR_INCLUDE" : "/etc/default/solr.in.sh",
      "SOLR_JETTY_HOST" : "0.0.0.0",
      "SOLR_LOGS_DIR" : "/var/solr/logs",
      "SOLR_PID_DIR" : "/var/solr",
      "SOLR_ZK_EMBEDDED_HOST" : "0.0.0.0"
    },
    "paths" : [
      {
        "path" : "/docker-entrypoint-initdb.d",
        "type" : "directory",
        "uid" : 8983,
        "gid" : 8983,
        "permissions" : 504
      },
      {
        "path" : "/var/solr",
        "type" : "directory",
        "uid" : 8983,
        "gid" : 8983,
        "permissions" : 504,
        "recursive" : true
      },
      {
        "path" : "/var/solr/data",
        "type" : "directory",
        "uid" : 8983,
        "gid" : 8983,
        "permissions" : 504,
        "recursive" : true
      },
      {
        "path" : "/var/solr/logs",
        "type" : "directory",
        "uid" : 8983,
        "gid" : 8983,
        "permissions" : 504,
        "recursive" : true
      },
      {
        "path" : "/usr/share/java/solr/server/resources",
        "type" : "directory",
        "uid" : 8983,
        "gid" : 8983,
        "permissions" : 504,
        "recursive" : true
      }
    ]
  })
}

