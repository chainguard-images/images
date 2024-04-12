terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

locals {
  namespace = "istio-system"
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

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "istio-system"
  inventory = data.imagetest_inventory.this
  sandbox = {
    envs = {
      "ISTIO_NAMESPACE" = local.namespace
    }
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

module "helm_base" {
  source = "./base"
  values = {
    name             = "${local.namespace}-base"
    namespace        = local.namespace
    create_namespace = true

    global = {
      istioNamespace = local.namespace
    }
    # Disable the CRD validation webhook to avoid contention w/ tests of other versions,
    # as this is a cluster-wide resource that we can't customize the name.
    defaultRevision = ""
  }
}

module "helm_operator" {
  source = "./operator"
  values = {
    name             = "operator"
    namespace        = local.namespace
    create_namespace = true

    image = {
      repository = data.oci_string.ref["operator"].registry_repo
      tag        = data.oci_string.ref["operator"].pseudo_tag
    }
  }
}

module "helm_istiod" {
  source = "./istiod"

  values = {
    name             = "${local.namespace}-istiod"
    namespace        = local.namespace
    create_namespace = true

    # Set the revision so that only namespace with istio.io/rev=local.namespace
    # will be managed.
    revision = local.namespace
    pilot = {
      hub   = dirname(data.oci_string.ref["pilot"].registry_repo)
      image = basename(data.oci_string.ref["pilot"].registry_repo)
      tag   = data.oci_string.ref["pilot"].pseudo_tag
    }
    global = {
      istioNamespace = local.namespace
      # These Helm charts do not like slashes in the image name.
      #
      # If the registry_repo is gcr.io/my/repo/istio-proxy, we need to set
      #   hub   = gcr.io/my/repo
      #   image = istio-proxy
      hub = dirname(data.oci_string.ref["proxy"].registry_repo)
      proxy = {
        image = basename(data.oci_string.ref["proxy"].registry_repo)
      }
      proxy-init = {
        image = basename(data.oci_string.ref["proxy"].registry_repo)
      }
      tag = data.oci_string.ref["proxy"].pseudo_tag
    }
  }
}

module "helm_gateway" {
  source = "./gateway"
  values = {
    name             = "${local.namespace}-gateway"
    namespace        = local.namespace
    create_namespace = true

    # Set the revision so that only namespace with istio.io/rev=local.namespace
    # will be managed.
    revision = local.namespace
    service = {
      type = "ClusterIP"
    }
    # this isn't part of the gateway chart, is it used?
    global = {
      istioNamespace = local.namespace
      # These Helm charts do not like slashes in the image param.
      #
      # If the registry_repo is gcr.io/my/repo/istio-proxy, we need to set
      #   hub   = gcr.io/my/repo
      #   image = istio-proxy
      hub = dirname(data.oci_string.ref["proxy"].registry_repo)
      proxy = {
        image = basename(data.oci_string.ref["proxy"].registry_repo)
      }
      proxy-init = {
        image = basename(data.oci_string.ref["proxy"].registry_repo)
      }
      tag = data.oci_string.ref["proxy"].pseudo_tag
    }
  }
}

module "helm_install-cni" {
  source = "./install-cni"
  values = {
    name      = "${local.namespace}-cni"
    namespace = local.namespace

    global = {
      # These Helm charts do not like slashes in the image param.
      #
      # If the registry_repo is gcr.io/my/repo/istio-install-cni, we need to set
      #   hub   = gcr.io/my/repo
      #   image = istio-install-cni
      hub = dirname(data.oci_string.ref["install-cni"].registry_repo)
      tag = data.oci_string.ref["install-cni"].registry_repo
    }
    cni = {
      hub   = dirname(data.oci_string.ref["install-cni"].registry_repo)
      image = basename(data.oci_string.ref["install-cni"].registry_repo)
      tag   = data.oci_string.ref["install-cni"].pseudo_tag

      # These two settings are highly dependent on the K8s cluster setup.
      cniBinDir  = "/var/lib/rancher/k3s/data/current/bin" # Special thanks to Wolf
      cniConfDir = "/var/lib/rancher/k3s/agent/etc/cni/net.d"
    }
    # Set the revision so that only namespace with istio.io/rev=local.namespace
    # will be managed.
    revision = local.namespace
  }
}

resource "imagetest_feature" "this" {
  harness     = imagetest_harness_k3s.this
  name        = "istio"
  description = "Test istio functionality of the various istio helm charts."

  steps = [
    {
      name = "Install base",
      cmd  = module.helm_base.install_cmd
    },
    {
      name = "Install operator",
      cmd  = module.helm_operator.install_cmd
    },
    {
      name = "Install istiod",
      cmd  = module.helm_istiod.install_cmd
    },
    {
      name = "Install gateway",
      cmd  = module.helm_gateway.install_cmd
    },
    {
      name = "Install CNI",
      cmd  = module.helm_install-cni.install_cmd
    },
    {
      name  = "Check install CNI worked",
      cmd   = <<EOF
        kubectl rollout status daemonset -n ${local.namespace} istio-cni-node --timeout 60s
      EOF
      retry = { attempts = 5, delay = "10s" }
    },
    {
      name = "Install curl",
      cmd  = "apk add curl"
    },
    {
      name = "Test injection",
      cmd  = "/tests/test-injection.sh"
    },
    {
      name = "Test Gateway",
      cmd  = "/tests/test-gateway.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
