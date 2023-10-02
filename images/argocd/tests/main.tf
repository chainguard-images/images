terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    argocd      = string
    repo-server = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "helm_release" "argocd" {
  name = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  namespace        = "argocd"
  create_namespace = true

  # The argocd helm chart installs CRDs from the `templates/` directory,
  # and the default value (`false`) conflicts with the providers
  # assumption of them being in `crds/`
  skip_crds = true

  values = [
    jsonencode({
      image = {
        tag        = data.oci_string.ref["argocd"].pseudo_tag
        repository = data.oci_string.ref["argocd"].registry_repo
      }
      repoServer = {
        image = {
          tag        = data.oci_string.ref["repo-server"].pseudo_tag
          repository = data.oci_string.ref["repo-server"].registry_repo
        }
      }
    }),
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.argocd.id
  namespace = helm_release.argocd.namespace
}
