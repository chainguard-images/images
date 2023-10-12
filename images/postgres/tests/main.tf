terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version | grep '^postgres (PostgreSQL) '"
}

data "oci_exec_test" "query" {
  digest = var.digest
  script = "${path.module}/02-query.sh"
}

data "oci_exec_test" "locale" {
  # Avoid name/port collision
  depends_on = [data.oci_exec_test.query]

  digest = var.digest
  script = "${path.module}/03-locale.sh"
}

resource "random_id" "hex" { byte_length = 4 }

resource "helm_release" "bitnami" {
  name       = "postgres-${random_id.hex.hex}"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "postgresql"

  namespace        = "postgres-${random_id.hex.hex}"
  create_namespace = true

  // Point the chart at our Postgres image
  set {
    name  = "image.registry"
    value = data.oci_string.ref.registry
  }
  set {
    name  = "image.repository"
    value = data.oci_string.ref.repo
  }
  set {
    name  = "image.digest"
    value = data.oci_string.ref.digest
  }

  // Fix the UID that is used to run the container
  set {
    name  = "primary.containerSecurityContext.runAsUser"
    value = "70"
  }
}

module "helm_cleanup_bitnami" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.bitnami.id
  namespace = helm_release.bitnami.namespace
}
