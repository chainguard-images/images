terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "cassandra_version" {
  description = "The Cassandra version."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "k8ssandra-operator"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "CASSANDRA_VERSION" = var.cassandra_version
      "IMAGE"             = var.digest
    }
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

# Pre-requisite (not the image under test).
module "helm_cert_manager" {
  source = "../../../tflib/imagetest/helm"
  name   = "cert-manager"
  repo   = "https://charts.jetstack.io"
  chart  = "cert-manager"

  values = {
    image = {
      repository = "cgr.dev/chainguard/cert-manager-controller"
      tag        = "latest"
    }
    cainjector = {
      image = {
        repository = "cgr.dev/chainguard/cert-manager-cainjector"
        tag        = "latest"
      }
    }
    acmesolver = {
      image = {
        repository = "cgr.dev/chainguard/cert-manager-acmesolver"
        tag        = "latest"
      }
    }
    webhook = {
      image = {
        repository = "cgr.dev/chainguard/cert-manager-webhook"
        tag        = "latest"
      }
    }
    installCRDs = "true"
  }
}

# Pre-requisite (not the image under test).
module "helm_k8ssandra" {
  source = "../../../tflib/imagetest/helm"
  name   = "k8ssandra"
  repo   = "https://helm.k8ssandra.io/stable"
  chart  = "k8ssandra-operator"

  values = {
    image = {
      registry   = "cgr.dev"
      repository = "chainguard/k8ssandra-operator",
      tag        = "latest"
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the image."

  steps = [
    {
      name = "Helm install cert-manager"
      cmd  = module.helm_cert_manager.install_cmd
    },
    {
      name = "Helm install k8ssandra"
      cmd  = module.helm_k8ssandra.install_cmd
    },
    {
      name = "Cassandra tests"
      cmd  = "/tests/run-tests.sh"
    }
  ]

  labels = {
    type = "k8s"
  }
}
