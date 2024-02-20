terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. opensearch-2)."
  default = [
    "opensearch-2",
    "openjdk-17-jre-base",
    "openjdk-17-default-jvm",
    "opensearch-2-alerting",
    "opensearch-2-anomaly-detection",
    "opensearch-2-asynchronous-search",
    "opensearch-2-cross-cluster-replication",
    "opensearch-2-custom-codecs",
    "opensearch-2-geospatial",
    "opensearch-2-index-management",
    "opensearch-2-job-scheduler",
    "opensearch-2-k-nn",
    "opensearch-2-ml-commons",
    "opensearch-2-neural-search",
    "opensearch-2-notifications",
    "opensearch-2-observability",
    "opensearch-2-performance-analyzer",
    "opensearch-2-reporting",
    "opensearch-2-security",
    "opensearch-2-security-analytics",
    "opensearch-2-sql",
  ]
}

variable "environment" {
  description = "The additional environment variables to set"
  default     = {}
  type        = map(string)
}

locals { decoded = yamldecode(file("${path.module}/template.apko.yaml")) }
data "apko_config" "this" {
  config_contents = yamlencode(merge(
    local.decoded,
    { environment = merge(local.decoded.environment, var.environment) },
  ))
  extra_packages = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
