terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "help" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --help"
}

data "oci_exec_test" "test" {
  digest = var.digest
  script = "${path.module}/01-test.sh"
}

resource "random_pet" "suffix" {}

resource "helm_release" "test" {
  name       = "cass-operator-${random_pet.suffix.id}"
  repository = "https://helm.k8ssandra.io/stable"
  chart      = "k8ssandra"
  namespace  = "k8ssandra-system-logger"

  values = [jsonencode({
    imageConfig = {
      systemLogger = "${data.oci_string.ref.registry_repo}:${data.oci_string.ref.pseudo_tag}"
    }
    admissionWebhooks = {
      enabled = false
    }
  })]
}

data "oci_exec_test" "check-deploy" {
  digest      = var.digest
  script      = "./02-deploy.sh"
  working_dir = path.module
  depends_on  = [helm_release.test]
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.test.id
}
