terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  default = [
    "openjdk-17-default-jvm",
    # See the logstash package if you want to know more about this. The way
    # logstash does plugins is by using bundler to create an environment with
    # the right gems.
    "logstash-with-output-opensearch",
    "logstash-env2yaml",
    "logstash-compat",
  ]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
