<!--monopod:start-->
# pytorch
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/pytorch` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/pytorch/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
A minimal, [wolfi](https://github.com/wolfi-dev)-based image for pytorch, a Python package that provides two high-level features: Tensor computation with strong GPU acceleration and Deep neural networks built on a tape-based autograd system.

<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/pytorch:latest
```
<!--getting:end-->

<!--body:start-->

## Running pytorch

Pytorch has some pre-requisites which need to be configured in the environment
prior to running. For examples, please refer to [TESTING.md](https://github.com/chainguard-images/images/blob/main/images/pytorch/TESTING.md).

Additionally, please refer to the [upstream documentation](https://github.com/pytorch/pytorch)
for more information on coniguring and using Pytorch.

Assuming the environment pre-requisite have been met, below demonstrates how
to launch the container:

```bash
docker run --rm -i -t \
    --privileged \
    --gpus all \
    cgr.dev/chainguard/pytorch:latest
```
<!--body:end-->
