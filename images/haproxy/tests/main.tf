terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

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
          repository = local.parsed.registry_repo
          tag        = local.parsed.pseudo_tag
        }
        containerSecurityContext = {
          capabilities = { add = ["NET_BIND_SERVICE"] }
        }
      }
    })
  ]
}
