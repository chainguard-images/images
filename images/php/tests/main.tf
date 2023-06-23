terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "check-dev" {
  default     = false
  description = "Whether to check for dev extensions"
}

variable "check-fpm" {
  default     = false
  description = "Whether to check for php-fpm extensions"
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "${path.module}/01-version.sh"
}

data "oci_exec_test" "composer" {
  count  = var.check-dev ? 1 : 0
  digest = var.digest
  script = "${path.module}/02-composer.sh"
}

data "oci_exec_test" "fpm" {
  count  = var.check-fpm ? 1 : 0
  digest = var.digest
  script = "${path.module}/03-fpm.sh"
}
