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
version="v6.2.2"

kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/$version/client/config/crd/snapshot.storage.k8s.io_volumesnapshots.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/$version/client/config/crd/snapshot.storage.k8s.io_volumesnapshotclasses.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/$version/client/config/crd/snapshot.storage.k8s.io_volumesnapshotcontents.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/$version/deploy/kubernetes/snapshot-controller/rbac-snapshot-controller.yaml

curl https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/$version/deploy/kubernetes/snapshot-controller/setup-snapshot-controller.yaml | \
    sed "s|registry.k8s.io/sig-storage/snapshot-controller:.*|${var.digest}|g" | \
    kubectl apply -f -

kubectl rollout status deployment snapshot-controller -n kube-system --timeout=120s
      EOF
    }
  ]

  labels = {
    type = "k8s"
  }
}
