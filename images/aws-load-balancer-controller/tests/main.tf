terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    helm   = { source = "hashicorp/helm" }
    random = { source = "hashicorp/random" }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

resource "helm_release" "aws-load-balancer-controller" {
  name = "aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  set {
    name  = "image.tag"
    value = "unused@${element(split("@", var.digest), 1)}"
  }
  set {
    name  = "image.repository"
    value = element(split("@", var.digest), 0)
  }
  set {
    name  = "image.pullPolicy"
    value = "IfNotPresent"
  }
  set {
    name  = "clusterName"
    value = "kind-kind"
  }
  set {
    name  = "serviceAccount.create"
    value = "true"
  }
  set {
    name  = "region"
    value = "local"
  }
  set {
    name  = "vpcId"
    value = "local"
  }
  set {
    name  = "awsApiEndpoints"
    value = "ec2=http://amazon-ec2-metadata-mock-service.default"
  }
}
