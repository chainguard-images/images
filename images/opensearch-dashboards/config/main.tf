locals {
  baseline_packages = ["bash", "busybox", "dumb-init", "font-misc", "font-misc-cyrillic", "fontconfig", "freetype", "libxfont", "nss"]
}

module "accts" {
  gid    = 1000
  run-as = 1000
  source = "../../../tflib/accts"
  uid    = 1000
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["opensearch-dashboards-2", "opensearch-dashboards-2-alerting-dashboards-plugin", "opensearch-dashboards-2-anomaly-detection-dashboards-plugin", "opensearch-dashboards-2-config", "opensearch-dashboards-2-dashboards-maps", "opensearch-dashboards-2-dashboards-notifications", "opensearch-dashboards-2-dashboards-observability", "opensearch-dashboards-2-dashboards-query-workbench", "opensearch-dashboards-2-dashboards-reporting", "opensearch-dashboards-2-dashboards-search-relevance", "opensearch-dashboards-2-dashboards-visualizations", "opensearch-dashboards-2-index-management-dashboards-plugin", "opensearch-dashboards-2-ml-commons-dashboards", "opensearch-dashboards-2-security-analytics-dashboards-plugin", "opensearch-dashboards-2-security-dashboards-plugin"]
  description = "The additional packages to install (e.g. opensearch-dashboards-2)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/dumb-init --"
    },
    "cmd" : "/usr/share/opensearch-dashboards/opensearch-dashboards-docker-entrypoint.sh",
    "work-dir" : "/usr/share/opensearch-dashboards",
    "accounts" : module.accts.block,
    "environment" : {
      "OPENSEARCH_DASHBOARDS_HOME" : "/usr/share/opensearch-dashboards",
      "OSD_NODE_HOME" : "/usr",
      "PATH" : "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/share/opensearch-dashboards/bin"
    },
    "paths" : [
      {
        "path" : "/usr/share/opensearch-dashboards",
        "type" : "directory",
        "uid" : 1000,
        "gid" : 1000,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}

