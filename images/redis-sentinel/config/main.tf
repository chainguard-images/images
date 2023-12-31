terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

data "apko_config" "this" {
  config_contents = file("${path.module}/6.2.apko.yaml")
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
