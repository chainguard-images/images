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

resource "random_pet" "suffix" {}

module "helm-neuvector" {
  source = "../../../tflib/imagetest/helm"

  name      = "neuvector-core-${random_pet.suffix.id}"
  namespace = "neuvector"
  repo      = "https://neuvector.github.io/neuvector-helm"
  chart     = "core"
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "neuvector-prometheus-exporter-${random_pet.suffix.id}"
  namespace = "neuvector"
  repo      = "https://neuvector.github.io/neuvector-helm"
  chart     = "monitor"

  values = {
    exporter = {
      apiSvc = "neuvector-svc-controller:10443"
    }
  }
}

resource "imagetest_harness_k3s" "this" {
  name      = "neuvector-prometheus-exporter"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of neuvector-prometheus-exporter."

  steps = [
    {
      name = "Helm install neuvector dependency"
      cmd  = module.helm-neuvector.install_cmd
    },
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },

    {
      name = "Set image"
      cmd  = <<EOF
kubectl set image -n neuvector deployment/neuvector-prometheus-exporter-pod neuvector-prometheus-exporter-pod="${local.parsed.registry_repo}:${local.parsed.pseudo_tag}"
       EOF
    },
    {
      name  = "Ensure it comes up healthy"
      cmd   = <<EOF
kubectl logs -n neuvector --selector app=neuvector-prometheus-exporter-pod
kubectl rollout status -n neuvector deployment/neuvector-prometheus-exporter-pod --timeout=120s
kubectl wait -n neuvector --for=condition=ready pod --selector app=neuvector-prometheus-exporter-pod
       EOF
      retry = { attempts = 3, delay = "2s", factor = 2 }
    },
    {
      name  = "Test metrics"
      cmd   = <<EOF
apk add curl prometheus
kubectl port-forward -n neuvector svc/neuvector-prometheus-exporter 8068 &
until curl -L http://localhost:8068; do sleep 1; done
set -o errexit -o nounset -o errtrace -o pipefail -x
curl -s http://localhost:8068 | promtool check metrics || [ $? -eq 3 ] # Exit code 3 means the lint error, it's fine
EOF
      retry = { attempts = 5, delay = "5s", factor = 2 }
    },
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    create = "15m"
  }
}
