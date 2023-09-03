terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    sdk     = string
    runtime = string
  })
}

data "oci_exec_test" "sdk-runs" {
  digest = var.digests.sdk
  script = "docker run --rm $IMAGE_NAME dotnet --info > /dev/null"
}

data "oci_exec_test" "runtime-runs" {
  digest = var.digests.runtime
  script = "docker run --rm $IMAGE_NAME --info > /dev/null"
}