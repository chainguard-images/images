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

resource "imagetest_harness_docker" "this" {
  name      = "external-secrets-container"
  inventory = data.imagetest_inventory.this

  envs = {
    IMAGE_NAME : var.digest
  }
}

resource "imagetest_feature" "this" {
  harness     = imagetest_harness_docker.this
  name        = "basic container test"
  description = "basic container test to verify that things run as expected"

  steps = [
    {
      name = "Run container"
      cmd  = <<EOT
docker run --rm $IMAGE_NAME --help 2>&1
EOT
    }
  ]
}

resource "imagetest_harness_k3s" "this" {
  name      = "external-secrets-k3s"
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
  source = "../../../tflib/imagetest/helm"
  repo   = "https://charts.external-secrets.io"
  chart  = "external-secrets"
  name   = "external-secrets"
  values = {
    installCRDs = true

    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }

    webhook = {
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }

    certController = {
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the image."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name  = "Check"
      cmd   = <<EOF
        kubectl apply -f /tests/secret-store.yaml
        kubectl apply -f /tests/external-secret.yaml

        sleep 5

        kubectl get secrets secret-to-be-created -n default -o jsonpath="{.data.foo_bar}" | base64 -d | grep HELLO1
        EOF
      retry = { attempts = 10, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}

