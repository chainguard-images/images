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
  script = "docker run --rm --entrypoint sh $IMAGE_NAME -c 'go version'"
}

data "oci_exec_test" "default-shell" {
  digest = var.digest
  script = "docker run --rm --entrypoint '' $IMAGE_NAME go version"
}

data "oci_exec_test" "runs-as-root" {
  digest = var.digest
  script = "docker run --rm --entrypoint '' $IMAGE_NAME whoami | grep '^root$'"
}

data "oci_exec_test" "has-git" {
  digest = var.digest
  script = "docker run --rm --entrypoint git $IMAGE_NAME version"
}

data "oci_exec_test" "has-ssh" {
  digest = var.digest
  script = "docker run --rm --entrypoint ssh $IMAGE_NAME -V"
}

data "oci_exec_test" "base-image" {
  digest = var.digest
  script = "${path.module}/base-image.sh"
}

data "oci_exec_test" "base-image-custom-entrypoint" {
  digest = var.digest
  script = "${path.module}/base-image-custom-entrypoint.sh"
}

data "oci_exec_test" "build" {
  digest      = var.digest
  script      = "./build-example.sh"
  working_dir = path.module
}
