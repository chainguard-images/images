terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "kubernetes-autoscaler-addon-resizer"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the kubernetes-autoscaler-addon-resizer."

  steps = [
    {
      name = "Deploy"
      cmd  = <<EOF
 kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/master/addon-resizer/deploy/example.yaml
 kubectl set image deployment/nanny-v1 pod-nanny="${data.oci_string.ref.registry_repo}:${data.oci_string.ref.pseudo_tag}"
       EOF
    },
    {
      name  = "Ensure it comes up healthy"
      cmd   = <<EOF
 kubectl rollout status deployment/nanny-v1 --timeout=120s
 kubectl wait --for=condition=ready pod --selector k8s-app=nanny
       EOF
      retry = { attempts = 3, delay = "2s", factor = 2 }
    },
    {
      name = "Check logs"
      cmd  = "kubectl logs deployment/nanny-v1 | grep -qi 'Watching namespace'"
    }
  ]

  labels = {
    type = "k8s"
  }
}
