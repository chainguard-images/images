terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digests to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

variable "license_key" {}

data "oci_exec_test" "smoke" {
  digest      = var.digest
  script      = "./smoke.sh"
  working_dir = path.module

  env = [{
    name  = "NR_API_KEY"
    value = var.license_key
  }]
}
