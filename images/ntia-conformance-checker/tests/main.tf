terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "check-ply" {
  digest      = var.digest
  script      = "docker run --rm -v $(pwd)/sbom.json:/sbom.json $IMAGE_NAME --file /sbom.json"
  working_dir = path.module
}
