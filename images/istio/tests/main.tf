terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    install-cni = string
    proxy       = string
    pilot       = string
    operator    = string
  })
}

variable "namespace" {
  description = "The namespace to install Istio in."
}

variable "helm-chart-version" {
  description = "The version of the Helm chart."
  default     = "1.19.0"
}

data "oci_exec_test" "proxy-version" {
  digest = var.digests.proxy
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "pilot-version" {
  digest = var.digests.pilot
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "operator-version" {
  digest = var.digests.operator
  script = "docker run --rm $IMAGE_NAME version"
}

data "oci_string" "operator-ref" { input = var.digests.operator }
data "oci_string" "proxy-ref" { input = var.digests.proxy }
data "oci_string" "install-cni-ref" { input = var.digests.install-cni }
resource "helm_release" "operator" {
  name             = "operator"
  namespace        = local.namespace
  create_namespace = true
  # there's no official helm chart for the istio operator
  repository = "https://stevehipwell.github.io/helm-charts/"
  chart      = "istio-operator"
  values = [jsonencode({
    image = {
      repository = data.oci_string.operator-ref.registry_repo
      tag        = data.oci_string.operator-ref.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.operator.id
  namespace = helm_release.operator.namespace
}

resource "random_pet" "suffix" {}

locals {
  namespace = "istio-system-${random_pet.suffix.id}"
}

resource "helm_release" "base" {
  name             = "${local.namespace}-base"
  namespace        = local.namespace
  create_namespace = true
  repository       = "https://istio-release.storage.googleapis.com/charts/"
  chart            = "base"
  version          = var.helm-chart-version
  replace          = true # Allow reinstallation - as CRDs are not reinstalled anyway.
  values = [jsonencode({
    global = {
      istioNamespace = local.namespace
    }
    # Disable the CRD validation webhook to avoid contention w/ tests of other versions,
    # as this is a cluster-wide resource that we can't customize the name.
    defaultRevision = ""
  })]
}

resource "helm_release" "istiod" {
  depends_on       = [helm_release.base]
  name             = "${local.namespace}-istiod"
  namespace        = local.namespace
  create_namespace = true
  repository       = "https://istio-release.storage.googleapis.com/charts/"
  chart            = "istiod"
  version          = var.helm-chart-version
  values = [jsonencode({
    # Set the revision so that only namespace with istio.io/rev=local.namespace
    # will be managed.
    revision = local.namespace
    pilot = {
      image = var.digests.pilot
    }
    global = {
      istioNamespace = local.namespace
      # These Helm charts do not like slashes in the image name.
      #
      # If the registry_repo is gcr.io/my/repo/istio-proxy, we need to set
      #   hub   = gcr.io/my/repo
      #   image = istio-proxy
      hub = dirname(data.oci_string.proxy-ref.registry_repo)
      proxy = {
        image = basename(data.oci_string.proxy-ref.registry_repo)
      }
      proxy-init = {
        image = basename(data.oci_string.proxy-ref.registry_repo)
      }
      tag = data.oci_string.proxy-ref.pseudo_tag
    }
  })]
}

resource "helm_release" "gateway" {
  # Technically this should only depend on `istiod` installation, but
  # we block this until `install-cni` is done to make sure the CNI plugin
  # installation did not break Pod sandbox creation.
  depends_on       = [helm_release.istiod, helm_release.install-cni]
  name             = "${local.namespace}-gateway"
  namespace        = local.namespace
  create_namespace = true
  repository       = "https://istio-release.storage.googleapis.com/charts/"
  chart            = "gateway"
  version          = var.helm-chart-version
  values = [jsonencode({
    # Set the revision so that only namespace with istio.io/rev=local.namespace
    # will be managed.
    revision = local.namespace
    service = {
      type = "ClusterIP"
    }
    global = {
      istioNamespace = local.namespace
      # These Helm charts do not like slashes in the image param.
      #
      # If the registry_repo is gcr.io/my/repo/istio-proxy, we need to set
      #   hub   = gcr.io/my/repo
      #   image = istio-proxy
      hub = dirname(data.oci_string.proxy-ref.registry_repo)
      proxy = {
        image = basename(data.oci_string.proxy-ref.registry_repo)
      }
      proxy-init = {
        image = basename(data.oci_string.proxy-ref.registry_repo)
      }
      tag = data.oci_string.proxy-ref.pseudo_tag
    }
  })]
}

resource "helm_release" "install-cni" {
  depends_on = [helm_release.base]
  name       = "${local.namespace}-cni"
  namespace  = local.namespace
  repository = "https://istio-release.storage.googleapis.com/charts/"
  chart      = "cni"
  version    = var.helm-chart-version
  values = [jsonencode({
    global = {
      # These Helm charts do not like slashes in the image param.
      #
      # If the registry_repo is gcr.io/my/repo/istio-install-cni, we need to set
      #   hub   = gcr.io/my/repo
      #   image = istio-install-cni
      hub = dirname(data.oci_string.install-cni-ref.registry_repo)
      tag = data.oci_string.install-cni-ref.pseudo_tag
    }
    cni = {
      image = basename(data.oci_string.install-cni-ref.registry_repo)

      # These two settings are highly dependent on the K8s cluster setup.
      cniBinDir  = "/var/lib/rancher/k3s/data/current/bin" # Special thanks to Wolf
      cniConfDir = "/var/lib/rancher/k3s/agent/etc/cni/net.d"
    }
    # Set the revision so that only namespace with istio.io/rev=local.namespace
    # will be managed.
    revision = local.namespace
  })]
}

# Wait for the CNI daemonset to come up
data "oci_exec_test" "install-cni-daemonset-up" {
  depends_on = [helm_release.install-cni]
  digest     = var.digests.proxy
  script     = "kubectl rollout status daemonset -n ${local.namespace} istio-cni-node --timeout 60s"
}

# Test the sidecar injection.
data "oci_exec_test" "sidecar-injection-works" {
  depends_on = [helm_release.istiod]

  script = "${path.module}/test-injection.sh"
  digest = var.digests.proxy

  env {
    name  = "ISTIO_NAMESPACE"
    value = local.namespace
  }
}

# Test that simple VirtualService/Gateway is working.
data "oci_exec_test" "gateway" {
  depends_on = [helm_release.gateway]

  script = "${path.module}/test-gateway.sh"
  digest = var.digests.proxy

  env {
    name  = "ISTIO_NAMESPACE"
    value = local.namespace
  }
}

module "helm_cleanup-gateway" {
  depends_on = [data.oci_exec_test.gateway]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.gateway.id
  namespace  = helm_release.gateway.namespace
}

module "helm_cleanup-istiod" {
  depends_on = [data.oci_exec_test.sidecar-injection-works, data.oci_exec_test.gateway]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.istiod.id
  namespace  = helm_release.istiod.namespace
}

module "helm_cleanup-base" {
  depends_on = [module.helm_cleanup-gateway, module.helm_cleanup-istiod]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.base.id
  namespace  = helm_release.base.namespace
}
