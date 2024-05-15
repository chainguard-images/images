terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digests to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "oci_exec_test" "smoke" {
  digest      = var.digest
  script      = "./smoke.sh"
  working_dir = path.module
}
