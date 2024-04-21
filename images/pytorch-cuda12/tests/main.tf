terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "pytorch"
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

  name      = "pytorch"
  namespace = "pytorch"
  repo      = "https://charts.bitnami.com/bitnami"
  chart     = "pytorch"
  timeout   = "900s"

  values = {
    containerName = "pytorch"
    image = {
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      digest     = data.oci_string.ref.digest
    }
    containerSecurityContext = {
      runAsUser                = 0
      runAsGroup               = 0
      runAsNonRoot             = false
      allowPrivilegeEscalation = true
      readOnlyRootFilesystem   = false
    }
    resourcesPreset = "none"
    volumePermissions = {
      resourcesPreset = "none"
    }
    persistence = {
      size = "2Gi"
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the Pytorch Helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name    = "Pytorch Helm tests"
      workdir = "/tests"
      cmd     = <<EOF
        ./check-pytorch.sh
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
