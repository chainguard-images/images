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
A minimal, [wolfi](https://github.com/wolfi-dev)-based image for pytorch, a Python package that provides two high-level features: Tensor computation (like NumPy) with strong GPU acceleration and Deep neural networks built on a tape-based autograd system.

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

Please refer TESTING.md for instructions on how to configure and test pytorch. 
The below examples are intended as demonstrating how to substitute with the chainguard image, and
are not comprehensive.

### Docker

```bash
docker run --rm -i -t \
    --privileged \
    --gpus all \
    cgr.dev/chainguard/pytorch:latest
```
<!--body:end-->
