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

resource "helm_release" "node-local-dns" {
  name = "node-local-dns"

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
