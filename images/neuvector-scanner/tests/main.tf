terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "helm-neuvector" {
  source    = "../../../tflib/imagetest/helm"
  name      = "neuvector-core"
  namespace = "neuvector"
  repo      = "https://neuvector.github.io/neuvector-helm"
  chart     = "core"
  values = {
    cve = {
      scanner = {
        image = {
          registry   = local.parsed.registry
          repository = local.parsed.repo
          tag        = local.parsed.pseudo_tag
        }
      }
    }
  }
}

resource "imagetest_harness_k3s" "this" {
  name      = "neuvector-scanner"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of neuvector-scanner."

  steps = [
    {
      name = "Helm install neuvector scanner"
      cmd  = module.helm-neuvector.install_cmd
    },
    {
      name  = "Ensure it comes up healthy"
      cmd   = <<EOF
kubectl logs -n neuvector --selector app=neuvector-scanner-pod
kubectl rollout status -n neuvector deployment/neuvector-scanner-pod --timeout=120s
kubectl wait -n neuvector --for=condition=ready pod --selector app=neuvector-scanner-pod
EOF
      retry = { attempts = 3, delay = "2s", factor = 2 }
    },
    {
      name  = "Test Deployment Status"
      cmd   = <<EOF
deployment_status=$(kubectl get -n neuvector deployment/neuvector-scanner-pod -o jsonpath='{.status.conditions[?(@.type=="Available")].status}')
if [ "$deployment_status" != "True" ]; then
  echo "Scanner configuration is incorrect correct"
  exit 0
fi
EOF
      retry = { attempts = 5, delay = "10s", factor = 2 }
    },
  ]
  labels = {
    type = "k8s"
  }

  timeouts = {
    create = "15m"
  }
}

resource "imagetest_harness_docker" "this" {
  name      = "neuvector-scanner-standalone"
  inventory = data.imagetest_inventory.this

  envs = {
    IMAGE_REGISTRY   = data.oci_string.ref.registry
    IMAGE_REPOSITORY = data.oci_string.ref.repo
    IMAGE_TAG        = data.oci_string.ref.pseudo_tag
  }

  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]
}

resource "imagetest_feature" "container_runs" {
  name        = "Scanner command"
  description = "Standalone scanner run"
  harness     = imagetest_harness_docker.this

  steps = [
    {
      name = "Check scanner is running in standalone mode"
      cmd  = "docker run --rm $IMAGE_REGISTRY/$IMAGE_REPOSITORY:$IMAGE_TAG -image ubuntu:18.04"
    },
  ]

  labels = {
    type = "container"
  }
}
