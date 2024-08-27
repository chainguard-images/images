terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    snapshot-controller         = string
    snapshot-validation-webhook = string
    snapshotter                 = string
  })
}

data "imagetest_inventory" "inventory" {
}

resource "imagetest_harness_k3s" "k3s" {
  inventory = data.imagetest_inventory.inventory
  name      = "kubernetes-csi-external-snapshotter-k3s"
  sandbox = {
    envs = {
      VALIDATION_WEBHOOK_DIGEST : local.parsed["snapshot-validation-webhook"].digest
      SNAPSHOTTER_DIGEST : local.parsed["snapshotter"].digest
      CONTROLLER_DIGEST : local.parsed["snapshot-controller"].digest

      VALIDATION_WEBHOOK_REGISTRY_REPO : local.parsed["snapshot-validation-webhook"].registry_repo
      SNAPSHOTTER_REGISTRY_REPO : local.parsed["snapshotter"].registry_repo
      CONTROLLER_REGISTRY_REPO : local.parsed["snapshot-controller"].registry_repo
    }
  }
}

locals {
  parsed = { for k, v in var.digests : k => provider::oci::parse(v) }
}

resource "imagetest_feature" "kubernetes-csi-external-snapshotter" {
  description = "Basic install of kubernetes-csi-external-snapshotter"
  harness     = imagetest_harness_k3s.k3s
  labels = {
    type = "k8s"
  }
  name = "Basic install of kubernetes-csi-external-snapshotter"
  steps = [
    {
      name = "Install utilities"
      cmd  = <<EOT
mkdir -p /tmp/upstream
apk add git kubectl jq openssl
EOT
    },
    {
      name    = "Clone upstream repo and update kustomization.yaml with our image"
      workdir = "/tmp/upstream"
      cmd     = <<EOT
git clone https://github.com/kubernetes-csi/external-snapshotter.git --branch release-8.0
cd external-snapshotter

# Update kustomization.yaml to use our image for csi-snapshotter.
cat <<EOF >> ./deploy/kubernetes/csi-snapshotter/kustomization.yaml
images:
  - name: registry.k8s.io/sig-storage/csi-snapshotter
    newName: $SNAPSHOTTER_REGISTRY_REPO
    digest: $SNAPSHOTTER_DIGEST
EOF

cat ./deploy/kubernetes/csi-snapshotter/kustomization.yaml

# Update kustomization.yaml to use our image for snapshot-controller.
cat <<EOF >> ./deploy/kubernetes/snapshot-controller/kustomization.yaml
images:
  - name: registry.k8s.io/sig-storage/snapshot-controller
    newName: $CONTROLLER_REGISTRY_REPO
    digest: $CONTROLLER_DIGEST
EOF
cat ./deploy/kubernetes/snapshot-controller/kustomization.yaml

EOT
    },
    {
      name    = "Install the CRDs"
      workdir = "/tmp/upstream/external-snapshotter"
      cmd     = <<EOT
kubectl kustomize client/config/crd | kubectl create -f -
EOT
    },
    {
      name    = "Install the Common Snapshot Controller and wait for ready"
      workdir = "/tmp/upstream/external-snapshotter"
      cmd     = <<EOT
kubectl -n kube-system kustomize deploy/kubernetes/snapshot-controller | kubectl create -f -

# Just give resources a moment to actually get created before we start waiting
# for them
sleep 5

# Wait for deployment available first before waiting on pods to avoid
# no matching resources if they haven't been spun up yet.
kubectl wait --for=condition=Available deployment snapshot-controller --namespace kube-system  --timeout 5m

kubectl wait --for=condition=Ready pod --selector app.kubernetes.io/name=snapshot-controller --namespace kube-system --timeout 5m
EOT
    },
    {
      name    = "Install the CSI driver and wait for ready"
      workdir = "/tmp/upstream/external-snapshotter"
      cmd     = <<EOT
kubectl kustomize deploy/kubernetes/csi-snapshotter | kubectl create -f -

# Just give resources a moment to actually get created before we start waiting
# for them
sleep 10

kubectl wait --for=condition=Ready Pod --selector app.kubernetes.io/name=csi-snapshotter --timeout 5m

# Then make sure we see the log line saying controller is initialized
kubectl logs -l app.kubernetes.io/name=csi-snapshotter -c csi-snapshotter | grep "controller initialized"

EOT
    },
    {
      name    = "Install the validating webhook and wait for ready"
      workdir = "/tmp/upstream/external-snapshotter"
      cmd     = <<EOT
./deploy/kubernetes/webhook-example/create-cert.sh --service snapshot-validation-service --secret snapshot-validation-secret --namespace default

cat ./deploy/kubernetes/webhook-example/admission-configuration-template | ./deploy/kubernetes/webhook-example/patch-ca-bundle.sh > ./deploy/kubernetes/webhook-example/admission-configuration.yaml

NEW_IMAGE_REF="$VALIDATION_WEBHOOK_REGISTRY_REPO@$VALIDATION_WEBHOOK_DIGEST"
sed -i "s|image: .*|image: $NEW_IMAGE_REF|" ./deploy/kubernetes/webhook-example/webhook.yaml
kubectl apply -f ./deploy/kubernetes/webhook-example

# Just give resources a moment to actually get created before we start waiting
# for them
sleep 10

# Wait for deployment available first before waiting on pods to avoid
# no matching resources if they haven't been spun up yet.
kubectl wait --for=condition=Available deployment snapshot-validation-deployment --timeout 5m

kubectl wait --for=condition=Ready pod --selector app.kubernetes.io/name=snapshot-validation --timeout 5m

EOT
    },
    {
      name    = "Assert that an invalid snapshot is rejected by the webhook"
      workdir = "/tmp/upstream/external-snapshotter"
      cmd     = <<EOT
if kubectl apply -f ./examples/kubernetes/invalid-snapshot-v1.yaml; then
  echo "Test failed: kubectl apply succeeded, but it was expected to fail."
  exit 1
else
  echo "Test passed: kubectl apply failed as expected."
fi

EOT
    },
    {
      name    = "Assert that a valid snapshot is not rejected by the webhook"
      workdir = "/tmp/upstream/external-snapshotter"
      cmd     = <<EOT
if kubectl apply -f examples/kubernetes/snapshot-v1.yaml; then
  echo "Test passed: kubectl apply succeeded as expected"
else
  echo "Test failed: kubectl apply failed, but it was expected to succeed."
  exit 1
fi

EOT
    },
    {
      name    = "Install the volumes, groups, etc."
      workdir = "/tmp/upstream/external-snapshotter/examples/kubernetes"
      cmd     = <<EOT
# First install the things that the snapshot controller needs.
kubectl create -f ./storageclass.yaml
kubectl create -f ./pvc.yaml
# Then the class and the actual snaptshot.
kubectl create -f ./snapshotclass-v1.yaml
# And finally a snapshot.
kubectl create -f ./snapshot-v1.yaml

# Let it come up
sleep 5

# Wait for the snapshot to be ready. Note we can't wait for condition because
# it doesn't have conditions
kubectl wait volumesnapshot new-snapshot-demo-v1 --for=jsonpath='{.status.readyToUse}'=true --timeout=2m

# Then try to restore it.
kubectl create -f ./restore.yaml

# Let it come up
sleep 10

# Wait for the PVC to be bound
kubectl wait pvc hpvc-restore --for=jsonpath='{.status.phase}'=Bound

EOT
    },
  ]
}

