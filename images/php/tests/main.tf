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
  script = "docker run --entrypoint php --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "composer" {
  count  = var.check-dev ? 1 : 0
  digest = var.digest
  script = "docker run --entrypoint composer --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "fpm" {
  count  = var.check-fpm ? 1 : 0
  digest = var.digest
  script = "FPMRUN=$( timeout --preserve-status -s TERM 4s docker run --rm $IMAGE_NAME 2>&1 ) && echo $FPMRUN | grep -q 'ready to handle connections'"
}
