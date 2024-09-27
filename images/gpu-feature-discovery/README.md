<!--monopod:start-->
# gpu-feature-discovery
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gpu-feature-discovery` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/gpu-feature-discovery/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for gpu-feature-discovery

Minimal [gpu-feature-discovery](https://github.com/NVIDIA/gpu-feature-discovery) container image.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/gpu-feature-discovery:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

NVIDIA GPU Feature Discovery for Kubernetes is a software component that allows you to automatically generate labels for the set of GPUs available on a node
For more information, refer to the GFD documentation:
- [GFD Github README](https://github.com/NVIDIA/gpu-feature-discovery/blob/main/README.md#installing-via-helm-install)

```shell
NAME:
   GPU Feature Discovery - generate labels for NVIDIA devices

USAGE:
   GPU Feature Discovery [global options] command [command options] [arguments...]

VERSION:
   0.8.2
commit: 47a1ea6862f69844c5364c98a77aa97fe9ea7b74

COMMANDS:
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --mig-strategy value                           the desired strategy for exposing MIG devices on GPUs that support it:
                                                    [none | single | mixed] (default: "none") [$GFD_MIG_STRATEGY, $MIG_STRATEGY]
   --fail-on-init-error                           fail the plugin if an error is encountered during initialization, otherwise block indefinitely (default: true) [$GFD_FAIL_ON_INIT_ERROR, $FAIL_ON_INIT_ERROR]
   --oneshot                                      Label once and exit (default: false) [$GFD_ONESHOT]
   --no-timestamp                                 Do not add the timestamp to the labels (default: false) [$GFD_NO_TIMESTAMP]
   --sleep-interval value                         Time to sleep between labeling (default: 1m0s) [$GFD_SLEEP_INTERVAL]
   --output-file value, --output value, -o value  (default: "/etc/kubernetes/node-feature-discovery/features.d/gfd") [$GFD_OUTPUT_FILE]
   --machine-type-file value                      a path to a file that contains the DMI (SMBIOS) information for the node (default: "/sys/class/dmi/id/product_name") [$GFD_MACHINE_TYPE_FILE]
   --config-file value                            the path to a config file as an alternative to command line options or environment variables [$GFD_CONFIG_FILE, $CONFIG_FILE]
   --use-node-feature-api                         Use NFD NodeFeature API to publish labels (default: false) [$GFD_USE_NODE_FEATURE_API]
   --help, -h                                     show help
   --version, -v                                  print the version
```

Helm Installation for GPU Feature Discovery

Step 1: Add and Update Helm Repository
Add the NVIDIA GFD Helm repository and update it to ensure you have access to the latest charts.

```shell
$ helm repo add nvgfd https://nvidia.github.io/gpu-feature-discovery
$ helm repo update
```

Step 2: Install GPU Feature Discovery
Install GPU Feature Discovery using Helm with the specified version, namespace, and optional configuration settings.

This command deploys GPU Feature Discovery as a standalone chart in the gpu-feature-discovery namespace.
```shell
$ helm upgrade -i nvgfd nvgfd/gpu-feature-discovery \
  --version 0.8.2 \
  --namespace gpu-feature-discovery \
  --create-namespace
```

Step 3: Verify Installation
Verify that the GPU Feature Discovery DaemonSet is running in the specified namespace.

```shell
$ kubectl get daemonset -n gpu-feature-discovery -l app.kubernetes.io/name=gpu-feature-discovery
```
For more information, refer to the documentation:
- [Helm Installation Guide](https://github.com/NVIDIA/gpu-feature-discovery/blob/main/README.md#installing-via-helm-install)
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