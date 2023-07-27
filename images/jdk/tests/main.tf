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
  script = "docker run --rm $IMAGE_NAME javac -version"
}

module "jre-test" {
  source    = "../../jre/tests"
  digest    = var.digest
  sdk-image = var.digest
}
