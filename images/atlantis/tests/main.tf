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

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME version"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "atlantis"
  inventory = data.imagetest_inventory.this
}

resource "random_pet" "suffix" {}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "runatlantis-${random_pet.suffix.id}"
  namespace = "runatlantis-system-${random_pet.suffix.id}"
  repo      = "https://runatlantis.github.io/helm-charts"
  chart     = "atlantis"
  timeout   = "600s"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
      pullPolicy = "Always"
    }
    github = {
      user   = "not_used_tacocat_user"
      token  = "not_used_tacocat_token"
      secret = "not_used_tacocat_shhhh"
    }
    orgAllowlist = "not_used_tacocat_user"
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "basic"
  description = "Basic functionality of Atlantis installed in a Kubernetes cluster"

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    }
  ]

  labels = {
    type = "k8s",
  }
}
