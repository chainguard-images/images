terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "java-source-version" {
  type        = number
  description = "The Java source version to use for compilation in this test."
  default     = 8
}

variable "java-target-version" {
  type        = number
  description = "The Java target version to use for compilation in this test."
  default     = 8
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME javac -version"
}

module "jre-test" {
  source              = "../../jre/tests"
  digest              = var.digest
  sdk-image           = var.digest
  java-source-version = var.java-source-version
  java-target-version = var.java-target-version
}
