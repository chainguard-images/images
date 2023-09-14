terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "test" {
  for_each = toset(fileset(path.module, "*.sh"))

  digest = var.digest
  script = "${path.module}/${each.value}"
}
