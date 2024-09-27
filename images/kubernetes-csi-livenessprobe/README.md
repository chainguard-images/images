<!--monopod:start-->
# kubernetes-csi-livenessprobe
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubernetes-csi-livenessprobe` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kubernetes-csi-livenessprobe/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for kubernetes-csi-livenessprobe

 A sidecar container that can be included in a CSI plugin pod to enable integration with Kubernetes Liveness Probe.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/kubernetes-csi-livenessprobe:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Run it

Generally speaking, the `kubernetes-csi-livenessprobe` is a low level Kubernetes component not meant to be managed directly. However, all the steps outlined in the [upstream repo](https://github.com/kubernetes-csi/livenessprobe) apply just as well to the Chainguard Image version.

## Test it

A simple smoke test is provided below that leverages `docker` to spin up the liveness probe attached to a csi driver and ensure basic functionality is met:

```bash
#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
	echo "Must set IMAGE_NAME environment variable. Exiting."
	exit 1
fi

UDS="/csi/csi.sock"
CSI_ENDPOINT="unix:/$UDS"

# Start hostpathplugin in the background
docker run -d --name csi-driver -v $(pwd)/csi:/csi quay.io/k8scsi/hostpathplugin:v1.6.0 --endpoint=$CSI_ENDPOINT -nodeid 1 --v=5
trap "docker rm -f csi-driver" EXIT

docker run -d --name probe -p 9808:9808 -v $(pwd)/csi:/csi "$IMAGE_NAME" --v=5 --csi-address=$UDS
trap "docker rm -f probe" EXIT

# Give time to CSI hostpathplugin and livenessprobe to initialize
sleep 3

# Requesting health
health=$(curl -I http://localhost:9808/healthz | grep HTTP | awk '{print $2}')
if [[ "x$health" != "x200" ]]; then
	echo "Health check failed, but it was not supposed to, exiting..."
	exit 1
fi

# Killing hostpathplugin
docker stop csi-driver
sleep 3

# Requesting health, should fail since hostpathplugin is gone
health=$(curl -I http://localhost:9808/healthz | grep HTTP | awk '{print $2}')
if [[ "x$health" != "x500" ]]; then
	echo "Health check did not detect driver failure, returned code: $health, exiting..."
	exit 1
fi

exit 0
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