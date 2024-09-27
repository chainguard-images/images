<!--monopod:start-->
# kubernetes-csi-external-snapshotter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubernetes-csi-external-snapshotter` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kubernetes-csi-external-snapshotter/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for kubernetes-csi-external-snapshotter

 Sidecar container that watches Kubernetes Snapshot CRD objects and triggers CreateSnapshot/DeleteSnapshot against a CSI endpoint.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/kubernetes-csi-external-snapshotter:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->

## Usage

This image collection is a drop-in replacement for the following images:

- `registry.k8s.io/sig-storage/csi-snapshotter`
- `registry.k8s.io/sig-storage/snapshot-controller`
- `registry.k8s.io/sig-storage/snapshot-validation-webhook`

### Snapshotter

To deploy the snapshotter, apply the manifests found in the upstream project [here](https://github.com/kubernetes-csi/external-snapshotter/tree/master/deploy/kubernetes/csi-snapshotter). You'll need to adjust the `image` to use `cgr.dev/chainguard/kubernetes-csi-external-snapshotter` instead. You can do this by extending the existing [kustomization file](https://github.com/kubernetes-csi/external-snapshotter/blob/master/deploy/kubernetes/csi-snapshotter/kustomization.yaml) as follows:

```yaml
# ...
images:
  - name: registry.k8s.io/sig-storage/csi-snapshotter
    newName: cgr.dev/chainguard/kubernetes-csi-external-snapshotter
    digest: <insert image digest>
```

### Snapshot Controller

To deploy the snapshotter, apply the manifests found in the upstream project [here](https://github.com/kubernetes-csi/external-snapshotter/tree/master/deploy/kubernetes/snapshot-controller). You'll need to adjust the `image` to use `cgr.dev/chainguard/kubernetes-csi-external-snapshot-controller` instead. You can do this by extending the existing [kustomization file](https://github.com/kubernetes-csi/external-snapshotter/blob/master/deploy/kubernetes/snapshot-controller/kustomization.yaml) as follows:

```yaml
# ...
images:
  - name: registry.k8s.io/sig-storage/snapshot-controller
    newName: cgr.dev/chainguard/kubernetes-csi-external-snapshot-controller
    digest: <insert image digest>
```

### Validation Webhook

To deploy the webhook, see the [documentation in the upstream project](https://github.com/kubernetes-csi/external-snapshotter/tree/master/deploy/kubernetes/webhook-example#how-to-deploy-the-webhook). You'll just need to replace the container spec's `image` value with `cgr.dev/chainguard/kubernetes-csi-external-snapshot-validation-webhook`.

You can verify that the webhook is working by following [these instructions](https://github.com/kubernetes-csi/external-snapshotter/tree/master/deploy/kubernetes/webhook-example#verify-the-webhook-works) to submit an invalid snapshot definition and see whether it gets rejected.

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