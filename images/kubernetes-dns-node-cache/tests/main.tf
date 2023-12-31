terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

data "oci_exec_test" "runs" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --help"
}

resource "random_id" "id" { byte_length = 4 }

resource "helm_release" "node-local-dns" {
  name             = "node-local-dns-${random_id.id.hex}"
  namespace        = "node-local-dns-${random_id.id.hex}"
  create_namespace = true

  repository = "https://charts.deliveryhero.io/"
  chart      = "node-local-dns"

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
    config = {
      localDns = "0.0.0.0"
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.node-local-dns.id
  namespace = helm_release.node-local-dns.namespace
}
