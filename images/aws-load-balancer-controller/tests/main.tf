terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
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

/*
TODO: Re-enable when AWS webhook cleans up after itself more reliably.

resource "random_pet" "suffix" {}

resource "helm_release" "aws-load-balancer-controller" {
  name = "aws-load-balancer-controller-${random_pet.suffix.id}"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = var.chart_version

  namespace        = "aws-lbc-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
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
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.aws-load-balancer-controller.id
  namespace = helm_release.aws-load-balancer-controller.namespace
}
*/
