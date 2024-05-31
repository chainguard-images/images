terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "chart_version" {
  default = ""
}

variable "name" {
  default = "node-feature-discovery"
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = var.name
  inventory = data.imagetest_inventory.this
  sandbox = {
    envs = {
      K8S_NAMESPACE = "default"
      K8S_NAME      = var.name
    }
    mounts = [{
      source      = path.module
      destination = "/tests"
    }]
  }
}

module "install" {
  source = "../../../tflib/imagetest/helm"

  name  = var.name
  chart = "node-feature-discovery"
  repo  = "https://kubernetes-sigs.github.io/node-feature-discovery/charts"
  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }
  chart_version = var.chart_version
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the argocd helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.install.install_cmd
    },
    {
      name  = "Validate logs GC"
      cmd   = <<EOF
        /tests/test-pod-logs-gc.sh
      EOF
      retry = { attempts = 5, delay = "10s" }
    },
    {
      name  = "Validate logs master"
      cmd   = <<EOF
        /tests/test-pod-logs-master.sh
      EOF
      retry = { attempts = 5, delay = "10s" }
    },
    {
      name  = "Validate logs worker"
      cmd   = <<EOF
        /tests/test-pod-logs-worker.sh
      EOF
      retry = { attempts = 5, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
