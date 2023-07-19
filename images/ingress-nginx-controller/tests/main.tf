terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digests to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "${path.module}/01-version.sh"
}

# resource "random_pet" "suffix" {}

# resource "helm_release" "ingress-nginx-controller" {
#   name = "ingress-nginx-controller-${random_pet.suffix.id}"

#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argo"

#   namespace        = "ingress-nginx-controller-${random_pet.suffix.id}"
#   create_namespace = true

#   # The argocd helm chart installs CRDs from the `templates/` directory,
#   # and the default value (`false`) conflicts with the providers
#   # assumption of them being in `crds/`
#   skip_crds = true

#   values = [
#     jsonencode({
#       image = {
#         tag        = data.oci_string.ref["argocd"].pseudo_tag
#         repository = data.oci_string.ref["argocd"].registry_repo
#       }
#       repoServer = {
#         image = {
#           tag        = data.oci_string.ref["repo-server"].pseudo_tag
#           repository = data.oci_string.ref["repo-server"].registry_repo
#         }
#       }
#     }),
#   ]
# }
