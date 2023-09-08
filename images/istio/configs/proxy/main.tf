
terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. istio-envoy, istio-proxy-agent-1.18.2-compat)."
  default = [
    "istio-envoy",
    "istio-envoy-compat",
    "istio-pilot-agent",
    "istio-pilot-agent-compat",
  ]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
