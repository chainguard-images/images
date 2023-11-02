terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

resource "random_pet" "suffix" {}

resource "helm_release" "redis-ha" {
  name             = "haproxy-redis-${random_pet.suffix.id}"
  namespace        = "haproxy-system-${random_pet.suffix.id}"
  repository       = "https://dandydeveloper.github.io/charts"
  chart            = "redis-ha"
  create_namespace = true
  timeout          = 300

  values = [
    jsonencode({
      image = {
        registry = "cgr.dev/chainguard/redis"
        tag      = "latest"
      }
      hardAntiAffinity = false
      haproxy = {
        enabled          = true
        hardAntiAffinity = false
        image = {
          repository = data.oci_string.ref.registry_repo
          tag        = data.oci_string.ref.pseudo_tag
        }
        containerSecurityContext = {
          capabilities = { add = ["NET_BIND_SERVICE"] }
        }
      }
    })
  ]
}
