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

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "istio-system"
  inventory = data.imagetest_inventory.this
  sandbox = {
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
    namespace = local.namespace

    image = {
      repository = data.oci_string.ref["operator"].registry_repo
      tag        = data.oci_string.ref["operator"].pseudo_tag
    }
  }
}

module "helm_istiod" {
  source = "./istiod"

  values = {
    namespace = local.namespace

    # Set the revision so that only namespace with istio.io/rev=local.namespace
    # will be managed.
    revision = local.namespace
    pilot = {
      image = data.oci_string.ref["pilot"].registry_repo
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
    namespace = local.namespace

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
      image = data.oci_string.ref["install-cni"].registry_repo
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
      name = "Create istio-system namespace"
      cmd  = <<EOF
          kubectl create ns ${local.namespace}
        EOF
    },
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