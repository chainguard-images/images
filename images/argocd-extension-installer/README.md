<!--monopod:start-->
# argocd-extension-installer
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/argocd-extension-installer` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/argocd-extension-installer/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for argocd-extension-installer

Install Argo CD extensions using init-containers

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/argocd-extension-installer:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->

## Usage

To get more detail about how to use this installer, please refer to the [Install UI Extensions](https://github.com/argoproj-labs/argocd-extension-metrics#install-ui-extension).


The yaml file below is an example of how to define a kustomize patch to install this UI extension:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: argocd-server
spec:
  template:
    spec:
      initContainers:
        - name: extension-metrics
          image: cgr.dev/chainguard/argocd-extension-installer:latest
          env:
          - name: EXTENSION_URL
            value: https://github.com/argoproj-labs/argocd-extension-metrics/releases/download/v1.0.0/extension.tar.gz
          - name: EXTENSION_CHECKSUM_URL
            value: https://github.com/argoproj-labs/argocd-extension-metrics/releases/download/v1.0.0/extension_checksums.txt
          volumeMounts:
            - name: extensions
              mountPath: /tmp/extensions/
          securityContext:
            runAsUser: 1000
            allowPrivilegeEscalation: false
      containers:
        - name: argocd-server
          volumeMounts:
            - name: extensions
              mountPath: /tmp/extensions/
      volumes:
        - name: extensions
          emptyDir: {}

```

or you can use the following settings while installing the ArgoCD server through Helm:

```yaml
...
  ## Argo CD extensions
  ## This function in tech preview stage, do expect instability or breaking changes in newer versions.
  ## Ref: https://github.com/argoproj-labs/argocd-extension-installer
  ## When you enable extensions, you need to configure RBAC of logged in Argo CD user.
  ## Ref: https://argo-cd.readthedocs.io/en/stable/operator-manual/rbac/#the-extensions-resource
  extensions:
    # -- Enable support for Argo CD extensions
    enabled: false

    ## Argo CD extension installer image
    image:
      # -- Repository to use for extension installer image
      repository: "quay.io/argoprojlabs/argocd-extension-installer"
      # -- Tag to use for extension installer image
      tag: "v0.0.1"
      # -- Image pull policy for extensions
      # @default -- `""` (defaults to global.image.imagePullPolicy)
      imagePullPolicy: ""

    # -- Extensions for Argo CD
    # @default -- `[]` (See [values.yaml])
    ## Ref: https://github.com/argoproj-labs/argocd-extension-metrics#install-ui-extension
    extensionList: []
    #  - name: extension-metrics
    #    env:
    #      - name: EXTENSION_URL
    #        value: https://github.com/argoproj-labs/argocd-extension-metrics/releases/download/v1.0.0/extension.tar.gz
    #      - name: EXTENSION_CHECKSUM_URL
    #     
...
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