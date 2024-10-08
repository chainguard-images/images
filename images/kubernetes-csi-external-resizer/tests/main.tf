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

curl https://raw.githubusercontent.com/kubernetes-csi/external-resizer/master/deploy/kubernetes/deployment.yaml \
    | sed "s|gcr.io/k8s-staging-sig-storage/csi-resizer:.*|${var.digest}|g" \
    | kubectl apply -n default -f -

curl https://raw.githubusercontent.com/kubernetes-csi/external-resizer/master/deploy/kubernetes/rbac.yaml \
    | kubectl apply -n default -f -
sleep 10

kubectl rollout status deployment csi-resizer --timeout=120s
      EOF
    },
    {
      name = "Install utilities"
      cmd  = <<EOT
mkdir -p /tmp/upstream
apk add git kubectl curl
EOT
    },
    {
      name    = "Grab the upstream repo, and install the provisioner"
      workdir = "/tmp/upstream"
      cmd     = <<EOT
git clone https://github.com/kubernetes-csi/external-provisioner.git --branch release-5.1
cd external-provisioner
kubectl apply -f ./deploy/kubernetes/rbac.yaml
kubectl apply -f ./deploy/kubernetes/deployment.yaml
kubectl rollout status deployment csi-provisioner --timeout=120s
EOT
    },
    {
      name    = "Create PVC and Pod"
      workdir = "/tmp/upstream/external-provisioner"
      cmd     = <<EOT
kubectl apply -f ./examples/sc.yaml
kubectl apply -f ./examples/pvc.yaml
# Wait for the PVC to be bound
kubectl wait pvc example-pvc --for=jsonpath='{.status.phase}'=Bound --timeout 2m
EOT
    },
    {
      name = "Verify csi-attacher logs for volume attachment"
      cmd  = <<EOT
kubectl logs deployment/csi-resizer | grep 'Started PVC processing for resize controller" key="default/example-pvc'
kubectl logs deployment/csi-resizer | grep 'No need to resize PVC" PVC="default/example-pvc'
EOT
    }
  ]

  labels = {
    type = "k8s"
  }
}
