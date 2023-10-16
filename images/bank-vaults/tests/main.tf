terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "vault" {
  name       = "vault-operator"
  repository = "oci://ghcr.io/bank-vaults/helm-charts"
  chart      = "vault-operator"

  values = [jsonencode({
    bankVaults = {
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }
  })]
}

data "oci_exec_test" "test" {
  depends_on = [helm_release.vault]
  digest     = var.digest
  script     = "${path.module}/full-test.sh"
}

module "helm-cleanup" {
  depends_on = [data.oci_exec_test.test]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.vault.id
}
