<!--monopod:start-->
# images/doppler-kubernetes-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/images/doppler-kubernetes-operator` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/images/doppler-kubernetes-operator/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Automatically sync secrets from Doppler to Kubernetes and auto-reload deployments when secrets change.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/images/doppler-kubernetes-operator:latest
```
<!--getting:end-->

<!--body:start-->
doppler-kubernetes-operator is a Kubernetes operator, which can be deployed using helm. Refer to the [upstream repositories documentation](https://github.com/DopplerHQ/kubernetes-operator) for how to get started with doppler-kubernetes-operator.

```shell
helm repo add doppler https://helm.doppler.com
helm install doppler-kubernetes-operator doppler/doppler-kubernetes-operator

helm repo update
helm pull doppler/doppler-kubernetes-operator --untar
kubectl apply -f doppler-kubernetes-operator/crds/all.yaml

helm upgrade doppler-kubernetes-operator doppler/doppler-kubernetes-operator \
   --set image.repository=cgr.dev/chainguard/doppler-kubernetes-operator \
   --set image.tag=latest
}
```

As per [project documentation](https://github.com/DopplerHQ/kubernetes-operator/blob/main/README.md).
<!--body:end-->
