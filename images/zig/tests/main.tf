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
  script = "docker run --rm $IMAGE_NAME version"
}

data "oci_exec_test" "has-shell" {
  digest = var.digest
  script = "docker run --rm --entrypoint sh $IMAGE_NAME -c 'zig version'"
}

data "oci_exec_test" "default-shell" {
  digest = var.digest
  script = "docker run --rm --entrypoint '' $IMAGE_NAME zig version"
}

data "oci_exec_test" "runs-as-root" {
  digest = var.digest
  script = "docker run --rm --entrypoint '' $IMAGE_NAME whoami | grep '^root$'"
}

data "oci_exec_test" "build" {
  digest      = var.digest
  script      = "./build-image.sh"
  working_dir = path.module
}
