terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "run" {
  digest = var.digest
  script = "docker run --rm $${IMAGE_NAME} --help"
}

resource "random_string" "random" {
  length  = 6
  upper   = false
  special = false
}

resource "helm_release" "argocd-repo-server" {
  depends_on = [data.oci_exec_test.run]

  name = "argocd-repo-server-${random_string.random.result}"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo"

  namespace        = "argocd-repo-server-${random_string.random.result}"
  create_namespace = true

  # The argocd helm chart installs CRDs from the `templates/` directory,
  # and the default value (`false`) conflicts with the providers
  # assumption of them being in `crds/`
  skip_crds = true

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  set {
    name  = "repoServer.image.repository"
    value = "unused@${element(split("@", var.digest), 1)}"
  }
  set {
    name  = "repoServer.image.tag"
    value = element(split("@", var.digest), 0)
  }
}
