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

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  repo  = "https://stakater.github.io/stakater-charts"
  chart = "reloader"
  name  = "reloader"

  values = {
    reloader = {
      deployment = {
        image = {
          tag  = local.parsed.pseudo_tag
          name = local.parsed.registry_repo
        }
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Helm Install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "feature testing"
      cmd  = <<EOT
# create a configmap with foo=bar literal
kubectl create configmap foo-configmap --from-literal=foo=bar
# create a deployment with the configmap mounted as a volume
kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: reloader-deployment
  annotations:
    configmap.reloader.stakater.com/reload: "foo-configmap"
spec:
  replicas: 1
  selector:
    matchLabels:
      app: foo
  template:
    metadata:
      labels:
        app: foo
    spec:
      containers:
      - name: foo-container
        image: nginx
        env:
        - name: FOO_VALUE
          valueFrom:
            configMapKeyRef:
              name: foo-configmap
              key: foo
EOF


kubectl wait --for=condition=available --timeout=60s deployment/reloader-deployment
# check if the configmap value is mounted as an env var
kubectl exec deployment/reloader-deployment -- printenv FOO_VALUE | grep bar
# update the configmap with foo=tada literal
kubectl patch configmap foo-configmap -p '{"data": {"foo": "tada"}}'
kubectl wait --for=condition=available --timeout=60s deployment/reloader-deployment
# sleep for 10 seconds for the first pod to terminate
sleep 10s
# check if the configmap value is updated in the env var
kubectl exec deployment/reloader-deployment -- printenv FOO_VALUE | grep tada
# grep the reloader pod logs for the configmap update
kubectl logs deployment/reloader-reloader | grep "Starting Reloader"
kubectl logs deployment/reloader-reloader | grep "Changes detected in"
      EOT
    }
  ]

  labels = {
    type = "k8s"
  }
}
