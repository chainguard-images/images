terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "scaffolding-images" {
  description = "The image digests to run tests over."
  type = object({
    cloudsqlproxy        = string
    ctlog-createctconfig = string
    ctlog-managectroots  = string
    ctlog-verifyfulcio   = string
    fulcio-createcerts   = string
    getoidctoken         = string
    rekor-createsecret   = string
    trillian-createdb    = string
    trillian-createtree  = string
    trillian-updatetree  = string
    tsa-createcertchain  = string
    tuf-createsecret     = string
  })

  default = {
    cloudsqlproxy        = "cgr.dev/chainguard/sigstore-scaffolding-cloudsqlproxy:latest"
    ctlog-createctconfig = "cgr.dev/chainguard/sigstore-scaffolding-ctlog-createctconfig:latest"
    ctlog-managectroots  = "cgr.dev/chainguard/sigstore-scaffolding-ctlog-managectroots:latest"
    ctlog-verifyfulcio   = "cgr.dev/chainguard/sigstore-scaffolding-ctlog-verifyfulcio:latest"
    fulcio-createcerts   = "cgr.dev/chainguard/sigstore-scaffolding-fulcio-createcerts:latest"
    getoidctoken         = "cgr.dev/chainguard/sigstore-scaffolding-getoidctoken:latest"
    rekor-createsecret   = "cgr.dev/chainguard/sigstore-scaffolding-rekor-createsecret:latest"
    trillian-createdb    = "cgr.dev/chainguard/sigstore-scaffolding-trillian-createdb:latest"
    trillian-createtree  = "cgr.dev/chainguard/sigstore-scaffolding-trillian-createtree:latest"
    trillian-updatetree  = "cgr.dev/chainguard/sigstore-scaffolding-trillian-updatetree:latest"
    tsa-createcertchain  = "cgr.dev/chainguard/sigstore-scaffolding-tsa-createcertchain:latest"
    tuf-createsecret     = "cgr.dev/chainguard/sigstore-scaffolding-tuf-createsecret:latest"
  }
}

variable "support-images" {
  description = "The image digests to run tests over."
  type = object({
    curl  = string
    redis = string
    // TODO: mysql, netcat
  })

  default = {
    curl  = "cgr.dev/chainguard/curl:latest-dev"
    redis = "cgr.dev/chainguard/redis:latest"
  }
}

variable "rekor-images" {
  description = "The image digests to run tests over."
  type = object({
    rekor-server   = string
    rekor-cli      = string
    backfill-redis = string
  })

  default = {
    rekor-server   = "cgr.dev/chainguard/rekor-server:latest"
    rekor-cli      = "cgr.dev/chainguard/rekor-cli:latest"
    backfill-redis = "cgr.dev/chainguard/rekor-backfill-redis:latest"
  }
}

variable "trillian-images" {
  description = "The image digests to run tests over."
  type = object({
    logserver = string
    logsigner = string
  })

  default = {
    logserver = "cgr.dev/chainguard/trillian-logserver:latest"
    logsigner = "cgr.dev/chainguard/trillian-logsigner:latest"
  }
}

variable "ctlog-server" {
  description = "The image digests to run tests over."
  type        = string

  # TODO: switch this to our image once it is published.
  default = "ghcr.io/sigstore/scaffolding/ct_server:latest"
}

# TODO: Fulcio

locals {
  all-images = merge(var.scaffolding-images, var.support-images, var.rekor-images, var.trillian-images, { "ctlog-server" : var.ctlog-server })
}

data "oci_ref" "images" {
  for_each = local.all-images
  ref      = each.value
}

data "oci_string" "images" {
  for_each = local.all-images
  input    = length(regexall("[@]", each.value)) > 0 ? each.value : "${each.value}@${data.oci_ref.images[each.key].digest}"
}

resource "helm_release" "scaffold" {
  name       = "scaffold"
  repository = "https://sigstore.github.io/helm-charts"
  chart      = "scaffold"
  timeout    = 600

  // scaffolding trillian createdb
  set {
    name  = "trillian.createdb.image.registry"
    value = data.oci_string.images["trillian-createdb"].registry
  }
  set {
    name  = "trillian.createdb.image.repository"
    value = data.oci_string.images["trillian-createdb"].repo
  }
  set {
    name  = "trillian.createdb.image.version"
    value = data.oci_string.images["trillian-createdb"].digest
  }

  // scaffolding rekor createtree
  set {
    name  = "rekor.createtree.image.registry"
    value = data.oci_string.images["trillian-createtree"].registry
  }
  set {
    name  = "rekor.createtree.image.repository"
    value = data.oci_string.images["trillian-createtree"].repo
  }
  set {
    name  = "rekor.createtree.image.version"
    value = data.oci_string.images["trillian-createtree"].digest
  }

  // scaffolding ctlog createtree
  set {
    name  = "ctlog.createtree.image.registry"
    value = data.oci_string.images["trillian-createtree"].registry
  }
  set {
    name  = "ctlog.createtree.image.repository"
    value = data.oci_string.images["trillian-createtree"].repo
  }
  set {
    name  = "ctlog.createtree.image.version"
    value = data.oci_string.images["trillian-createtree"].digest
  }

  // scaffolding ctlog createctconfig
  set {
    name  = "ctlog.createctconfig.image.registry"
    value = data.oci_string.images["ctlog-createctconfig"].registry
  }
  set {
    name  = "ctlog.createctconfig.image.repository"
    value = data.oci_string.images["ctlog-createctconfig"].repo
  }
  set {
    name  = "ctlog.createctconfig.image.version"
    value = data.oci_string.images["ctlog-createctconfig"].digest
  }

  // scaffolding fulcio createcerts
  set {
    name  = "fulcio.createcerts.image.registry"
    value = data.oci_string.images["fulcio-createcerts"].registry
  }
  set {
    name  = "fulcio.createcerts.image.repository"
    value = data.oci_string.images["fulcio-createcerts"].repo
  }
  set {
    name  = "fulcio.createcerts.image.version"
    value = data.oci_string.images["fulcio-createcerts"].digest
  }

  // rekor redis
  set {
    name  = "rekor.redis.image.registry"
    value = data.oci_string.images["redis"].registry
  }
  set {
    name  = "rekor.redis.image.repository"
    value = data.oci_string.images["redis"].repo
  }
  set {
    name  = "rekor.redis.image.version"
    value = data.oci_string.images["redis"].digest
  }

  // rekor curl
  set {
    name  = "rekor.initContainerImage.curl.registry"
    value = data.oci_string.images["curl"].registry
  }
  set {
    name  = "rekor.initContainerImage.curl.repository"
    value = data.oci_string.images["curl"].repo
  }
  set {
    name  = "rekor.initContainerImage.curl.version"
    value = data.oci_string.images["curl"].digest
  }

  // ctlog curl
  set {
    name  = "ctlog.createctconfig.initContainerImage.curl.registry"
    value = data.oci_string.images["curl"].registry
  }
  set {
    name  = "ctlog.createctconfig.initContainerImage.curl.repository"
    value = data.oci_string.images["curl"].repo
  }
  set {
    name  = "ctlog.createctconfig.initContainerImage.curl.version"
    value = data.oci_string.images["curl"].digest
  }

  // rekor server
  set {
    name  = "rekor.server.image.registry"
    value = data.oci_string.images["rekor-server"].registry
  }
  set {
    name  = "rekor.server.image.repository"
    value = data.oci_string.images["rekor-server"].repo
  }
  set {
    name  = "rekor.server.image.version"
    value = data.oci_string.images["rekor-server"].digest
  }

  // rekor backfill-redis
  set {
    name  = "rekor.backfillredis.image.registry"
    value = data.oci_string.images["backfill-redis"].registry
  }
  set {
    name  = "rekor.backfillredis.image.repository"
    value = data.oci_string.images["backfill-redis"].repo
  }
  set {
    name  = "rekor.backfillredis.image.version"
    value = data.oci_string.images["backfill-redis"].digest
  }

  // logServer
  set {
    name  = "trillian.logServer.image.registry"
    value = data.oci_string.images["logserver"].registry
  }
  set {
    name  = "trillian.logServer.image.repository"
    value = data.oci_string.images["logserver"].repo
  }
  set {
    name  = "trillian.logServer.image.version"
    value = data.oci_string.images["logserver"].digest
  }

  // trillian logSigner
  set {
    name  = "trillian.logSigner.image.registry"
    value = data.oci_string.images["logsigner"].registry
  }
  set {
    name  = "trillian.logSigner.image.repository"
    value = data.oci_string.images["logsigner"].repo
  }
  set {
    name  = "trillian.logSigner.image.version"
    value = data.oci_string.images["logsigner"].digest
  }

  // ctlog server
  set {
    name  = "ctlog.server.image.registry"
    value = data.oci_string.images["ctlog-server"].registry
  }
  set {
    name  = "ctlog.server.image.repository"
    value = data.oci_string.images["ctlog-server"].repo
  }
  set {
    name  = "ctlog.server.image.version"
    value = data.oci_string.images["ctlog-server"].digest
  }

  # TODO: namespace everything.
}

resource "random_pet" "test-value" {}

# Based on https://github.com/sigstore/rekor/blob/main/types.md#hashed-rekord
resource "kubernetes_job_v1" "check_rekor" {
  depends_on = [helm_release.scaffold]

  metadata {
    name      = "check-rekor"
    namespace = "rekor-system"
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
          echo -n ${random_pet.test-value.id} | openssl dgst -sha256 -sign ec_private.pem -out foo.sig
          EOF
          ]
          volume_mount {
            name       = "workspace"
            mount_path = "/workspace"
          }
        }
        container {
          name  = "check-rekor"
          image = data.oci_string.images["rekor-cli"].id
          args = [
            "upload",
            "--rekor_server=http://rekor-server.rekor-system.svc",
            "--type=hashedrekord:0.0.1",
            "--artifact-hash=${sha256(random_pet.test-value.id)}",
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

# TODO: More tests!

# This is a useful trick for intentionally breaking things to
# inspect the deployed images and ensure we aren't pulling things
# from public registries.
# data "oci_exec_test" "break" {
#   depends_on = [helm_release.scaffold]
#   digest     = data.oci_string.images["rekor-cli"].id
#   script     = "exit 1"
# }

module "helm_cleanup" {
  depends_on = [
    # Don't clean up until all of the tests complete.
    kubernetes_job_v1.check_rekor,
    # data.oci_exec_test.break,
  ]
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.scaffold.id
}
