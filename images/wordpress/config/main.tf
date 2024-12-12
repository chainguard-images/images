variable "base_packages" {
  default = [
    "curl",
    "ca-certificates",
    "imagemagick",
    "php",
    "php-fpm",
    "php-ctype",
    "php-curl",
    "php-dom",
    "php-fileinfo",
    "php-iconv",
    "php-mbstring",
    "php-mysqlnd",
    "php-openssl",
    "php-bcmath",
    "php-intl",
    "php-sodium",
    "php-simplexml",
    "php-xml",
    "php-igbinary",
    "php-mysqli",
    "php-zip",
    "php-xmlwriter",
    "php-xmlreader",
    "php-imagick",
    "php-opcache",
    "wordpress"
  ]
  description = "The additional packages to install (e.g. php-fpm)."
}

variable "php_version" {
  default     = "php"
  description = "Major php version for all the deps"
}

variable "dev_packages" {
  default     = ["wolfi-base", "wordpress-oci-entrypoint"]
  description = "The additional packages to install in the dev image."
}

variable "wp-paths" {
  default = [{
    path        = "/var/www/html",
    type        = "directory",
    uid         = 65532,
    gid         = 65532,
    permissions = 493,
  }]
  description = "File paths for the image"
}

module "accts" {
  name   = "php"
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = [for p in var.base_packages : replace(p, "php", var.php_version)]
    }
    accounts   = module.accts.block
    entrypoint = { command = "php-fpm" }
    work-dir   = "/var/www/html"
    paths      = var.wp-paths
    environment = {
      PATH = "/usr/sbin:/sbin:/usr/bin:/bin"
    }
  })
}

output "config-dev" {
  value = jsonencode({
    contents = {
      packages = concat([for p in var.base_packages : replace(p, "php", var.php_version)], var.dev_packages)
    }
    accounts   = module.accts.block
    entrypoint = { command = "/usr/local/bin/docker-entrypoint.sh php-fpm" }
    work-dir   = "/var/www/html"
    paths = concat(var.wp-paths, [{
      path        = "/var/www/html/wp-content",
      type        = "directory",
      uid         = module.accts.block.run-as,
      gid         = module.accts.block.run-as,
      permissions = 511,
      }, {
      path        = "/usr/src/wordpress",
      type        = "directory",
      uid         = 65532,
      gid         = 65532,
      permissions = 493,
      }
    ])
    environment = {
      PATH = "/usr/sbin:/sbin:/usr/bin:/bin"
    }
  })
}

