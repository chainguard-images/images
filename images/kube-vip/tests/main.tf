terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}


data "oci_exec_test" "smoke" {
  digest      = var.digest
  script      = "./check-kube-vip.sh"
  working_dir = path.module
}

