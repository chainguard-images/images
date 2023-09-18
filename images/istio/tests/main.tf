terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    proxy    = string
    pilot    = string
    operator = string
  })
}

data "oci_exec_test" "proxy-version" {
  digest = var.digests.proxy
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "pilot-version" {
  digest = var.digests.pilot
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "operator-version" {
  digest = var.digests.operator
  script = "docker run --rm $IMAGE_NAME version"
}

data "oci_string" "ref" { input = var.digests.operator }

resource "helm_release" "operator" {
  name = "operator"

  # There's no official helm chart for the istio operator
  repository = "https://stevehipwell.github.io/helm-charts/"
  chart      = "istio-operator"

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}
