terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["ca-certificates", "curl", "php", "php-ctype", "php-curl", "php-dom", "php-fileinfo", "php-fpm", "php-iconv", "php-mbstring", "php-mysqlnd", "php-openssl", "php-pdo", "php-pdo_mysql", "php-pdo_sqlite", "php-phar", "php-simplexml", "php-sodium", "php-xml"]
  description = "The additional packages to install (e.g. php-fpm)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "type" : "service-bundle",
      "services" : {
        "php-fpm" : "/usr/sbin/php-fpm"
      }
    },
    "work-dir" : "/app",
    "accounts" : {
      "run-as" : "65532",
      "users" : [
        {
          "username" : "php",
          "uid" : 65532,
          "gid" : 65532
        },
        {
          "username" : "laravel",
          "uid" : 1000,
          "gid" : 1000
        }
      ],
      "groups" : [
        {
          "groupname" : "php",
          "gid" : 65532
        }
      ]
    },
    "paths" : [
      {
        "path" : "/app",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      }
    ]
  })
}

