<!--monopod:start-->
# nemo
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/nemo` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/nemo/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for nemo

NVIDIA NeMo Framework is an end-to-end, cloud-native framework to build, customize, and deploy generative AI models anywhere.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/nemo:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Running the Image

To run the NeMo Chainguard Image interactively in an environment with connected GPU:

``` bash 
docker run -it --rm \
  --gpus all \
  --shm-size=8g \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  cgr.dev/chainguard/nemo:latest
```

These options allow access to connected GPU, allocate more shared memory to the container, and put an upper bound on container memory use. If you are running the image in an environment without connected GPU, omit the `  --gpus all` option.

## Testing GPU Access

If your environment has connected GPUs, you can check that NeMo has access. First, run the NeMo Chainguard Image interactively with the above command. At the container prompt, run:

```bash
$ python
Python 3.11.9 (main, Apr  2 2024, 15:40:32) [GCC 13.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from nemo.core import pytorch_lightning
>>> len(pytorch_lightning.accelerators.find_usable_cuda_devices())
1
```

The above result shows that the environment has one connected GPU.

## Testing NeMo

You can run the below commands on your host machine to download and execute a script to test NeMo functionality. The script uses two pretrained models to generate audio output from plain text (text to speech). 

```bash
mkdir nemo-test && cd nemo-test
curl https://raw.githubusercontent.com/chainguard-dev/nemo-examples/main/tts.py > tts.py
docker run -it --rm \
  --gpus all \
  --user root \
  --shm-size=8g \
  --ulimit memlock=-1 \
 --ulimit stack=67108864 \
  -v $PWD:/home/nonroot/nemo-test \
  cgr.dev/chainguard/nemo:latest \
  -c "python /home/nonroot/nemo-test/tts.py"
```

After running the below, you should have a test.wav file in the current working directory on your host machine. The above example uses a root login in order to write the output to the volume. Remember not to use root or privileged access in a production scenario.

## Resources

For more information on using NVIDIA NeMo, see the following resources.

- [NeMo Overview](https://docs.nvidia.com/nemo-framework/user-guide/latest/index.html)
- [NeMo Tutorials](https://docs.nvidia.com/nemo-framework/user-guide/latest/nemotoolkit/starthere/tutorials.html)
- [NeMo Playbooks](https://docs.nvidia.com/nemo-framework/user-guide/latest/playbooks/index.html)
- [NeMo on GitHub](https://github.com/NVIDIA/NeMo)

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