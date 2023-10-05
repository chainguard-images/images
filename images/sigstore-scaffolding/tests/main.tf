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
    tuf-server           = string
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
    tuf-server           = "cgr.dev/chainguard/sigstore-scaffolding-tuf-server:latest"
  }
}

variable "support-images" {
  description = "The image digests to run tests over."
  type = object({
    curl   = string
    mysql  = string
    netcat = string
    redis  = string
  })

  default = {
    curl   = "cgr.dev/chainguard/curl:latest-dev"
    mysql  = "gcr.io/trillian-opensource-ci/db_server:v1.5.2"
    netcat = "cgr.dev/chainguard/netcat:latest"
    redis  = "cgr.dev/chainguard/redis:latest"
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
  default     = "cgr.dev/chainguard/ctlog-trillian-ctserver:latest"
}

variable "fulcio-server" {
  description = "The image digests to run tests over."
  type        = string
  default     = "cgr.dev/chainguard/fulcio:latest"
}

variable "cosign-cli" {
  description = "The image digests to run tests over."
  type        = string
  default     = "cgr.dev/chainguard/cosign:latest"
}

locals {
  all-images = merge(var.scaffolding-images, var.support-images, var.rekor-images, var.trillian-images, { "ctlog-server" : var.ctlog-server }, { "fulcio-server" : var.fulcio-server }, { "cosign-cli" : var.cosign-cli })
}

data "oci_ref" "images" {
  for_each = local.all-images
  ref      = each.value
}

data "oci_string" "images" {
  for_each = local.all-images
  input    = length(regexall("[@]", each.value)) > 0 ? each.value : "${each.value}@${data.oci_ref.images[each.key].digest}"
}

resource "random_pet" "suffix" {}

resource "helm_release" "scaffold" {
  name       = "scaffold-${random_pet.suffix.id}"
  repository = "https://sigstore.github.io/helm-charts"
  chart      = "scaffold"
  timeout    = 600

  // Enable TUF
  set {
    name  = "tuf.enabled"
    value = "true"
  }
  set {
    name  = "copySecretJob.enabled"
    value = "true"
  }
  // This works around a problem where "cosign initialize"
  // cannot handle the TUF root without the file matching
  // this name.
  set {
    name  = "tuf.secrets.ctlog.path"
    value = "ctfe.pub"
  }

  # TODO: Enable TSA
  # Warning  FailedMount  114s (x12 over 10m)  kubelet            MountVolume.SetUp failed for volume "tsa-key" : secret "tsa-server-secret" not found
  # set {
  #   name  = "tsa.enabled"
  #   value = "true"
  # }
  # set {
  #   name  = "tsa.server.args.signer"
  #   value = "file"
  # }

  // Override the Fulcio namespace
  set {
    name  = "fulcio.namespace.name"
    value = "fulcio-${random_pet.suffix.id}"
  }
  set {
    name  = "fulcio.forceNamespace"
    value = "fulcio-${random_pet.suffix.id}"
  }
  set {
    name  = "ctlog.createctconfig.fulcioURL"
    value = "http://fulcio-server.fulcio-${random_pet.suffix.id}.svc"
  }

  // Override the Rekor namespace
  set {
    name  = "rekor.namespace.name"
    value = "rekor-${random_pet.suffix.id}"
  }
  set {
    name  = "rekor.forceNamespace"
    value = "rekor-${random_pet.suffix.id}"
  }
  set {
    name  = "rekor.backfillredis.rekorAddress"
    value = "rekor-server.rekor-${random_pet.suffix.id}.svc"
  }

  // Override the TUF namespace
  set {
    name  = "tuf.namespace.name"
    value = "tuf-${random_pet.suffix.id}"
  }
  set {
    name  = "tuf.forceNamespace"
    value = "tuf-${random_pet.suffix.id}"
  }

  // Override the ctlog namespace
  set {
    name  = "ctlog.namespace.name"
    value = "ctlog-${random_pet.suffix.id}"
  }
  set {
    name  = "ctlog.forceNamespace"
    value = "ctlog-${random_pet.suffix.id}"
  }
  set {
    name  = "fulcio.ctlog.namespace.name"
    value = "ctlog-${random_pet.suffix.id}"
  }

  // Override the trillian namespace
  set {
    name  = "trillian.namespace.name"
    value = "trillian-${random_pet.suffix.id}"
  }
  set {
    name  = "trillian.forceNamespace"
    value = "trillian-${random_pet.suffix.id}"
  }
  set {
    name  = "ctlog.trillian.namespace"
    value = "trillian-${random_pet.suffix.id}"
  }
  set {
    name  = "rekor.trillian.namespace.name"
    value = "trillian-${random_pet.suffix.id}"
  }
  // TODO(mattmoor): Upstream should probably use
  // namespace.name for these, but for some reason
  // it uses forceNamespace.
  set {
    name  = "rekor.trillian.forceNamespace"
    value = "trillian-${random_pet.suffix.id}"
  }

  // Override the secret job's SA (used to namespace Cluster-scoped resources)
  set {
    name  = "copySecretJob.serviceaccount"
    value = "tscj-${random_pet.suffix.id}"
  }

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

  // trillian mysql
  set {
    name  = "trillian.mysql.image.registry"
    value = data.oci_string.images["mysql"].registry
  }
  set {
    name  = "trillian.mysql.image.repository"
    value = data.oci_string.images["mysql"].repo
  }
  set {
    name  = "trillian.mysql.image.version"
    value = data.oci_string.images["mysql"].digest
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

  // trillian curl
  set {
    name  = "trillian.initContainerImage.curl.registry"
    value = data.oci_string.images["curl"].registry
  }
  set {
    name  = "trillian.initContainerImage.curl.repository"
    value = data.oci_string.images["curl"].repo
  }
  set {
    name  = "trillian.initContainerImage.curl.version"
    value = data.oci_string.images["curl"].digest
  }

  // trillian netcat
  set {
    name  = "trillian.initContainerImage.netcat.registry"
    value = data.oci_string.images["netcat"].registry
  }
  set {
    name  = "trillian.initContainerImage.netcat.repository"
    value = data.oci_string.images["netcat"].repo
  }
  set {
    name  = "trillian.initContainerImage.netcat.version"
    value = data.oci_string.images["netcat"].digest
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

  // tuf server
  set {
    name  = "tuf.deployment.registry"
    value = data.oci_string.images["tuf-server"].registry
  }
  set {
    name  = "tuf.deployment.repository"
    value = data.oci_string.images["tuf-server"].repo
  }
  set {
    name  = "tuf.deployment.version"
    value = data.oci_string.images["tuf-server"].digest
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

  // fulcio server
  set {
    name  = "fulcio.server.image.registry"
    value = data.oci_string.images["fulcio-server"].registry
  }
  set {
    name  = "fulcio.server.image.repository"
    value = data.oci_string.images["fulcio-server"].repo
  }
  set {
    name  = "fulcio.server.image.version"
    value = data.oci_string.images["fulcio-server"].digest
  }
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
    kubernetes_job_v1.keyless_sign_verify,
    # data.oci_exec_test.break,
  ]
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.scaffold.id
}
