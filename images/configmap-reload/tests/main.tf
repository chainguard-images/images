terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    random = { source = "hashicorp/random" }
    helm   = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $${IMAGE_NAME} -h"
}

resource "random_pet" "suffix" {}

resource "helm_release" "dex" {
  name = "configmap-reload-${random_pet.suffix.id}"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "alertmanager"

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  set {
    name  = "configmapReload.image.tag"
    value = "unused@${element(split("@", data.oci_exec_test.version.tested_ref), 1)}"
  }
  set {
    name  = "configmapReload.image.repository"
    value = element(split("@", data.oci_exec_test.version.tested_ref), 0)
  }

  set {
    name  = "configmapReload.enabled"
    value = "true"
  }
}
