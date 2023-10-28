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

resource "helm_release" "logging-operator" {
  name             = "klof-operator-${random_pet.suffix.id}"
  repository       = "oci://ghcr.io/kube-logging/helm-charts"
  chart            = "logging-operator"
  namespace        = "klof-operator-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    testReceiver = {
      enabled = true
    }
  })]
}

resource "helm_release" "log-generator" {
  name             = "klof-generator-${random_pet.suffix.id}"
  repository       = "oci://ghcr.io/kube-logging/helm-charts"
  chart            = "log-generator"
  namespace        = "klof-generator-${random_pet.suffix.id}"
  create_namespace = true
}


data "oci_exec_test" "check-logging-operator" {
  digest      = var.digest
  script      = "./check-logs.sh"
  working_dir = path.module
  depends_on  = [helm_release.logging-operator, helm_release.log-generator]

  env = [{
    name  = "LOGGING_OPERATOR_NAMESPACE"
    value = helm_release.logging-operator.namespace
    }, {
    name  = "LOG_GENERATOR_NAMESPACE"
    value = helm_release.log-generator.namespace
    }, {
    name  = "FLUENTD_REPOSITORY"
    value = data.oci_string.ref.registry_repo
    }, {
    name  = "FLUENTD_TAG"
    value = data.oci_string.ref.pseudo_tag
  }]
}

module "helm-cleanup-operator" {
  depends_on = [data.oci_exec_test.check-logging-operator]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.logging-operator.id
  namespace  = helm_release.logging-operator.namespace
}

module "helm-cleanup-generator" {
  depends_on = [data.oci_exec_test.check-logging-operator]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.log-generator.id
  namespace  = helm_release.log-generator.namespace
}

resource "null_resource" "delete_namespaces" {
  depends_on = [module.helm-cleanup-operator, module.helm-cleanup-generator]
  provisioner "local-exec" {
    command = <<EOF
    set -ex
    kubectl delete ns ${helm_release.logging-operator.namespace}
    kubectl delete ns ${helm_release.log-generator.namespace}
    EOF
  }
}
