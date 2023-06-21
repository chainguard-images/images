terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "${path.module}/01-version.sh"
}

data "oci_exec_test" "query" {
  digest = var.digest
  script = "${path.module}/02-query.sh"
}

data "oci_exec_test" "locale" {
  # Avoid name/port collision
  depends_on = [data.oci_exec_test.query]

  digest = var.digest
  script = "${path.module}/03-locale.sh"
}
