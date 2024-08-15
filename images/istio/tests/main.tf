terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    install-cni = string
    proxy       = string
    pilot       = string
    operator    = string
  })
}

variable "k3s_harness_image" {
  description = "The image to use for the k3s harness."
  # null specifically so it picks the provider default
  default = null
}

variable "chart_versions" {
  description = "The version of the Helm chart to install."
  type = object({
    install-cni = string
    proxy       = string
    pilot       = string
    operator    = string
  })
  default = {
    # empty == "latest"
    install-cni = ""
    proxy       = ""
    pilot       = ""
    operator    = ""
  }
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

locals {
  namespace = "istio-system"
  # working namespace used for tests requiring injection
  test-namespace = "foo"
}

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module

  k3s_image = var.k3s_harness_image
}

module "helm_base" {
  source        = "./helm/base"
  chart_version = var.chart_versions["proxy"]
  values = {
    namespace = local.namespace

    global = {
      istioNamespace = local.namespace
    }
  }
}

module "helm_operator" {
  source = "./helm/operator"
  values = {
    name             = "operator"
    namespace        = local.namespace
    create_namespace = true

    image = {
      repository = local.parsed["operator"].registry_repo
      tag        = local.parsed["operator"].pseudo_tag
    }
  }
}

module "helm_istiod" {
  source = "./helm/istiod"

  chart_version = var.chart_versions["proxy"]
  values = {
    name             = "istiod"
    namespace        = local.namespace
    create_namespace = true

    pilot = {
      hub   = dirname(local.parsed["pilot"].registry_repo)
      image = basename(local.parsed["pilot"].registry_repo)
      tag   = local.parsed["pilot"].pseudo_tag
    }
    global = {
      istioNamespace = local.namespace
      # These Helm charts do not like slashes in the image name.
      #
      # If the registry_repo is gcr.io/my/repo/istio-proxy, we need to set
      #   hub   = gcr.io/my/repo
      #   image = istio-proxy
      hub = dirname(local.parsed["proxy"].registry_repo)
      proxy = {
        image = basename(local.parsed["proxy"].registry_repo)
      }
      proxy-init = {
        image = basename(local.parsed["proxy"].registry_repo)
      }
      tag = local.parsed["proxy"].pseudo_tag
    }
  }
}

module "helm_gateway" {
  source        = "./helm/gateway"
  chart_version = var.chart_versions["proxy"]
  values = {
    name             = "gateway"
    namespace        = local.namespace
    create_namespace = true

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
      hub = dirname(local.parsed["proxy"].registry_repo)
      proxy = {
        image = basename(local.parsed["proxy"].registry_repo)
      }
      proxy-init = {
        image = basename(local.parsed["proxy"].registry_repo)
      }
      tag = local.parsed["proxy"].pseudo_tag
    }
  }
}

module "helm_install-cni" {
  source        = "./helm/install-cni"
  chart_version = var.chart_versions["install-cni"]
  values = {
    name      = "cni"
    namespace = local.namespace

    global = {
      # These Helm charts do not like slashes in the image param.
      #
      # If the registry_repo is gcr.io/my/repo/istio-install-cni, we need to set
      #   hub   = gcr.io/my/repo
      #   image = istio-install-cni
      hub = dirname(local.parsed["install-cni"].registry_repo)
      tag = local.parsed["install-cni"].registry_repo
    }
    cni = {
      hub   = dirname(local.parsed["install-cni"].registry_repo)
      image = basename(local.parsed["install-cni"].registry_repo)
      tag   = local.parsed["install-cni"].pseudo_tag

      # These two settings are highly dependent on the K8s cluster setup.
      cniBinDir  = "/bin"
      cniConfDir = "/var/lib/rancher/k3s/agent/etc/cni/net.d"
    }
  }
}

resource "imagetest_feature" "this" {
  harness     = module.cluster_harness.harness
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
      name  = "Assert readiness"
      cmd   = <<EOF
kubectl rollout status -n istio-system deploy/istiod
kubectl get mutatingwebhookconfigurations istio-sidecar-injector
      EOF
      retry = { attempts = 5, delay = "10s" }
    },
    {
      name = "Test injection"
      cmd  = <<EOF
kubectl apply -f- <<YAML
---
apiVersion: v1
kind: Namespace
metadata:
  name: ${local.test-namespace}
  labels:
    istio-injection: enabled
---
apiVersion: v1
kind: Pod
metadata:
  name: bar
  namespace: ${local.test-namespace}
spec:
  containers:
  - args:
    - bin/sleep
    - "36000"
    image: cgr.dev/chainguard/busybox:latest
    name: bar
YAML

kubectl wait -n ${local.test-namespace} pods/bar --for=condition=ready --timeout=4m

# count the number of containers
if [[ "$(kubectl get pod -n ${local.test-namespace} bar -ojsonpath='{range .spec.containers[*]}{.image}{"\n"}{end}' | wc -l)" -ne "2" ]]; then
    exit 1
fi
      EOF
    },
    {
      name = "Test Gateway"
      cmd  = <<EOF
kubectl apply -f- <<YAML
---
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: test-gateway
  namespace: ${local.test-namespace}
spec:
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - "ingress.test.foo"
---
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: test-virtual-service
  namespace: ${local.test-namespace}
spec:
  gateways:
  - test-gateway
  hosts:
  - "ingress.test.foo"
  http:
  - directResponse:
      status: 200
      body:
        string: "Yes it's working\n"
---
apiVersion: batch/v1
kind: Job
metadata:
  name: istio-curl-check
  namespace: ${local.test-namespace}
spec:
  backoffLimit: 4
  template:
    spec:
      restartPolicy: Never
      containers:
      - name: curl-check
        image: cgr.dev/chainguard/curl:latest-dev
        command: ["/bin/sh", "-c"]
        args:
        - |
          # Polling sidecar's health endpoint
          until curl -s http://localhost:15021/healthz/ready; do
            echo "Waiting for Istio sidecar to be ready..."
            sleep 2
          done

          # Main request to the gateway
          if curl -f http://gateway.istio-system.svc.cluster.local -H "Host: ingress.test.foo"; then
            echo "Request successful"
            EXIT_CODE=0
          else
            echo "Request failed"
            EXIT_CODE=1
          fi

          # Shutting down Istio sidecar
          curl -X POST http://127.0.0.1:15020/quitquitquit

          # Exit with the appropriate status code
          exit $EXIT_CODE
YAML

kubectl wait --for=condition=complete --timeout=120s -n ${local.test-namespace} job/istio-curl-check
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
