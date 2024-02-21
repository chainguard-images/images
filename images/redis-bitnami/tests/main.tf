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


data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

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
        registry   = data.oci_string.ref["server"].registry
        repository = data.oci_string.ref["server"].repo
        digest     = data.oci_string.ref["server"].digest
      }

      sentinel = {
        enabled = true
        image = {
          registry   = data.oci_string.ref["sentinel"].registry
          repository = data.oci_string.ref["sentinel"].repo
          digest     = data.oci_string.ref["sentinel"].digest
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
