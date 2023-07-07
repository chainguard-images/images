terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}


# we commented out the Helm tests since the Helm Chart uses the tag in labels, so, once we use pseudo tag, it gives an error like the following:
# [metadata.labels: Invalid value: "unused@sha256:d92268eff1c19eba6c809303294c5041d98f793746d5f5a0212519391fce3b22": must be no more than 63 characters
# https://github.com/dysnix/charts/blob/main/dysnix/proxysql/templates/_helpers.tpl?rgh-link-date=2023-07-06T13%3A57%3A36Z#L41

# data "oci_string" "ref" { input = var.digest }

# resource "helm_release" "proxysql" {
#   name = "proxysql"

#   repository = "https://dysnix.github.io/charts/"
#   chart      = "proxysql"

#   create_namespace = true
#   namespace        = "proxysql"

#   values = [jsonencode({
#     image = {
#       registry   = data.oci_string.ref.registry
#       repository = data.oci_string.ref.repo
#       tag        = data.oci_string.ref.pseudo_tag
#     }
#   })]
# }
