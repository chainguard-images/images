terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}


variable "extra_repositories" {
  default     = ["https://packages.cgr.dev/extras"]
  description = "The additional repositores to install from (e.g. extras)."
}

variable "extra_keyring" {
  default     = ["https://packages.cgr.dev/extras/chainguard-extras.rsa.pub"]
  description = "The additional keys to use (e.g. extras)."
}