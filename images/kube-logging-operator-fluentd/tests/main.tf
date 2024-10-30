terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "name" {
  default = "kube-logging-operator-fluentd"
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = var.name
  inventory = data.imagetest_inventory.this
  sandbox = {
    envs = {
      "LOGGING_OPERATOR_NAMESPACE" : "operator"
      "LOG_GENERATOR_NAMESPACE" : "generator"
      "FLUENTD_REPOSITORY" : local.parsed.registry_repo
      "FLUENTD_TAG" : local.parsed.pseudo_tag
    }
    mounts = [{
      source      = path.module
      destination = "/tests"
    }]
  }
}

module "helm_operator" {
  source = "../../../tflib/imagetest/helm"

  name      = "operator"
  chart     = "oci://ghcr.io/kube-logging/helm-charts/logging-operator"
  namespace = "operator"
  wait      = true

  values = {
    testReceiver = {
      enabled = true
    }
  }
}

module "helm_generator" {
  source = "../../../tflib/imagetest/helm"

  name      = "generator"
  chart     = "oci://ghcr.io/kube-logging/helm-charts/log-generator"
  namespace = "generator"
  wait      = true
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the argocd helm chart."

  steps = [
    {
      name = "Helm install operator"
      cmd  = "echo '${module.helm_operator.install_cmd}'"
    },
    {
      name = "Helm install operator"
      cmd  = module.helm_operator.install_cmd
    },
    {
      name = "Helm install generator"
      cmd  = module.helm_generator.install_cmd
    },
    {
      name = "Exercise the app"
      cmd  = <<EOF
        /tests/check-logs.sh
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
