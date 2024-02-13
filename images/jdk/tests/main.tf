terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
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

data "imagetest_inventory" "this" {}

resource "imagetest_harness_container" "this" {
  name      = "jdk"
  image     = var.digest
  inventory = data.imagetest_inventory.this
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_container.this
  name        = "Basic"
  description = "Check that some basic commands run"

  steps = [
    {
      name = "javac -version"
      cmd  = "javac -version"
    },
    {
      name = "keytool -version"
      cmd  = "keytool -version"
    },
    {
      name = "java -version"
      cmd  = "java -version"
    },
    {
      name = "jshell -version"
      cmd  = "jshell -version"
    }
  ]
}

resource "imagetest_feature" "compile" {
  harness     = imagetest_harness_container.this
  name        = "Compile and run"
  description = "Compile and run a simple program"

  steps = [
    {
      name    = "Create test class source"
      workdir = "/tmp"
      cmd     = <<EOT
        echo "class HelloWorld { public static void main(String[] args) { System.out.println(\"Hello, World!\"); } }" >> HelloWorld.java
      EOT
    },
    {
      name    = "Compile test class"
      workdir = "/tmp"
      cmd     = <<EOT
        javac HelloWorld.java
      EOT
    },
    {
      name    = "Run test class"
      workdir = "/tmp"
      cmd     = <<EOT
        sleep 60
        java HelloWorld
      EOT
    }
  ]
}
