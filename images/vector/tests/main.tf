terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

resource "helm_release" "vector" {
  repository       = "https://helm.vector.dev"
  name             = "vector"
  chart            = "vector"
  namespace        = "vector-namespace"
  create_namespace = true
  timeout          = 120

  values = [
    jsonencode({
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = "latest"
        sha        = trimprefix(data.oci_string.ref.digest, "sha256:")
      }
    })
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.vector.id
  namespace = helm_release.vector.namespace
}
