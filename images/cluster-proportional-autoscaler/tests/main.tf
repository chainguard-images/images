terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}
resource "helm_release" "cluster-proportional-autoscaler" {
  name             = "cluster-proportional-autoscaler-${random_pet.suffix.id}"
  repository       = "https://kubernetes-sigs.github.io/cluster-proportional-autoscaler"
  chart            = "cluster-proportional-autoscaler"
  namespace        = "cluster-proportional-autoscaler-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    options = {
      target = "deployment/"
    }

    config = {
      linear = {
        coresPerReplica           = 2
        nodesPerReplica           = 1
        min                       = 1
        max                       = 100
        preventSinglePointFailure = true
        includeUnschedulableNodes = true
      }
    }

    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.cluster-proportional-autoscaler.id
  namespace = helm_release.cluster-proportional-autoscaler.namespace
}
