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
    # Logstash is basically composed of a bunch of wrapper scripts to set up an
    # environment and then execute the proper code. It fails with a bunch of
    # 'command not found' errors if busybox is missing and a 'docker-entrypoint
    # not found' if bash is missing.
    "busybox",
    "bash",
  ]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
