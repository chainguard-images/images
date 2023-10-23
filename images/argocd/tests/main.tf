terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    server      = string
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
        tag        = data.oci_string.ref["server"].pseudo_tag
        repository = data.oci_string.ref["server"].registry_repo
      }
      repoServer = {
        image = {
          tag        = data.oci_string.ref["repo-server"].pseudo_tag
          repository = data.oci_string.ref["repo-server"].registry_repo
        }
      }
      # redis-ha = {
      #   enabled = true
      #   #   image = {
      #   #     repository = "cgr.dev/chainguard/redis"
      #   #     tag        = "latest"
      #   #   }
      #   haproxy = {
      #     image = {
      #       repository = "k3d-k3d.localhost:5005/cg/haproxy"
      #       tag        = "2.8@sha256:d9a67188af5cb89f5398399f704e75079a25e241481d22205de38637bd9052c0"
      #     }
      #
      #     containerSecurityContext = {
      #       capabilities = {
      #         add = ["NET_BIND_SERVICE"]
      #       }
      #     }
      #   }
      # }
    }),
  ]
}

# module "helm_cleanup" {
#   source    = "../../../tflib/helm-cleanup"
#   name      = helm_release.argocd.id
#   namespace = helm_release.argocd.namespace
# }
