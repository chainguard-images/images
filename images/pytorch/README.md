<!--monopod:start-->
# pytorch
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/pytorch` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/pytorch/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

A minimal, [wolfi](https://github.com/wolfi-dev)-based image for pytorch, a Python package that provides two high-level features: Tensor computation with strong GPU acceleration and Deep neural networks built on a tape-based autograd system.


Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/REPO_NAME:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Chainguard’s PyTorch image is similar to the [pytorch/pytorch image](https://hub.docker.com/r/pytorch/pytorch), with several key differences:

* Chainguard images are using Wolfi Linux distribution, the `pytorch/pytorch` images are based on Ubuntu 22.04
* Chainguard images are running as `nonroot` user with home in `/home/nonroot` directory, while the `pytorch/pytorch` images are running as root user
* Chainguard images do not ship a full shell by default and it's entrypoint is Python, while `pytorch/pytorch` uses Bash as entrypoint
  (**NOTE**: Chainguard also provides a `-dev` images that have a full shell and entrypoint can be set to `/bin/sh` or `/bin/bash` for such images)

### Compatibility Package

If you're running an older version of CUDA not supported by the container, you have the option to install CUDA compatibility packages.

First, install the compatibility package for your specific host OS using the NVIDIA package repository. Make sure to install the package specific to your current version of CUDA.

Once the compatibility package has been installed, you can run the container in compatibility mode:

```sh
docker run --rm -it \
 -e LD_LIBRARY_PATH="/usr/local/cuda-12.4/compat" \
 cgr.dev/chainguard/pytorch
```

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

### Adjusting LD_LIBRARY_PATH

If `torch` is unable to access connected GPUs, you may need to adjust your
`LD_LIBRARY_PATH` environment variable before launching Python. CUDA libraries
injected into your runtime environment are often not found where Chainguard
images expect them.

For example, if you've got CUDA 12.8 libraries installed through non-Chainguard
packages:

```sh
LD_LIBRARY_PATH=/usr/local/cuda-12.8/lib64:/usr/local/nvidia/lib64:/usr/lib/x86_64-linux-gnu
```

Chainguard's libraries install to `/usr/lib`, so anything outside of that will
need to be added to the `LD_LIBRARY_PATH`.

## Testing PyTorch

As a quick intro, we will use PyTorch to create a very simple deep learning model with two linear layers and an activation function. We’ll create an instance of it and ask it to report on its parameters. Running the below will fetch a [model_builder.py](https://github.com/chainguard-dev/pytorch-getting-started/blob/main/model_builder.py) script from the Chainguard Images repository, place it in a folder on your host machine, and run the script in a pytorch container from a volume.

```bash
mkdir -p pytorch-test &&\
 curl https://raw.githubusercontent.com/chainguard-dev/pytorch-getting-started/refs/heads/main/model_builder.py > pytorch-test/model_builder.py &&\
 docker run --rm -it -v "$PWD/pytorch-test:/tmp/pytorch-test" cgr.dev/chainguard/pytorch:latest /tmp/pytorch-test/model_builder.py
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

## What are Chainguard Containers?

Chainguard's free tier of Starter container images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our minimal Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_.

All other Chainguard Containers are built with [Chainguard OS](https://edu.chainguard.dev/chainguard/chainguard-os/overview/?utm_source=readmes), Chainguard's minimal Linux operating system designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with [a *development*, or `-dev`, variant](https://edu.chainguard.dev/chainguard/chainguard-images/about/differences-development-production/).

In all other cases, including Chainguard Containers tagged as `:latest` or with a specific version number, the container images include only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager.

Although the `-dev` container image variants have similar security features as their more minimal versions, they include additional software that is typically not necessary in production environments. We recommend using multi-stage builds to copy artifacts from the `-dev` variant into a more minimal production image.

## Need additional packages?

To improve security, Chainguard Containers include only essential dependencies. Need more packages? Chainguard customers can use [Custom Assembly](https://edu.chainguard.dev/chainguard/chainguard-images/features/ca-docs/custom-assembly/) to add packages, either through the Console, `chainctl`, or API.

To use Custom Assembly in the Chainguard Console: navigate to the image you'd like to customize in [your Organization's list of images](https://console.chainguard.dev/images/organization), and click on the **Customize image** button at the top of the page.

## Learn More

Refer to our Chainguard Containers documentation on [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes). Chainguard also offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes) — [contact us](https://www.chainguard.dev/contact?utm_source=readmes) for access.
 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._