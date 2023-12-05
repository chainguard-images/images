terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "hello-world" {
  digest      = var.digest
  script      = "docker run --entrypoint sh -v $(pwd):/test --workdir /test $IMAGE_NAME ./hello-world.sh"
  working_dir = path.module
}
