terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

resource "helm_release" "promtail" {
  name = "promtail"

  repository = "https://grafana.github.io/helm-charts"
  chart      = "promtail"

  values = [jsonencode({
    image = {
      registry   = local.parsed.registry
      repository = local.parsed.repo
      tag        = local.parsed.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.promtail.id
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "use" {
  digest = var.digest
  script = "${path.module}/01-use.sh"
}
