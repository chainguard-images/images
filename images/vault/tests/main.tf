terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    vault     = string
    vault-k8s = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "helm_release" "vault" {
  name             = "vault"
  namespace        = "vault-system"
  repository       = "https://helm.releases.hashicorp.com"
  chart            = "vault"
  create_namespace = true

  values = [
    jsonencode({
      injector = {
        agentImage = {
          repository = data.oci_string.ref["vault"].registry_repo
          tag        = data.oci_string.ref["vault"].pseudo_tag
        }
        image = {
          repository = data.oci_string.ref["vault-k8s"].registry_repo
          tag        = data.oci_string.ref["vault-k8s"].pseudo_tag
        }
      }
      server = {
        image = {
          repository = data.oci_string.ref["vault"].registry_repo
          tag        = data.oci_string.ref["vault"].pseudo_tag
        }
      }
    })
  ]
}

data "oci_exec_test" "acceptance" {
  digest     = var.digests["vault"]
  script     = "${path.module}/acceptance.sh"
  depends_on = [helm_release.vault]
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.acceptance]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.vault.id
  namespace  = helm_release.vault.namespace
}
