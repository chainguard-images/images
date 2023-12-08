#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Ref: https://www.kubeflow.org/docs/components/pipelines/v1/installation/localcluster-deployment/#deploying-kubeflow-pipelines

NAMESPACE=kubeflow
PIPELINE_VERSION=2.0.4

function manifests() {
  cat <<EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - github.com/kubeflow/pipelines/manifests/kustomize/env/platform-agnostic-pns?ref=${PIPELINE_VERSION}
images:
  - name: gcr.io/ml-pipeline/api-server
    newName: ${IMAGE_REPOSITORY_APISERVER}
    newTag: ${IMAGE_REPOSITORY_APISERVER_TAG}
  - name: gcr.io/ml-pipeline/cache-deployer
    newName: ${IMAGE_REPOSITORY_CACHEDEPLOYER}
    newTag: ${IMAGE_REPOSITORY_CACHEDEPLOYER_TAG}
  - name: gcr.io/ml-pipeline/cache-server
    newName: ${IMAGE_REPOSITORY_CACHESERVER}
    newTag: ${IMAGE_REPOSITORY_CACHESERVER_TAG}
  - name: gcr.io/ml-pipeline/metadata-writer
    newName: ${IMAGE_REPOSITORY_METADATAWRITER}
    newTag: ${IMAGE_REPOSITORY_METADATAWRITER_TAG}
  - name: gcr.io/ml-pipeline/persistenceagent
    newName: ${IMAGE_REPOSITORY_PERSISTENCEAGENT}
    newTag: ${IMAGE_REPOSITORY_PERSISTENCEAGENT_TAG}
  - name: gcr.io/ml-pipeline/scheduledworkflow
    newName: ${IMAGE_REPOSITORY_SCHEDULEDWORKFLOW}
    newTag: ${IMAGE_REPOSITORY_SCHEDULEDWORKFLOW_TAG}
  - name: gcr.io/ml-pipeline/frontend
    newName: ${IMAGE_REPOSITORY_FRONTEND}
    newTag: ${IMAGE_REPOSITORY_FRONTEND_TAG}
  - name: gcr.io/ml-pipeline/metadata-envoy
    newName: ${IMAGE_REPOSITORY_METADATA_ENVOY}
    newTag: ${IMAGE_REPOSITORY_METADATA_ENVOY_TAG}
namespace: ${NAMESPACE}
EOF
}

kubectl apply -k "github.com/kubeflow/pipelines/manifests/kustomize/cluster-scoped-resources?ref=$PIPELINE_VERSION"
kubectl wait --for condition=established --timeout=60s crd/applications.app.k8s.io --namespace ${NAMESPACE}

manifests
kubectl apply -k .

kubectl rollout status -n ${NAMESPACE} deployment/ml-pipeline-persistenceagent
kubectl rollout status -n ${NAMESPACE} deployment/ml-pipeline-scheduledworkflow
kubectl rollout status -n ${NAMESPACE} deployment/ml-pipeline-viewer-crd
kubectl rollout status -n ${NAMESPACE} deployment/ml-pipeline
kubectl rollout status -n ${NAMESPACE} deployment/ml-pipeline-ui
kubectl rollout status -n ${NAMESPACE} deployment/cache-server
kubectl rollout status -n ${NAMESPACE} deployment/cache-deployer-deployment
kubectl rollout status -n ${NAMESPACE} deployment/metadata-writer
kubectl rollout status -n ${NAMESPACE} deployment/metadata-envoy-deployment

