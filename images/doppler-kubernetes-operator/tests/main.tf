terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
    helm   = { source = "hashicorp/helm" }
    random = { source = "hashicorp/random" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_id" "id" { byte_length = 4 }

resource "helm_release" "doppler-kubernetes-operator" {
  name             = "doppler-kubernetes-operator-${random_id.id.hex}"
  namespace        = "doppler-kubernetes-operator"
  repository       = "https://helm.doppler.com"
  chart            = "doppler-kubernetes-operator"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        registry   = data.oci_string.ref.registry
        repository = data.oci_string.ref.repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }),
  ]
}

data "oci_exec_test" "smoke" {
  digest      = var.digest
  script      = "./smoke_test.sh"
  working_dir = path.module
  env = [
    {
      name  = "RELEASE_ID"
      value = random_id.id.hex
    },
    {
      name  = "RELEASE_NAME"
      value = helm_release.doppler-kubernetes-operator.name
    },
    {
      name  = "RELEASE_NAMESPACE"
      value = helm_release.doppler-kubernetes-operator.namespace
    }
  ]
  depends_on = [helm_release.doppler-kubernetes-operator]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.doppler-kubernetes-operator.id
  namespace = helm_release.doppler-kubernetes-operator.namespace
  depends_on = [data.oci_exec_test.smoke]
}
