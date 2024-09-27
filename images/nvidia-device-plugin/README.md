<!--monopod:start-->
# nvidia-device-plugin
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/nvidia-device-plugin` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/nvidia-device-plugin/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for nvidia-device-plugin

Minimal [nvidia-device-plugin](https://github.com/NVIDIA/k8s-device-plugin) container image.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/nvidia-device-plugin:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

Ensure your environment satisfies the [prerequisites](https://github.com/NVIDIA/k8s-device-plugin#prerequisites).

Jump to [Quick Start](https://github.com/NVIDIA/k8s-device-plugin#quick-start) to learn more.

To test:

```shell
$ docker run --rm cgr.dev/chainguard/nvidia-device-plugin --help

NAME:
   NVIDIA Device Plugin - NVIDIA device plugin for Kubernetes

USAGE:
   nvidia-device-plugin [global options] command [command options] [arguments...]

VERSION:
   v0.14.0
commit: e6c111aff19eab995e8d0f4345169e8c310d2f9c

COMMANDS:
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --mig-strategy value           the desired strategy for exposing MIG devices on GPUs that support it:
                                    [none | single | mixed] (default: "none") [$MIG_STRATEGY]
   --fail-on-init-error           fail the plugin if an error is encountered during initialization, otherwise block indefinitely (default: true) [$FAIL_ON_INIT_ERROR]
   --nvidia-driver-root value     the root path for the NVIDIA driver installation (typical values are '/' or '/run/nvidia/driver') (default: "/") [$NVIDIA_DRIVER_ROOT]
   --pass-device-specs            pass the list of DeviceSpecs to the kubelet on Allocate() (default: false) [$PASS_DEVICE_SPECS]
   --device-list-strategy value   the desired strategy for passing the device list to the underlying runtime:
                                    [envvar | volume-mounts | cdi-annotations] (default: "envvar")  (accepts multiple inputs) [$DEVICE_LIST_STRATEGY]
   --device-id-strategy value     the desired strategy for passing device IDs to the underlying runtime:
                                    [uuid | index] (default: "uuid") [$DEVICE_ID_STRATEGY]
   --gds-enabled                  ensure that containers are started with NVIDIA_GDS=enabled (default: false) [$GDS_ENABLED]
   --mofed-enabled                ensure that containers are started with NVIDIA_MOFED=enabled (default: false) [$MOFED_ENABLED]
   --config-file value            the path to a config file as an alternative to command line options or environment variables [$CONFIG_FILE]
   --cdi-annotation-prefix value  the prefix to use for CDI container annotation keys (default: "cdi.k8s.io/") [$CDI_ANNOTATION_PREFIX]
   --nvidia-ctk-path value        the path to use for the nvidia-ctk in the generated CDI specification (default: "/usr/bin/nvidia-ctk") [$NVIDIA_CTK_PATH]
   --container-driver-root value  the path where the NVIDIA driver root is mounted in the container; used for generating CDI specifications (default: "/driver-root") [$CONTAINER_DRIVER_ROOT]
   --help, -h                     show help (default: false)
   --version, -v                  print the version (default: false)
```

To use the Chainguard Images variant, override the values below in your `values.yaml` to use with [Helm](https://github.com/NVIDIA/k8s-device-plugin#deployment-via-helm):

```yaml
image:
  repository: cgr.dev/chainguard/nvidia-device-plugin
  tag: latest
```

When using this image with the `nvidia/gpu-operator` [helm chart](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/23.9.0/index.html) `bash` is required to run the mounted `/bin/entrypoint.sh` script.

For this you should use the `latest-dev` variant.

```
helm repo add nvidia https://helm.ngc.nvidia.com/nvidia
helm repo update

helm install --wait gpu  -n gpu-operator --create-namespace nvidia/gpu-operator
```
Values:
```yaml
driver:
   enabled: false
devicePlugin:
  repository: cgr.dev/chainguard
  image: nvidia-device-plugin
  tag: latest-dev
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