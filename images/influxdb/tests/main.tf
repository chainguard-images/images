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

data "oci_exec_test" "run" {
  digest      = var.digest
  script      = "./run.sh"
  working_dir = path.module
}

resource "random_pet" "suffix" {}

resource "helm_release" "influxdb" {
  name = "influxdb-${random_pet.suffix.id}"

  repository = "https://helm.influxdata.com"
  chart      = "influxdb2"

  namespace        = "influxdb-${random_pet.suffix.id}"
  create_namespace = true

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  set {
    name  = "image.tag"
    value = "unused@${element(split("@", data.oci_exec_test.run.tested_ref), 1)}"
  }
  set {
    name  = "image.repository"
    value = element(split("@", data.oci_exec_test.run.tested_ref), 0)
  }
}
