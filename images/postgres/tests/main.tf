terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "query" {
  digest = var.digest
  script = "${path.module}/query.sh"
}

data "oci_exec_test" "locale" {
  # Avoid name/port collision
  depends_on = [data.oci_exec_test.query]

  digest = var.digest
  script = "${path.module}/locale.sh"
}

data "oci_exec_test" "tls" {
  digest      = var.digest
  script      = "./tls.sh"
  working_dir = path.module
}