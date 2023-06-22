terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "help" {
  digest = var.digest
  script = "${path.module}/01-help.sh"
}

# TODO(imjasonh): Uncomment when we have a KinD cluster.
# data "oci_exec_test" "flux-export" {
#   digest = var.digest
#   script = "${path.module}/02-flux-export.sh"
# }
