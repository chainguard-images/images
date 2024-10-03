terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "fips_enabled" {
  description = "Indicates whether this is a FIPS image or not."
  default     = 0
}

# Commenting out to diagnose CI
data "oci_exec_test" "check" {
  digest = var.digest
  script = "${path.module}/check.sh"
  env = [
    {
      name  = "FIPS_ENABLED"
      value = var.fips_enabled
    }
  ]
}
