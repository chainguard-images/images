terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

// Invoke the image's version command.
// $IMAGE_NAME is populated with the image name by digest.
// TODO: Update or remove this test as appropriate.
#data "oci_exec_test" "version" {
#  digest = var.digest
#  script = "docker run --rm -i -t --privileged -v /var/run/docker.sock:/host/var/run/docker.sock -v /proc:/host/proc:ro $IMAGE_NAME --version"
#}

// Invoke a script with the test.
// $IMAGE_NAME is populated with the image name by digest.
// TODO: Update or remove this test as appropriate.
#data "oci_exec_test" "manifest" {
#  digest      = var.digest
#  script      = "./EXAMPLE_TEST.sh"
#  working_dir = path.module
#}

