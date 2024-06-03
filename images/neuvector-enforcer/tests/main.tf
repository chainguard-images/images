terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
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
    global = {
      azure = {
        images = {
          tag = local.parsed.pseudo_tag
          repository = local.parsed.repo
          tag = local.parsed.pseudo_tag
        }
      }
    }
  }
}

resource "imagetest_harness_k3s" "this" {
  name      = "neuvector-enforcer"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of neuvector-enforcer."

  steps = [
    {
      name = "Helm install neuvector enforcer"
      cmd  = module.helm-neuvector.install_cmd
    },
    {
      name  = "Ensure it comes up healthy"
      cmd   = <<EOF
kubectl logs -n neuvector --selector app=neuvector-enforcer-pod
kubectl rollout status -n neuvector deployment/neuvector-enforcer-pod --timeout=120s
kubectl wait -n neuvector --for=condition=ready pod --selector app=neuvector-enforcer-pod
EOF
      retry = { attempts = 3, delay = "2s", factor = 2 }
    },
    {
      name  = "Test Deployment Status"
      cmd   = <<EOF
deployment_status=$(kubectl get -n neuvector deployment/neuvector-enforcer-pod -o jsonpath='{.status.conditions[?(@.type=="Available")].status}')
if [ "$deployment_status" != "True" ]; then
  echo "Enforcer configuration is incorrect correct"
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
  name      = "neuvector-enforcer-standalone"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_feature" "container_runs" {
  name        = "enforcer command"
  description = "Standalone enforcer run"
  harness     = imagetest_harness_docker.this

  steps = [
    {
      name = "Check enforcer is running in standalone mode"
      cmd  = <<EOF
        docker run --rm ${var.digest} -image ubuntu:18.04
      EOF
    },
  ]

  labels = {
    type = "container"
  }
}
