terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. php-fpm)."
  default     = ["curl", "ca-certificates", "php", "php-fpm", "php-ctype", "php-curl", "php-dom", "php-fileinfo", "php-iconv", "php-mbstring", "php-mysqlnd", "php-openssl", "php-phar", "php-pdo", "php-pdo_sqlite", "php-pdo_mysql", "php-sodium", "php-simplexml", "php-xml"]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
