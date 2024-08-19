<!--monopod:start-->
# wave
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/wave` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/wave/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Wave watches Deployments within a Kubernetes cluster and ensures that each Deployment's Pods always have up to date configuration.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wave:latest
```
<!--getting:end-->

<!--body:start-->
## Compatibility Warning

Starting from versions [v0.6.0](https://github.com/wave-k8s/wave/releases/tag/v0.6.0), [wave](https://github.com/wave-k8s/wave) project add [supports](https://github.com/wave-k8s/wave/pull/145) for `go1.22` with Kubernetes `v1.29`.

If you are using older versions of Kubernetes, please note that the latest version of wave may or may not be compatible with your Kubernetes version.

If you notice any behavioral changes or issues between your version of wave vs the latest Chainguard image, please [file an issue](https://github.com/wave-k8s/wave/issues/new) on the upstream repository.

## Usage

You can deploy the wave with the Helm:

```shell
helm repo add wave-k8s https://wave-k8s.github.io/wave/
helm update
helm install wave wave-k8s/wave \
  --namespace wave \
	--create-namespace \
	--set image.repository="cgr.dev/chainguard/wave" \
	--set image.tag="latest" \
```

Find more on the [Helm Chart values](https://github.com/wave-k8s/wave/tree/master/charts/wave)!

Please follow upstream [documentation](https://wave-k8s.github.io/wave) for usage and configuration.

<!--body:end-->
