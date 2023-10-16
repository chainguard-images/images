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
  # Cosign 2.1 requires a TTY
  # https://github.com/sigstore/cosign/issues/3081
  script = "docker run --rm -t $IMAGE_NAME help"
}

module "sigstore-scaffolding" {
  source     = "../../sigstore-scaffolding/tests"
  cosign-cli = var.digest
}
