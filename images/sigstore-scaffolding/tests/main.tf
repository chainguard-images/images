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

variable "tsa-server" {
  description = "The TSA image to use in testing"
  type        = string
  default     = "cgr.dev/chainguard/timestamp-authority-server"
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
  all-images = merge(var.scaffolding-images, var.support-images, var.rekor-images, var.trillian-images, { "ctlog-server" : var.ctlog-server }, { "fulcio-server" : var.fulcio-server }, { "cosign-cli" : var.cosign-cli }, { "tsa-server" : var.tsa-server })
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

  // This is the base set of values with images overridden,
  // but we still have overrides for namespacing here so that
  // values.tf can act as a reference since end-users don't
  // really care about our crazy namespacing shenanigans for
  // testing.
  values = [jsonencode(yamldecode(local.values))]

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

  // Override the TSA namespace
  set {
    name  = "tsa.forceNamespace"
    value = "tsa-${random_pet.suffix.id}"
  }

  set {
    name  = "tsa.namespace.name"
    value = "tsa-${random_pet.suffix.id}"
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

  // Disable all of the ingresses because we test from on the cluster itself
  // using cluster-local services.
  set {
    name  = "fulcio.server.ingress.http.enabled"
    value = "false"
  }
  set {
    name  = "rekor.server.ingress.enabled"
    value = "false"
  }
  set {
    name  = "tuf.ingress.create"
    value = "false"
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
