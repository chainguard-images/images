<!--monopod:start-->
# cosign
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cosign` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/cosign/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for cosign

Minimalist Wolfi-based Cosign images for signing and verifying images using Sigstore.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/cosign:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->



## Image Variants

Our `latest` tag uses the most recent build of the [Wolfi Cosign](https://github.com/wolfi-dev/os/blob/main/cosign.yaml) package. The following tagged variant is available without authentication:

- `latest`: This is an image for running `cosign` commands. It does not include a shell or other applications.

### Cosign Version
This will automatically pull the image to your local system and execute the command `cosign version`:

```shell
docker run --rm cgr.dev/chainguard/cosign version
```

You should see output similar to this:

```
  ______   ______        _______. __    _______ .__   __.
 /      | /  __  \      /       ||  |  /  _____||  \ |  |
|  ,----'|  |  |  |    |   (----`|  | |  |  __  |   \|  |
|  |     |  |  |  |     \   \    |  | |  | |_ | |  . `  |
|  `----.|  `--'  | .----)   |   |  | |  |__| | |  |\   |
 \______| \______/  |_______/    |__|  \______| |__| \__|
cosign: A tool for Container Signing, Verification and Storage in an OCI registry.

...
Platform:      linux/arm64
```



## Usage

### Signing a container image

For example, from GitHub Actions:


```yaml
on:
  push:
env:
  IMAGE: ghcr.io/${{ github.repository }}
  DOCKER_CONFIG: .docker-tmp
jobs:
  push-and-sign:
    runs-on: ubuntu-latest
    permissions:
      id-token: write
      packages: write
    steps:
      - name: Login to registry
        run: |
          set -x
          mkdir -p "${DOCKER_CONFIG}"
          echo '{}' > "${DOCKER_CONFIG}/config.json"
          echo "${{ github.token }}" | docker login \
            -u "${{ github.repository_owner }}" \
            --password-stdin ghcr.io
      - name: Push image with docker
        run: |
          set -x
          docker pull alpine:latest
          docker tag alpine:latest "${IMAGE}"
          docker push "${IMAGE}"
      - name: Sign image with cosign
        run: |
          set -x
          env | grep -v ^HOME= > github-actions.txt
          docker run --rm --env-file=./github-actions.txt \
            -v "${PWD}/${DOCKER_CONFIG}:/tmp/${DOCKER_CONFIG}" \
            -e DOCKER_CONFIG="/tmp/${DOCKER_CONFIG}" \
            cgr.dev/chainguard/cosign \
            sign "${IMAGE}" \
              --yes \
              -a sha=${{ github.sha }} \
              -a run_id=${{ github.run_id }} \
              -a run_attempt=${{ github.run_attempt }}

```

### Verifying a container image signature

To verify an image signature, use the image to run Cosign's `verify` command. Since as of Cosign 2.0, Cosign defaults to using Sigstore's keyless mode, you'll need to also specify the OIDC issuer and signer identity to tell Cosign who you trust for the verification process.

For convenience, you can export those values as environment variables in your shell, and then tell Docker to pass those environment variables into the running Cosign container.

For example, to use the Cosign image to verify the signature of the Cosign image itself:

```shell
export COSIGN_CERTIFICATE_OIDC_ISSUER=https://token.actions.githubusercontent.com
export COSIGN_CERTIFICATE_IDENTITY=https://github.com/chainguard-images/images/.github/workflows/release.yaml@refs/heads/main

docker run --rm \
  -e COSIGN_CERTIFICATE_OIDC_ISSUER \
  -e COSIGN_CERTIFICATE_IDENTITY \
  cgr.dev/chainguard/cosign \
  verify cgr.dev/chainguard/cosign
```

## Detailed Environment Information

To obtain detailed information about the environment, you can run the `cosign env` command:

```shell
docker run --rm cgr.dev/chainguard/cosign env --show-descriptions=false
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