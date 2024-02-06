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

resource "random_pet" "suffix" {}

resource "helm_release" "spark" {
  name             = "spark"
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  chart            = "spark"
  namespace        = "spark-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    worker = {
      replicaCount = 1
    }
  })]
}

resource "helm_release" "operator" {
  depends_on       = [resource.helm_release.spark]
  name             = "spark-operator"
  repository       = "https://googlecloudplatform.github.io/spark-on-k8s-operator"
  chart            = "spark-operator"
  namespace        = resource.helm_release.spark.namespace
  create_namespace = true
  values = [jsonencode({
    image = {
      registry   = ""
      repository = data.oci_string.ref.registry_repo,
      tag        = data.oci_string.ref.pseudo_tag
    },
  })]
}

data "oci_exec_test" "run-tests" {
  depends_on  = [resource.helm_release.operator]
  digest      = var.digest
  script      = "./test-spark.sh"
  working_dir = path.module

  env {
    name  = "NAMESPACE"
    value = resource.helm_release.spark.namespace
  }
  env {
    name  = "IMAGE"
    value = "${data.oci_string.ref.registry_repo}:${data.oci_string.ref.pseudo_tag}"
  }
}
