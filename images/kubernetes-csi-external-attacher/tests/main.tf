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
    {
      name = "Install utilities"
      cmd  = <<EOT
mkdir -p /tmp/upstream
apk add git kubectl curl
EOT
    },
    # we need external-provisioner to provision PVCs in csi-driver setup
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
kubectl apply -f ./examples/pod.yaml
# Wait for the PVC to be bound
kubectl wait pvc example-pvc --for=jsonpath='{.status.phase}'=Bound --timeout 2m
EOT
    },
    {
      name = "Verify csi-attacher logs for volume attachment"
      cmd  = <<EOT
# Fetch the leader csi-attacher pod
LEADER_POD=$(kubectl logs deployment/csi-attacher | grep -Eo 'leader="[^"]+"' | cut -d '"' -f 2)
sleep 10
# Now retrieve logs from the leader pod
kubectl logs $LEADER_POD | grep 'CSIHandler: processing VolumeAttachment' || 
kubectl logs $LEADER_POD | grep 'Starting attach operation'
EOT
    }
  ]

  labels = {
    type = "k8s"
  }
}
