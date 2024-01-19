terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

resource "random_pet" "suffix" {
  length = 1
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "cert-manager" {
  name             = "cert-manager-${random_pet.suffix.id}"
  namespace        = "cert-manager"
  repository       = "https://charts.jetstack.io" // TODO
  chart            = "cert-manager"               // TODO
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "helm_release" "helm" {
  // We use a shortened name to avoid hitting the 63 character limit for cert-manager names.
  name             = "k8ss-op-${random_pet.suffix.id}"
  namespace        = "k8ss-op-${random_pet.suffix.id}"
  repository       = "https://helm.k8ssandra.io/stable" // TODO
  chart            = "k8ssandra-operator"               // TODO
  create_namespace = true

  // Requires cert-manager to be installed first.
  depends_on = [helm_release.cert-manager]

  values = [jsonencode({
    image = {
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.helm.id
  namespace = helm_release.helm.namespace
}

module "helm_cleanup_cert_manager" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.cert-manager.id
  namespace = helm_release.cert-manager.namespace

  // Uninstall in reverse order so we don't clean this up prematurely.
  depends_on = [module.helm_cleanup]
}
