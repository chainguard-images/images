terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "kfo"
  inventory = data.imagetest_inventory.this
  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

module "helm" {
  source    = "../../../tflib/imagetest/helm"
  name      = "kfo"
  namespace = "kfo"
  chart     = "https://github.com/vmware/kube-fluentd-operator/releases/download/v1.18.1/log-router-0.4.0.tgz"
  values = {
    rbac = {
      create = true
    },
    image = {
      repository = data.oci_string.ref.registry_repo,
      tag        = data.oci_string.ref.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Test a basic installation of kube-fluentd-operator"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name    = "Smoke test"
      workdir = "/tests"
      cmd     = <<EOF
        ./smoke-test.sh
      EOF
    },
  ]

  labels = {
    type = "k8s",
  }
}
