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

resource "helm_release" "argocd-repo-server" {
  name             = "argocd"
  namespace        = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  create_namespace = true

  values = [
    jsonencode({
      crds = {
        install = true
        keep    = false
      }
    }),

    # Chainguardification
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

  timeout = 120
}
