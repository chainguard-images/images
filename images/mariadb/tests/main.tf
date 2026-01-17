terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

variable "test_repository" {
  description = "The docker repo root to use for sourcing test images."
}

locals {
  parsed = provider::oci::parse(var.digest)
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash/"
  target_repository = var.target_repository
}

module "dind_test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker"

  images = { mariadb = var.digest }
  cwd    = path.module

  tests = [
    {
      name  = "database and tls"
      image = module.bash_sandbox.image_ref
      cmd   = "./run-tests.sh"
    }
  ]
}

# Operator-based k8s testing to catch image incompatibilities

module "k8s_helm_crds" {
  source      = "../../../tflib/imagetest/tests/helm/"
  sandbox_ref = module.bash_sandbox.image_ref

  name      = "mariadb-operator-crds"
  namespace = "mariadb-system"
  chart     = "mariadb-operator-crds"
  repo      = "https://helm.mariadb.com/mariadb-operator"

  values = {}
}

module "k8s_helm_operator" {
  source      = "../../../tflib/imagetest/tests/helm/"
  sandbox_ref = module.bash_sandbox.image_ref
  depends_on  = [module.k8s_helm_crds]

  name      = "mariadb-operator"
  namespace = "mariadb-system"
  chart     = "mariadb-operator"
  repo      = "https://helm.mariadb.com/mariadb-operator"

  values = {
    image = {
      repository = "${var.test_repository}/mariadb-operator"
      tag        = "latest"
      pullPolicy = "IfNotPresent"
    }

    webhook = {
      enabled = false
    }

    certController = {
      enabled = false
    }

    metrics = {
      enabled = false
    }
  }
}

module "k8s_operator_test" {
  source = "../../../tflib/imagetest/tests/k3s-in-docker/"

  images = { mariadb = var.digest }
  cwd    = path.module

  tests = concat(
    [
      module.k8s_helm_crds.test,
      module.k8s_helm_operator.test,
    ],
    [{
      name  = "operator deploy test"
      image = module.bash_sandbox.image_ref
      cmd   = "./k8s-operator-test.sh"
      envs = {
        IMAGE_REGISTRY   = local.parsed.registry
        IMAGE_REPOSITORY = local.parsed.repo
        IMAGE_TAG        = local.parsed.pseudo_tag
      }
    }]
  )
}
