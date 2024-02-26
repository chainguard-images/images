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


data "oci_exec_test" "smoke" {
  digest      = var.digest
  script      = "./smoke_test.sh"
  working_dir = path.module
  env = [
    {
      name  = "DIGEST"
      value = var.digest
    },
    {
      name  = "REGISTRY"
      value = data.oci_string.ref.registry
    },
    {
      name  = "REPOSITORY"
      value = data.oci_string.ref.repo
    },
    {
      name  = "TAG"
      value = data.oci_string.ref.pseudo_tag
    }
  ]
}

#The test is currently being used to verify that the values are being properly passed to the Helm module.
#The Helm module's order depends on the smoke test to store the variable values before the execution fails.


resource "helm_release" "kuberay-operator" {
  depends_on       = [data.oci_exec_test.smoke]
  name             = "kuberay-operator-${random_pet.suffix.id}"
  namespace        = "kuberay-operator"
  repository       = "https://ray-project.github.io/kuberay-helm/"
  chart            = "kuberay-operator"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }),
  ]
}



module "helm_cleanup" {
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.kuberay-operator.id
  namespace  = helm_release.kuberay-operator.namespace
  depends_on = [helm_release.kuberay-operator]
}
