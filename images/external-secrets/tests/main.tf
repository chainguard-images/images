terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = <<EOF
    # We expect the command to fail, but want its output anyway.
    ( docker run --rm $IMAGE_NAME --help 2>&1 || true ) | grep external-secrets
  EOF
}

resource "random_pet" "suffix" {}

resource "helm_release" "external-secrets" {
  name = "external-secrets-${random_pet.suffix.id}"

  repository = "https://charts.external-secrets.io"
  chart      = "external-secrets"

  namespace        = "external-secrets-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    installCRDs = true

    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }

    webhook = {
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }

    certController = {
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }
  })]
}

data "oci_exec_test" "check-external-secrets" {
  digest      = var.digest
  script      = "./check-external-secrets.sh"
  working_dir = path.module
  depends_on  = [helm_release.external-secrets]
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.check-external-secrets]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.external-secrets.id
  namespace  = helm_release.external-secrets.namespace
}
