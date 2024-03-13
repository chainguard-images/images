terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. opensearch-dashboards-2)."
  default = [
    "opensearch-dashboards-2",
    "opensearch-dashboards-2-config",
    "opensearch-dashboards-2-dashboards-observability",
    "opensearch-dashboards-2-dashboards-reporting",
    "opensearch-dashboards-2-dashboards-visualizations",
    "opensearch-dashboards-2-dashboards-query-workbench",
    "opensearch-dashboards-2-dashboards-maps",
    "opensearch-dashboards-2-anomaly-detection-dashboards-plugin",
    "opensearch-dashboards-2-ml-commons-dashboards",
    "opensearch-dashboards-2-index-management-dashboards-plugin",
    "opensearch-dashboards-2-dashboards-notifications",
    "opensearch-dashboards-2-alerting-dashboards-plugin",
    "opensearch-dashboards-2-security-analytics-dashboards-plugin",
    "opensearch-dashboards-2-security-dashboards-plugin",
    "opensearch-dashboards-2-dashboards-search-relevance",
  ]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
