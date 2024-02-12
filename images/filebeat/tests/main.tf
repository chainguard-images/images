terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

resource "helm_release" "filebeat" {
  name             = "elastic"
  namespace        = "filebeat-${random_pet.suffix.id}"
  repository       = "https://helm.elastic.co"
  chart            = "filebeat"
  create_namespace = true


  values = [
    "${file("${path.module}/values.yaml")}"
  ]

  set {
    name  = "image"
    value = data.oci_string.ref.registry_repo
  }

  set {
    name  = "imageTag"
    value = data.oci_string.ref.pseudo_tag
  }
}

data "oci_exec_test" "check-filebeat" {
  digest      = var.digest
  script      = "./check-filebeat.sh"
  working_dir = path.module
  depends_on  = [helm_release.filebeat]

  env = [{
    name  = "FB_NAMESPACE"
    value = helm_release.filebeat.namespace
  }, ]
}


module "helm_cleanup" {
  depends_on = [data.oci_exec_test.check-filebeat]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.filebeat.id
  namespace  = helm_release.filebeat.namespace
}


