terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "inventory" {
}

resource "imagetest_harness_k3s" "k3s" {
  inventory = data.imagetest_inventory.inventory
  name      = "kubernetes-csi-external-provisioner-k3s"
  sandbox = {
    envs = {
      DIGEST : var.digest
    }
  }
}

resource "imagetest_feature" "basic" {
  description = "Basic installation test"
  harness     = imagetest_harness_k3s.k3s
  labels = {
    type = "k8s"
  }
  name = "basic"
  steps = [
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

# Replace with our image
sed -i "s|gcr.io/k8s-staging-sig-storage/csi-provisioner:.*|$DIGEST|g" ./deploy/kubernetes/deployment.yaml

kubectl apply -f ./deploy/kubernetes/deployment.yaml

kubectl rollout status deployment csi-provisioner --timeout=120s
EOT
    },
    {
      name    = "Create PVC and make sure it gets provisioned"
      workdir = "/tmp/upstream/external-provisioner"
      cmd     = <<EOT
kubectl apply -f ./examples/sc.yaml
kubectl apply -f ./examples/pvc.yaml

# Wait for the PVC to be bound
kubectl wait pvc example-pvc --for=jsonpath='{.status.phase}'=Bound --timeout 2m

EOT
    }
  ]
}

