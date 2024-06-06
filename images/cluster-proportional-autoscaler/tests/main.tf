terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

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
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.cluster-proportional-autoscaler.id
  namespace = helm_release.cluster-proportional-autoscaler.namespace
}
