terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Run tests"
      cmd  = <<EOF
kubectl apply -f https://codeberg.org/hjacobs/kube-downscaler/raw/tag/23.2.0/deploy/config.yaml
kubectl apply -f https://codeberg.org/hjacobs/kube-downscaler/raw/tag/23.2.0/deploy/rbac.yaml
kubectl apply -f https://codeberg.org/hjacobs/kube-downscaler/raw/tag/23.2.0/deploy/deployment.yaml

# The pod can take a few seconds to appear after the deployment and the replicaset are all created and reconcile
sleep 10

# Wait for the default kube-downscaler to be healthy
kubectl wait --for=condition=ready pod --selector application=kube-downscaler --timeout=120s

# Swap out the image
kubectl set image deployment/kube-downscaler downscaler="${var.digest}"

# Wait for the replicaset to be ready and old pods to terminated
kubectl rollout status deployment/kube-downscaler --timeout=120s

# Check the kube-downscaler pods are deployed and healthy
kubectl wait --for=condition=ready pod --selector application=kube-downscaler --timeout=120s
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
