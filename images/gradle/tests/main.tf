terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "java-version" {
  description = "Java version"
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "build" {
  digest = var.digest
  script = "${path.module}/build.sh"
  env = [
    {
      name  = "JAVA_VERSION"
      value = var.java-version
    }
  ]
}
