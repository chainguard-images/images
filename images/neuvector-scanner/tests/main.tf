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

data "imagetest_inventory" "this" {}

resource "random_pet" "suffix" {}

module "helm-neuvector" {
  source    = "../../../tflib/imagetest/helm"
  name      = "neuvector-core-${random_pet.suffix.id}"
  namespace = "neuvector"
  repo      = "https://neuvector.github.io/neuvector-helm"
  chart     = "core"

  /*values = {
    scanner = {
      image = {
        image    = data.oci_string.ref.repo
        registry = data.oci_string.ref.registry
        digest   = data.oci_string.ref.digest
      }
    }
  }*/
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
      name = "Set image"
      cmd  = <<EOF
kubectl set image -n neuvector deployment/neuvector-scanner-pod neuvector-scanner-pod="${data.oci_string.ref.registry_repo}:${data.oci_string.ref.pseudo_tag}"
EOF
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
      name  = "Test scanner configuration"
  cmd   = <<EOF
deployment=$(kubectl get -n neuvector deployment/neuvector-scanner-pod -o jsonpath='{.metadata.name}')
if [ -n "$deployment" ]; then
  enabled=$(kubectl get deployment -n neuvector $deployment -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="CVE_SCANNER_ENABLED")].value}')
  replicas=$(kubectl get deployment -n neuvector $deployment -o jsonpath='{.spec.replicas}')

  if [ "$enabled" = "true" ] && [ "$replicas" = "3" ]; then
    echo "Scanner configuration is correct"
    exit 0
  else
    echo "Scanner configuration is incorrect"
    exit 1
  fi
else
  echo "Deployment not found"
  exit 1
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
