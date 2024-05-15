terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

# TODO: Convert this to imagetest_harness_container when ready
data "oci_exec_test" "version" {
  digest = var.digest
  script = <<EOF
    # We expect the command to fail, but want its output anyway.
    ( docker run --rm $IMAGE_NAME --help 2>&1 || true ) | grep external-secrets
  EOF
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "external-secrets"
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
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }

    webhook = {
      image = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
    }

    certController = {
      image = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
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

