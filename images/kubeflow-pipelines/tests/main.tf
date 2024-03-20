terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    api-server            = string
    cache-server          = string
    metadata-envoy        = string
    metadata-writer       = string
    persistenceagent      = string
    scheduledworkflow     = string
    viewer-crd-controller = string
    cache-deployer        = string
    frontend              = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "kubeflow-pipelines"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      KUBEFLOW_PIPELINES_VERSION = "2.0.4"
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the kubeflow-pipelines installation."

  steps = [
    {
      name = "Configure kustomize overlay"
      cmd  = <<EOF
cat <<EOm > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - github.com/kubeflow/pipelines/manifests/kustomize/env/platform-agnostic-pns?ref=$KUBEFLOW_PIPELINES_VERSION
images:
  - name: gcr.io/ml-pipeline/api-server
    newName: ${data.oci_string.ref["api-server"].registry_repo}
    newTag: ${data.oci_string.ref["api-server"].pseudo_tag}
  - name: gcr.io/ml-pipeline/cache-deployer
    newName: ${data.oci_string.ref["cache-deployer"].registry_repo}
    newTag: ${data.oci_string.ref["cache-deployer"].pseudo_tag}
  - name: gcr.io/ml-pipeline/cache-server
    newName: ${data.oci_string.ref["cache-server"].registry_repo}
    newTag: ${data.oci_string.ref["cache-server"].pseudo_tag}
  - name: gcr.io/ml-pipeline/metadata-writer
    newName: ${data.oci_string.ref["metadata-writer"].registry_repo}
    newTag: ${data.oci_string.ref["metadata-writer"].pseudo_tag}
  - name: gcr.io/ml-pipeline/persistenceagent
    newName: ${data.oci_string.ref["persistenceagent"].registry_repo}
    newTag: ${data.oci_string.ref["persistenceagent"].pseudo_tag}
  - name: gcr.io/ml-pipeline/scheduledworkflow
    newName: ${data.oci_string.ref["scheduledworkflow"].registry_repo}
    newTag: ${data.oci_string.ref["scheduledworkflow"].pseudo_tag}
  - name: gcr.io/ml-pipeline/frontend
    newName: ${data.oci_string.ref["frontend"].registry_repo}
    newTag: ${data.oci_string.ref["frontend"].pseudo_tag}
  - name: gcr.io/ml-pipeline/metadata-envoy
    newName: ${data.oci_string.ref["metadata-envoy"].registry_repo}
    newTag: ${data.oci_string.ref["metadata-envoy"].pseudo_tag}
EOm
      EOF
    },
    {
      name = "Install it"
      # https://www.kubeflow.org/docs/components/pipelines/v1/installation/localcluster-deployment/#deploying-kubeflow-pipelines
      cmd = <<EOF
apk add kustomize
kubectl apply -k "github.com/kubeflow/pipelines/manifests/kustomize/cluster-scoped-resources?ref=$KUBEFLOW_PIPELINES_VERSION"
kubectl wait --for condition=established --timeout=60s crd/applications.app.k8s.io
kustomize build . | kubectl apply -f -
      EOF
    },
    {
      name = "Wait for ml-pipeline relevant things to be ready"
      cmd  = <<EOF
kubectl wait --for=condition=available -n kubeflow deployment/ml-pipeline-persistenceagent
kubectl wait --for=condition=available -n kubeflow deployment/ml-pipeline-scheduledworkflow
kubectl wait --for=condition=available -n kubeflow deployment/ml-pipeline-viewer-crd
kubectl wait --for=condition=available -n kubeflow deployment/ml-pipeline
kubectl wait --for=condition=available -n kubeflow deployment/ml-pipeline-ui
kubectl wait --for=condition=available -n kubeflow deployment/cache-server
kubectl wait --for=condition=available -n kubeflow deployment/cache-deployer-deployment
kubectl wait --for=condition=available -n kubeflow deployment/metadata-writer
kubectl wait --for=condition=available -n kubeflow deployment/metadata-envoy-deployment
      EOF
      # Basically wait indefinitely until the create resource times out
      retry = { attempts = 60, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    # This installation is huge
    create = "15m"
  }
}
