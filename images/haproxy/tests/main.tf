terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "test_repository" {}

variable "is_slim" {
  description = "Whether to run tests for the slim variant of the image."
  type        = bool
  default     = false
}

variable "no_caps" {
  description = "Whether to run tests for the nocaps variant of the image."
  type        = bool
  default     = false
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "bash_sandbox_nocaps" {
  source            = "../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "bash_sandbox_slim" {
  source            = "../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "k8s_helm" {
  count       = (!var.is_slim && !var.no_caps) ? 1 : 0
  source      = "../../../tflib/imagetest/tests/helm/"
  sandbox_ref = module.bash_sandbox.image_ref

  name      = "haproxy-redis"
  namespace = "haproxy-system"
  repo      = "https://dandydeveloper.github.io/charts"
  chart     = "redis-ha"

  values = {
    image = {
      registry = "cgr.dev/chainguard/redis"
      tag      = "latest"
    }
    hardAntiAffinity = false
    haproxy = {
      enabled          = true
      hardAntiAffinity = false
      image = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
      containerSecurityContext = {
        capabilities = { add = ["NET_BIND_SERVICE"] }
      }
    }
  }
}

module "k8s_test" {
  count  = (!var.is_slim && !var.no_caps) ? 1 : 0
  source = "../../../tflib/imagetest/tests/k3s-in-docker/"

  images = { haproxy = var.digest }
  cwd    = path.module

  tests = [
    module.k8s_helm[0].test
  ]
}

module "k8s_helm_nocaps" {
  count       = var.no_caps ? 1 : 0
  source      = "../../../tflib/imagetest/tests/helm/"
  sandbox_ref = module.bash_sandbox_nocaps.image_ref

  name      = "haproxy-redis"
  namespace = "haproxy-system"
  repo      = "https://dandydeveloper.github.io/charts"
  chart     = "redis-ha"

  values = {
    image = {
      registry = "cgr.dev/chainguard/redis"
      tag      = "latest"
    }
    hardAntiAffinity = false
    haproxy = {
      enabled          = true
      hardAntiAffinity = false
      image = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
    }
  }
}

module "k8s_test_nocaps" {
  count  = var.no_caps ? 1 : 0
  source = "../../../tflib/imagetest/tests/k3s-in-docker/"

  images = { haproxy = var.digest }
  cwd    = path.module

  tests = [
    module.k8s_helm_nocaps[0].test
  ]
}

module "test_slim" {
  count  = var.is_slim ? 1 : 0
  source = "../../../tflib/imagetest/tests/k3s-in-docker/"

  cwd    = path.module
  images = { haproxy = var.digest }
  tests = [
    {
      name  = "test"
      image = module.bash_sandbox_slim.image_ref
      envs = {
        NGINX_IMAGE = "${var.test_repository}/nginx:latest"
        CURL_IMAGE  = "${var.test_repository}/curl:latest"
      }
      cmd = "./k8s-slim.sh"
    }
  ]
}
