terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
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

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "vault"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "vault"
  namespace = "vault-system"
  chart     = "vault"
  repo      = "https://helm.releases.hashicorp.com"

  values = {
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
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the vault image."

  steps = [
    {
      name = "Helm install vault"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Acceptance test"
      cmd  = <<EOF
apk add jq

KEY=$(kubectl exec -n vault-system vault-0 -- vault operator init \
  -key-shares=1 \
  -key-threshold=1 \
  -format=json | jq -r ".unseal_keys_b64[]")

kubectl exec -n vault-system vault-0 -- vault operator unseal $KEY

kubectl wait --for=condition=ready -n vault-system --timeout=120s pod/vault-0
          EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
