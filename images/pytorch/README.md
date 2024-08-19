<!--monopod:start-->
# pytorch
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/pytorch` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/pytorch/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

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

PyTorch has some prerequisites which need to be configured in the environment
prior to running with GPUs. For examples, please refer to [TESTING.md](https://github.com/chainguard-images/images/blob/main/images/pytorch/TESTING.md).

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

## Testing GPU Access

If your environment has connected GPUs, you can check that PyTorch has access with the following:

```bash
docker run --rm -it --gpus all cgr.dev/chainguard/pytorch:latest
Python 3.11.9 (main, Apr  2 2024, 15:40:32) [GCC 13.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import torch
>>> torch.cuda.is_available()
True
>>> torch.cuda.device_count()
1
>>> torch.cuda.get_device_name(0)
'Tesla V100-SXM2-16GB'
```

## Testing PyTorch

As a quick intro, we will use PyTorch to create a very simple deep learning model with two linear layers and an activation function. We’ll create an instance of it and ask it to report on its parameters. Running the below will fetch a [model_builder.py](https://github.com/chainguard-images/images/blob/main/images/pytorch/model_builder.py) script from the Chainguard Images repository, place it in a folder on your host machine, and run the script in a pytorch container from a volume.

```bash
mkdir pytorch-test &&\
 curl https://raw.githubusercontent.com/chainguard-images/images/main/images/pytorch/model_builder.py > pytorch-test/model_builder.py &&\
 docker run --rm -it -v "$PWD/pytorch-test:/tmp/pytorch-test" --gpus all cgr.dev/chainguard/pytorch:latest -c "python /tmp/pytorch-test/model_builder.py"
```

You may also consider running this [quickstart script](https://github.com/chainguard-images/images/blob/main/images/pytorch/tests/quickstart.py) based on the [official PyTorch quickstart tutorial](https://pytorch.org/tutorials/beginner/basics/quickstart_tutorial.html) using the same approach as above.

### Using Helm charts

As a place to get started, you may also use this Helm chart to get PyTorch running
```bash
  helm install pytorch \
  --namespace pytorch-space --create-namespace  \
  --set image.registry="cgr.dev" \
  --set image.repository="chainguard/pytorch" \
  --set image.tag=latest \
  --set containerSecurityContext.runAsUser=0 \
  --set containerSecurityContext.runAsNonRoot=false \
  --set containerSecurityContext.allowPrivilegeEscalation=true \
  --wait oci://registry-1.docker.io/bitnamicharts/pytorch
```
<!--body:end-->
