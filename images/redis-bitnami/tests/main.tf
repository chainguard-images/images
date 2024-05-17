terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    server   = string
    cluster  = string
    sentinel = string
  })
}


locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

resource "random_pet" "suffix" {}

resource "helm_release" "redis" {
  name             = "redis-${random_pet.suffix.id}"
  namespace        = "redis-system-${random_pet.suffix.id}"
  chart            = "oci://registry-1.docker.io/bitnamicharts/redis"
  create_namespace = true
  timeout          = 600

  values = [
    jsonencode({
      image = {
        registry   = local.parsed["server"].registry
        repository = local.parsed["server"].repo
        digest     = local.parsed["server"].digest
      }

      sentinel = {
        enabled = true
        image = {
          registry   = local.parsed["sentinel"].registry
          repository = local.parsed["sentinel"].repo
          digest     = local.parsed["sentinel"].digest
        }
      }
    })
  ]
}


module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.redis.id
  namespace = helm_release.redis.namespace
}
