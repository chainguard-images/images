terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals {
  parsed = provider::oci::parse(var.digest)
}

data "imagetest_inventory" "this" {
}

resource "imagetest_harness_k3s" "this" {
  inventory = data.imagetest_inventory.this
  name      = "zookeeper"
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
  chart     = "oci://registry-1.docker.io/bitnamicharts/zookeeper"
  name      = "zookeeper"
  namespace = "zookeeper"
  source    = "../../../tflib/imagetest/helm"
  values = {
    image = {
      registry   = local.parsed.registry
      repository = local.parsed.repo
      digest     = local.parsed.digest
    }
  }
}

resource "imagetest_feature" "basic" {
  description = "Basic functionality of the ZooKeeper Helm chart."
  harness     = imagetest_harness_k3s.this
  labels = {
    type = "k8s"
  }
  name = "Basic"
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
}

