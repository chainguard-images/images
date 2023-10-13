terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. kubectl-default, kubectl-1.28-default)."
  default     = ["ruby3.2-fluentd", "libpq-11"]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

data "apko_config" "splunk" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages = concat(
    var.extra_packages,
    [
      "ruby3.2-fluent-plugin-splunk-hec",
      "ruby3.2-fluent-plugin-prometheus",
      "ruby3.2-fluent-plugin-rewrite-tag-filter",
      "net-tools", # hostname command is required by rewrite-tag-filter plugin
  ])
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}

output "splunk-config" {
  value = jsonencode(data.apko_config.splunk.config)
}
