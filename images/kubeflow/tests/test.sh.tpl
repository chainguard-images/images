#!/bin/sh

apk add kustomize

mkdir -p kubeflow/jupyter
cat <<EOk >kubeflow/jupyter/kustomization.yaml
resources:
  - https://github.com/kubeflow/kubeflow/components/crud-web-apps/jupyter/manifests/base?ref=master
images:
  - name: docker.io/kubeflownotebookswg/jupyter
    newName: ${jupyter_registry_repo}
    newTag: ${jupyter_tag}
EOk

mkdir -p kubeflow/volumes
cat <<EOk >kubeflow/volumes/kustomization.yaml
resources:
  - https://github.com/kubeflow/kubeflow/components/crud-web-apps/volumes/manifests/base?ref=master
images:
  - name: docker.io/kubeflownotebookswg/jupyter
    newName: ${volumes_registry_repo}
    newTag: ${volumes_tag}
EOk


cat <<EOk > kubeflow/kustomization.yaml
namespace: kubeflow
resources:
  - ./jupyter
  - ./volumes
EOk

kubectl create namespace kubeflow
kustomize build kubeflow | kubectl apply -f -
