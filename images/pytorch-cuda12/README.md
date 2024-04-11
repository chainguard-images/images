<!--monopod:start-->
# pytorch-cuda12
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/pytorch-cuda12` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/pytorch-cuda12/overview/)
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
docker pull cgr.dev/chainguard/pytorch-cuda12:latest
```
<!--getting:end-->

<!--body:start-->

## Running pytorch-cuda12

PyTorch has some prerequisites which need to be configured in the environment
prior to running with GPUs. For examples, please refer to [TESTING.md](https://github.com/chainguard-images/images/blob/main/images/pytorch-cuda12/TESTING.md).

Additionally, please refer to the [upstream documentation](https://github.com/pytorch/pytorch)
for more information on configuring and using PyTorch.

Assuming the environment prerequisites have been met, below demonstrates how
to launch the container:

```bash
docker run --rm -i -t \
    --privileged \
    --gpus all \
    cgr.dev/chainguard/pytorch:latest
```

If your environment has access to GPUs, you may provide PyTorch access to it by running 
```bash
docker run --rm -it --gpus all cgr.dev/chainguard/pytorch-cuda12:latest
bash-5.2$ python
Python 3.11.8 (main, Feb  7 2024, 00:46:15) [GCC 13.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import torch
>>> print(torch.cuda.is_available())
True
```
As a quick intro, we will use PyTorch to create a very simple deep learning model with two linear layers and an activation function. We’ll create an instance of it and ask it to report on its parameters. The script can be found in ```model_builder.py``` in this directory.

To run this script, 
```bash

docker run --rm -it -v /home/srishihegde/quick.py:/tmp/model_builder.py --gpus all cgr.dev/chainguard/pytorch-cuda12:latest -c "python /tmp/model_builder.py"
```
A quickstart tutorial as outlined [here](https://pytorch.org/tutorials/beginner/basics/quickstart_tutorial.html) can also be run using the tests/quickstart.py script similar to the above run 

### Using Helm charts

As a place to get started, you may also use this Helm chart to get PyTorch running
```bash
  helm install pytorch \
  --namespace pytorch-space --create-namespace  \
  --set image.registry="cgr.dev" \
  --set image.repository="chainguard/pytorch-cuda12" \
  --set image.tag=latest \
  --set containerSecurityContext.runAsUser=0 \
  --set containerSecurityContext.runAsNonRoot=false \
  --set containerSecurityContext.allowPrivilegeEscalation=true \
  --wait oci://registry-1.docker.io/bitnamicharts/pytorch
```
<!--body:end-->
