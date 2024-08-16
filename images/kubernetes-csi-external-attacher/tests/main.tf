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
curl https://raw.githubusercontent.com/kubernetes-csi/external-attacher/master/deploy/kubernetes/deployment.yaml \
    | sed "s|registry.k8s.io/k8s-staging-sig-storage/csi-attacher:.*|${var.digest}|g" \
    | kubectl apply -n default -f -

curl https://raw.githubusercontent.com/kubernetes-csi/external-attacher/master/deploy/kubernetes/rbac.yaml \
    | kubectl apply -n default -f -

sleep 5

kubectl rollout status deployment -n default csi-attacher --timeout=120s
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
