terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "chart_version" {
  description = "The version of the chart to test."
  default     = "latest"
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "aws-load-balancer-controller"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name          = "aws-load-balancer-controller"
  namespace     = "aws-lbc"
  repo          = "https://aws.github.io/eks-charts"
  chart         = "aws-load-balancer-controller"
  chart_version = var.chart_version

  values = {
    image = {
      tag        = data.oci_string.ref.pseudo_tag
      repository = data.oci_string.ref.registry_repo
    }
    clusterName = "k3d-k3s-default"
    serviceAccount = {
      create = true
    }
    region          = "local"
    vpcId           = "local"
    awsApiEndpoints = "ec2=http://amazon-ec2-metadata-mock-service.default"
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Test a basic installation of the AWS LB controller"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    }
  ]

  labels = {
    type = "k8s",
  }
}
