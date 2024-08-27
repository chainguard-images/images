terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}
locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

# volume for maven generated project
resource "imagetest_container_volume" "mvn-archetype" {
  name      = "mvn-archetype"
  inventory = data.imagetest_inventory.this
}

# volume to cache .m2 repository
resource "imagetest_container_volume" "mvn-m2" {
  name      = "mvn-m2"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_harness_docker" "docker" {
  name      = "docker"
  inventory = data.imagetest_inventory.this

  envs = {
    IMAGE_NAME : var.digest
    VOLUME_ID : imagetest_container_volume.mvn-archetype.id
    M2_VOLUME_ID : imagetest_container_volume.mvn-m2.id
  }

  mounts = [{
    source      = path.module
    destination = "/tests"
  }]

  volumes = [
    {
      destination = "/data"
      source      = imagetest_container_volume.mvn-archetype
    },
    {
      destination = "/m2"
      source      = imagetest_container_volume.mvn-m2
    }
  ]
}

resource "imagetest_feature" "test" {
  name    = "docker-test"
  harness = imagetest_harness_docker.docker

  steps = [
    {
      name = "mvn archetype"
      cmd  = <<EOT
        chmod -R 777 /data
        chmod -R 777 /m2

        # generate a pom.xml and App.java
        docker run \
          -v "$VOLUME_ID":/home/build \
          -v "$M2_VOLUME_ID":/home/maven/.m2 \
          --workdir /home/build \
          $IMAGE_NAME \
          archetype:generate \
          -DgroupId=dev.chainguard \
          -DartifactId=hello-world \
          -Dversion=1.0 \
          -DarchetypeVersion=1.4 \
          -DinteractiveMode=false
        
        # archetype:generate defaults to 1.7, but that's ooooold
        sed 's#<maven.compiler.source>1.7#<maven.compiler.source>1.8#g' -i /data/hello-world/pom.xml
        sed 's#<maven.compiler.target>1.7#<maven.compiler.target>1.8#g' -i /data/hello-world/pom.xml

EOT
    },
    {
      name = "mvn compile"
      cmd  = <<EOT
        docker run \
          -v "$VOLUME_ID":/home/build \
          -v "$M2_VOLUME_ID":/home/maven/.m2 \
          --workdir /home/build/hello-world \
          $IMAGE_NAME \
          compile
EOT
    },
    {
      name = "mvn exec"
      cmd  = <<EOT
        docker run \
          -v "$VOLUME_ID":/home/build \
          -v "$M2_VOLUME_ID":/home/maven/.m2 \
          --workdir /home/build/hello-world \
          $IMAGE_NAME \
          exec:java -Dexec.mainClass="dev.chainguard.App" -q | grep 'Hello World!'
EOT
    }
  ]
}

