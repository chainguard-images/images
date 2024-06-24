terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = basename(path.module)
  namespace = basename(path.module)
  repo      = "https://qdrant.to/helm"
  chart     = "qdrant"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
    readinessProbe = {
      # The readiness check triggers a semver check: https://github.com/qdrant/qdrant-helm/blob/main/charts/qdrant/templates/statefulset.yaml#L124C130-L125C1
      # TODO: Patch/post-render this out
      enabled = false
    }
    startupProbe = {
      enabled = true
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test for qdrant"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Install qdrant"
      cmd  = module.helm.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
