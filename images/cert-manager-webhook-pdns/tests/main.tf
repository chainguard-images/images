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

data "oci_exec_test" "help" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME -h"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "cert-manager-webhook-pdns"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ],
    envs = {
      "NAMESPACE" = "cert-manager-webhook-pdns-${random_pet.suffix.id}"
    }
  }
}

resource "random_pet" "suffix" {}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "cert-manager-webhook-pdns-${random_pet.suffix.id}"
  namespace = "cert-manager-webhook-pdns-${random_pet.suffix.id}"
  repo      = "https://zachomedia.github.io/cert-manager-webhook-pdns"
  chart     = "cert-manager-webhook-pdns"
  timeout   = "600s"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }
}

module "helm-cert-manager" {
  source = "../../../tflib/imagetest/helm"

  name      = "cert-manager"
  repo      = "https://charts.jetstack.io"
  chart     = "cert-manager"
  namespace = "cert-manager"
  timeout   = "600s"

  values = {
    installCRDs = true
  }
}

module "helm-powerdns" {
  source = "../../../tflib/imagetest/helm"

  name      = "powerdns"
  repo      = "https://k8s-at-home.com/charts"
  chart     = "powerdns"
  namespace = "powerdns"
  timeout   = "600s"
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "basic"
  description = "Basic functionality of cert-manager-webhook-pdns installed in a Kubernetes cluster"

  steps = [
    {
      # App needs cert-manager and its CRDs as a prerequisite.
      name = "cert-manager install"
      cmd  = module.helm-cert-manager.install_cmd
    },
    {
      # Smoke tests needs PowerDNS.
      name = "PowerDNS install"
      cmd  = module.helm-powerdns.install_cmd
    },
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Run smoke tests"
      cmd  = "/tests/01-smoke.sh"
    },
  ]

  labels = {
    type = "k8s",
  }
}
