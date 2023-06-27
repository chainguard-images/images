terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    random = { source = "hashicorp/random" }
    helm   = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "run" {
  digest = var.digest
  script = "${path.module}/01-version.sh"
}

resource "random_pet" "suffix" {}

resource "helm_release" "cluster-autoscaler" {
  name = "cluster-autoscaler-${random_pet.suffix.id}"

  repository = "https://kubernetes.github.io/autoscaler"
  chart      = "cluster-autoscaler"

  namespace        = "cluster-autoscaler-${random_pet.suffix.id}"
  create_namespace = true

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  set {
    name  = "global.image.tag"
    value = "unused@${element(split("@", data.oci_exec_test.run.tested_ref), 1)}"
  }
  set {
    name  = "global.image.repository"
    value = element(split("@", data.oci_exec_test.run.tested_ref), 0)
  }
  set {
    name  = "autoDiscovery.clusterName"
    value = "foo"
  }
}
