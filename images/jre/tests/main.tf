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

variable "sdk-image" {
  description = "The SDK image to use for building the java application."
  default     = "cgr.dev/chainguard/jdk"
}

data "imagetest_inventory" "this" {}

resource "imagetest_container_volume" "volume" {
  name      = "scratch-volume"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_harness_docker" "this" {
  name      = "jre"
  inventory = data.imagetest_inventory.this

  volumes = [
    {
      source      = imagetest_container_volume.volume
      destination = "/data"
    }
  ]

  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]

  envs = {
    "SDK_IMAGE" : var.sdk-image
    "IMAGE_NAME" : var.digest
    "JAVA_SOURCE_VERSION" : var.java-source-version
    "JAVA_TARGET_VERSION" : var.java-target-version
    "VOLUME_NAME" : imagetest_container_volume.volume.id
  }
}

resource "imagetest_feature" "basic" {
  name    = "basic test"
  harness = imagetest_harness_docker.this

  steps = [
    {
      name = "Version check"
      cmd  = <<EOT
docker run --rm --entrypoint java $IMAGE_NAME -version
EOT
    },
    {
      name = "Prepare permissions and copy files"
      cmd  = <<EOT
chmod 777 /data
cp -r /tests/* /data
ls -al /data
EOT
    },
    {
      name = "Run tests"
      cmd  = <<EOT
# Compile the .java file into a .class file
docker run --rm \
  -v $VOLUME_NAME:/data \
  --workdir /data \
  --entrypoint javac "$SDK_IMAGE" \
  -source $JAVA_SOURCE_VERSION -target $JAVA_TARGET_VERSION \
  HelloWorld.java

# Now we have the .class file, run it to test our JRE.
docker run --rm \
  -v $VOLUME_NAME:/data \
  --workdir /data \
  --entrypoint java "$IMAGE_NAME" HelloWorld
EOT
    }
  ]
}
