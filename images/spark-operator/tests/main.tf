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

resource "random_pet" "suffix" {}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "k3s" {
  name      = "spark-operator"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]

    envs = {
      "NAMESPACE" : "spark"
      "IMAGE" : "${local.parsed.registry_repo}:${local.parsed.pseudo_tag}"
    }
  }
}

module "helm-spark" {
  source = "../../../tflib/imagetest/helm"

  name      = "spark"
  chart     = "oci://registry-1.docker.io/bitnamicharts/spark"
  namespace = "spark"

  values = {
    worker = {
      replicaCount = 1
    }
  }
}

module "helm-spark-operator" {
  source = "../../../tflib/imagetest/helm"

  name      = "spark-operator"
  repo      = "https://kubeflow.github.io/spark-operator"
  chart     = "spark-operator"
  namespace = "spark"

  values = {
    image = {
      registry   = ""
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    },
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test for spark-operator"
  harness     = imagetest_harness_k3s.k3s

  steps = [
    {
      name = "Install helm-spark"
      cmd  = module.helm-spark.install_cmd
    },
    {
      name = "Install helm-spark-operator"
      cmd  = module.helm-spark-operator.install_cmd
    },
    {
      name    = "Run real test"
      workdir = "/tests"
      cmd     = "./test-spark.sh"
    }
  ]

  labels = {
    type = "k8s"
  }
}
