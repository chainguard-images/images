<!--monopod:start-->
# pytorch-cuda12
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/pytorch-cuda12` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/pytorch-cuda12/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for pytorch-cuda12

A minimal, [wolfi](https://github.com/wolfi-dev)-based image for pytorch, a Python package that provides two high-level features: Tensor computation with strong GPU acceleration and Deep neural networks built on a tape-based autograd system.


Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/pytorch-cuda12:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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

## Testing GPU Access

If your environment has connected GPUs, you can check that PyTorch has access with the following:

```bash
docker run --rm -it --gpus all cgr.dev/chainguard/pytorch-cuda12:latest
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

As a quick intro, we will use PyTorch to create a very simple deep learning model with two linear layers and an activation function. We’ll create an instance of it and ask it to report on its parameters. Running the below will fetch a [model_builder.py](https://github.com/chainguard-images/images/blob/main/images/pytorch-cuda12/model_builder.py) script from the Chainguard Images repository, place it in a folder on your host machine, and run the script in a pytorch-cuda12 container from a volume.

```bash
mkdir pytorch-test &&\
 curl https://raw.githubusercontent.com/chainguard-images/images/main/images/pytorch-cuda12/model_builder.py > pytorch-test/model_builder.py &&\
 docker run --rm -it -v "$PWD/pytorch-test:/tmp/pytorch-test" --gpus all cgr.dev/chainguard/pytorch-cuda12:latest -c "python /tmp/pytorch-test/model_builder.py"
```

You may also consider running this [quickstart script](https://github.com/chainguard-images/images/blob/main/images/pytorch-cuda12/tests/quickstart.py) based on the [official PyTorch quickstart tutorial](https://pytorch.org/tutorials/beginner/basics/quickstart_tutorial.html) using the same approach as above.

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

## Contact Support

If you have a Zendesk account (typically set up for you by your Customer Success Manager) you can reach out to Chainguard's Customer Success team through our [Zendesk portal](https://support.chainguard.dev/hc/en-us).

## What are Chainguard Images?

[Chainguard Images](https://www.chainguard.dev/chainguard-images?utm_source=readmes) are a collection of container images designed for security and minimalism.

Many Chainguard Images are [distroless](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started-distroless/); they contain only an open-source application and its runtime dependencies. These images do not even contain a shell or package manager. Chainguard Images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview), our Linux _undistro_ designed to produce container images that meet the requirements of a secure software supply chain.

The main features of Chainguard Images include:

* Minimal design, with no unnecessary software bloat
* Automated nightly builds to ensure Images are completely up-to-date and contain all available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) (software bills of materials) attesting the provenance of all artifacts within the Image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds))

### `-dev` Variants

As mentioned previously, Chainguard’s distroless Images have no shell or package manager by default. This is great for security, but sometimes you need these things, especially in builder images. For those cases, most (but not all) Chainguard Images come paired with a `-dev` variant which does include a shell and package manager.

Although the `-dev` image variants have similar security features as their distroless versions, such as complete SBOMs and signatures, they feature additional software that is typically not necessary in production environments. The general recommendation is to use the `-dev` variants only to build the application and then copy all application artifacts into a distroless image, which will result in a final container image that has a minimal attack surface and won’t allow package installations or logins.

That being said, it’s worth noting that `-dev` variants of Chainguard Images are completely fine to run in production environments. After all, the `-dev` variants are still **more secure** than many popular container images based on fully-featured operating systems such as Debian and Ubuntu since they carry less software, follow a more frequent patch cadence, and offer attestations for what they include.

## Learn More

To better understand how to work with Chainguard Images, we encourage you to visit [Chainguard Academy](https://edu.chainguard.dev/), our documentation and education platform.