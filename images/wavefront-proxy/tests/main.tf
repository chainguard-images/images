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
  script = <<EOF
    # We expect the command to fail, but want its output anyway.
    ( docker run --rm  -e WAVEFRONT_URL=https://example.com/api -e WAVEFRONT_TOKEN="test" $IMAGE_NAME 2>&1 || true ) | grep "Wavefront Proxy version"
  EOF
}
