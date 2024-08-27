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
      name = "Install"
      cmd  = <<EOF
version="v3.5.0"

curl https://raw.githubusercontent.com/kubernetes-csi/external-provisioner/$version/deploy/kubernetes/deployment.yaml | \
    sed "s|gcr.io/k8s-staging-sig-storage/csi-provisioner:.*|${var.digest}|g" | \
    kubectl apply -f -

kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-provisioner/$version/deploy/kubernetes/rbac.yaml

kubectl rollout status deployment csi-provisioner --timeout=120s
      EOF
    }
  ]

  labels = {
    type = "k8s"
  }
}
