terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    helm      = { source = "hashicorp/helm" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digests to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "opensearch-dashboards"
  inventory = data.imagetest_inventory.this
}

module "helm_opensearch" {
  source = "../../../tflib/imagetest/helm"

  namespace = "opensearch-dashboards"
  chart     = "opensearch"
  repo      = "https://opensearch-project.github.io/helm-charts"

  values = {
    singleNode   = true
    majorVersion = "2"
    image = {
      repository = "cgr.dev/chainguard/opensearch"
      tag        = "latest"
    }
  }
}

module "helm_opensearch_dashboards" {
  source = "../../../tflib/imagetest/helm"

  namespace = "opensearch-dashboards"
  chart     = "opensearch-dashboards"
  repo      = "https://opensearch-project.github.io/helm-charts"

  values = {
    singleNode   = true
    majorVersion = "2"
    startupProbe = { # dashboards pod takes a while to start up especially on k3d
      initialDelaySeconds = 30
      failureThreshold    = 30
    }
    image = {
      repository = "${data.oci_string.ref.registry_repo}"
      tag        = "${data.oci_string.ref.pseudo_tag}"
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the opensearch-dashboard helm chart."

  steps = [
    {
      name = "Helm install Opensearch"
      cmd  = module.helm_opensearch.install_cmd
    },
    {
      name = "Helm install Opensearch Dashboards"
      cmd  = module.helm_opensearch_dashboards.install_cmd
    },
    {
      name = "Ensure it passes cmctl readiness checks"
      cmd  = <<EOF
apk add kubectl
kubectl get pods -A
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
