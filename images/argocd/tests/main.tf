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
  script = "docker run --rm $${IMAGE_NAME} argocd --help"
}

resource "random_string" "random" {
  length  = 6
  upper   = false
  special = false
}

resource "helm_release" "argocd" {
  name = "argocd-${random_string.random.result}"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo"

  namespace        = "argocd-${random_string.random.result}"
  create_namespace = true
  skip_crds        = true

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
}
