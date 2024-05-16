terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

locals {
  namespace = "kibana"
  parsed    = provider::oci::parse(var.digest)
}

variable "digest" {
  description = "The image digest to run tests over."
}


data "imagetest_inventory" "this" {}


resource "imagetest_harness_docker" "this" {
  name      = "kibana"
  inventory = data.imagetest_inventory.this

  envs = {
    IMAGE_NAME = var.digest
    TAG        = local.parsed.pseudo_tag
  }
}

resource "imagetest_feature" "this" {
  harness     = imagetest_harness_docker.this
  name        = "kibana"
  description = "Test kibana functionality"

  steps = [
    {
      name = "Run kibana",
      cmd  = <<EOF
        # run a stock upstream elasticsearch image to test with
        ES=$(docker run -e ES_JAVA_OPTS="-Xms256m -Xmx256m" -e http.port="9200" -e "xpack.security.enabled=false" -e "discovery.type=single-node" -d elasticsearch:8.13.4)
        sleep 10
        KIBANA=$(docker run --network container:$ES -d $IMAGE_NAME)
        # let kibana connect to ES
        sleep 30
        docker logs $KIBANA |grep -q "Kibana is now available"
        if [ $? -ne 0 ]; then
          echo "Kibana not available"
          exit 1
        fi
      EOF
    },
  ]
}
