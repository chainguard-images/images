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
  script = "docker run --entrypoint /home/ui-server/ui-server --rm $IMAGE_NAME -v"
}

data "oci_exec_test" "run" {
  digest      = var.digest
  script      = "./run.sh"
  working_dir = path.module
}

