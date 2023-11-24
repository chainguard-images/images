<!--monopod:start-->
# kubeflow
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubeflow` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kubeflow/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Kubeflow Machine Learning Toolkit for Kubernetes Images
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubeflow:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

There are kustomize files exist for deploying this image to a Kubernetes cluster in kubeflow official GitHub [repository](github.com/kubeflow/kubeflow/).

All you need to do is issuing the following commands:

* For [jupyter-web-app](https://github.com/kubeflow/kubeflow/tree/master/components/crud-web-apps/jupyter/manifests)

```shell
$ cat <<EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - https://github.com/kubeflow/kubeflow/components/crud-web-apps/jupyter/manifests/overlays/istio?ref=master
images:
  - name: docker.io/kubeflownotebookswg/kubeflow-jupyter-web-app
    newName: cgr.dev/chainguard/kubeflow-jupyter-web-app
    newTag: latest
namespace: jupyter-web-app
EOF
```

* For [volumes-web-app](https://github.com/kubeflow/kubeflow/tree/master/components/crud-web-apps/volumes/manifests)

```shell
$ cat <<EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - https://github.com/kubeflow/kubeflow/components/crud-web-apps/volumes/manifests/overlays/istio?ref=master
images:
  - name: docker.io/kubeflownotebookswg/kubeflow-volumes-web-app
    newName: cgr.dev/chainguard/kubeflow-volumes-web-app
    newTag: latest
namespace: volumes-web-app
EOF
```

Finally, apply the kustomize files:

```shell
$ kubectl apply -k .
```
<!--body:end-->
