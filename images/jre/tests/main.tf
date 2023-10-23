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

variable "sdk-image" {
  description = "The SDK image to use for building the java application."
  default     = "cgr.dev/chainguard/jdk"
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm --entrypoint /usr/bin/java $IMAGE_NAME -version"
}

data "oci_exec_test" "hello-world" {
  digest = var.digest
  script = "${path.module}/02-hello-world.sh"
  env {
    name  = "SDK_IMAGE"
    value = var.sdk-image
  }
  env {
    name  = "JAVA_SOURCE_VERSION"
    value = var.java-source-version
  }
  env {
    name  = "JAVA_TARGET_VERSION"
    value = var.java-target-version
  }
}
