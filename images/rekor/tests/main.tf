terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    server         = string
    cli            = string
    backfill-redis = string
  })
}

data "oci_ref" "curl" {
  ref = "cgr.dev/chainguard/curl:latest-dev"
}

data "oci_ref" "redis" {
  ref = "cgr.dev/chainguard/redis:latest"
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "random_pet" "suffix" {}

resource "helm_release" "rekor" {
  name       = "rekor-${random_pet.suffix.id}"
  repository = "https://sigstore.github.io/helm-charts"
  chart      = "rekor"
  timeout    = 600

  namespace        = "rekor-${random_pet.suffix.id}"
  create_namespace = true

  set {
    name  = "namespace.name"
    value = "rekor-${random_pet.suffix.id}"
  }

  // curl
  set {
    name  = "initContainerImage.curl.registry"
    value = "cgr.dev"
  }
  set {
    name  = "initContainerImage.curl.repository"
    value = "chainguard/curl"
  }
  set {
    name  = "initContainerImage.curl.version"
    value = data.oci_ref.curl.digest
  }

  // redis
  set {
    name  = "redis.image.registry"
    value = "cgr.dev"
  }
  set {
    name  = "redis.image.repository"
    value = "chainguard/redis"
  }
  set {
    name  = "redis.image.version"
    value = data.oci_ref.redis.digest
  }

  // rekor-server
  set {
    name  = "server.image.registry"
    value = data.oci_string.ref["server"].registry
  }
  set {
    name  = "server.image.repository"
    value = data.oci_string.ref["server"].repo
  }
  set {
    name  = "server.image.version"
    value = data.oci_string.ref["server"].digest
  }

  // rekor-server
  set {
    name  = "backfillredis.image.registry"
    value = data.oci_string.ref["backfill-redis"].registry
  }
  set {
    name  = "backfillredis.image.repository"
    value = data.oci_string.ref["backfill-redis"].repo
  }
  set {
    name  = "backfillredis.image.version"
    value = data.oci_string.ref["backfill-redis"].digest
  }

  // scaffolding createtree
  // TODO(mattmoor): Switch to chainguard image
  set {
    name  = "createtree.image.registry"
    value = "ghcr.io"
  }
  set {
    name  = "createtree.image.repository"
    value = "sigstore/scaffolding/createtree"
  }
  set {
    name  = "createtree.image.version"
    value = "sha256:8e921d028b46d5ad98994d58f79e2724cf84e99e3270f5799fe0f1a6b518bc4e"
  }
}

# Based on https://github.com/sigstore/rekor/blob/main/types.md#hashed-rekord
resource "kubernetes_job_v1" "check_rekor" {
  depends_on = [helm_release.rekor]

  metadata {
    name      = "check-rekor"
    namespace = "rekor-${random_pet.suffix.id}"
  }

  spec {
    template {
      metadata {}
      spec {
        init_container {
          name        = "sign"
          image       = "cgr.dev/chainguard/wolfi-base:latest"
          working_dir = "/workspace"
          command     = ["/bin/sh", "-c"]
          args = [<<EOF
          set -ex
          apk add openssl
          openssl ecparam -genkey -name prime256v1 > ec_private.pem
          openssl ec -in ec_private.pem -pubout > ec_public.pem
          echo -n ${random_pet.suffix.id} | openssl dgst -sha256 -sign ec_private.pem -out foo.sig
          EOF
          ]
          volume_mount {
            name       = "workspace"
            mount_path = "/workspace"
          }
        }
        container {
          name  = "check-rekor"
          image = var.digests["cli"]
          args = [
            "upload",
            "--rekor_server=http://rekor-${random_pet.suffix.id}-server.rekor-${random_pet.suffix.id}.svc",
            "--type=hashedrekord:0.0.1",
            "--artifact-hash=${sha256(random_pet.suffix.id)}",
            "--signature=foo.sig",
            "--pki-format=x509",
            "--public-key=ec_public.pem",
          ]
          working_dir = "/workspace"
          volume_mount {
            name       = "workspace"
            mount_path = "/workspace"
          }
        }
        volume {
          name = "workspace"
          empty_dir {}
        }
        restart_policy = "Never"
      }
    }
  }

  wait_for_completion = true
}
