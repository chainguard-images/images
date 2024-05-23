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

resource "imagetest_harness_k3s" "this" {
  name      = "zookeeper"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "NAME" : "zookeeper"
      "NAMESPACE" : "zookeeper"
    }
    mounts = [{
      source      = path.module
      destination = "/tmp/tests"
    }]
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "zookeeper"
  namespace = "zookeeper"
  chart     = "oci://registry-1.docker.io/bitnamicharts/zookeeper"

  values = {
    image = {
      registry   = local.parsed.registry
      repository = local.parsed.repo
      digest     = local.parsed.digest
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the ZooKeeper Helm chart."

  steps = [{
    name = "Install Helm chart"
    cmd  = module.helm.install_cmd
    }, {
    name    = "Create ZooKeeper node"
    workdir = "/tmp/tests"
    cmd     = <<EOF
      ./create-node.sh
    EOF
  }]

  labels = {
    type = "k8s"
  }
}
