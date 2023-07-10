terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "runs" {
  digest = var.digest
  // The image has `mount` installed.
  script = "docker run --rm --entrypoint mount $IMAGE_NAME --help"
}

resource "helm_release" "secrets-store-csi-driver" {
  name       = "csi-secrets-store"
  repository = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart      = "secrets-store-csi-driver"
  namespace  = "kube-system"

  values = [jsonencode({
    syncSecret = { enabled = truakee }
    linux = {
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
      // Also test our already-published images.
      registrarImage = {
        repository = "cgr.dev/chainguard/kubernetes-csi-node-driver-registrar"
        tag        = "latest"
      }
      livenessProbeImage = {
        repository = "cgr.dev/chainguard/kubernetes-csi-livenessprobe"
        tag        = "latest"
      }
    }
  })]
}
