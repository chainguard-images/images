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

# The package does not expose a --version endpoint, but does expose --help.
data "oci_exec_test" "test_help_cmd" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --help"
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

  repo      = "https://joe-elliott.github.io/cert-exporter"
  chart     = "cert-exporter"
  namespace = "monitoring" # Hardcoded expected Namespace based on upstream 

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test for KSM"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Helm Install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Check"
      cmd  = "$WORK/test-pod-logs.sh ${module.helm.release_name}-cert-exporter-cert-manager"
    }
  ]

  labels = {
    type = "k8s"
  }
}

