<!--monopod:start-->
# nvidia-container-toolkit
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/nvidia-container-toolkit` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/nvidia-container-toolkit/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
The NVIDIA Container Toolkit allows users to build and run GPU accelerated containers.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nvidia-container-toolkit:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

```sh
helm repo add nvidia https://helm.ngc.nvidia.com/nvidia
helm upgrade --install gpu-operator nvidia/gpu-operator \
    -n gpu-operator \
    --create-namespace \
    --set toolkit.repository=cgr.dev/chainguard \
    --set toolkit.image=nvidia-container-toolkit \
    --set toolkit.version=latest
```

* Refer to [values.yaml](https://github.com/NVIDIA/gpu-operator/blob/master/deployments/gpu-operator/values.yaml) file for more configuration options.

> [!WARNING]
> You'll want to make sure the `gpu-operator` chart is up-to-date and use the latest operator tag that's within the compatibility matrix.

> [!IMPORTANT]
> You need GPU nodes to run the operator as it will schedule Deployments and DaemonSets on nodes with GPUs.

> [!NOTE]
> If you want to learn more about how we are testing this image, please refer to the [TESTING.md](https://github.com/chainguard-images/images/blob/main/images/nvidia-container-toolkit/TESTING.md) file.

<!--body:end-->
