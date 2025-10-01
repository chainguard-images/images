<!--monopod:start-->
# cosign
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cosign` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/cosign/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

Minimalist Wolfi-based Cosign images for signing and verifying images using Sigstore.

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
Like most other Chainguard Images, the Cosign image has few-to-zero CVEs and does not run as the root user.

## Getting Started
You can use the Cosign image to sign and verify container images via Docker or through automated workflows such as GitHub Actions.

### Verifying a container image signature
To verify an image signature, use the image to run Cosign's `verify` command. As of Cosign 2.0, Cosign defaults to using Sigstore's keyless mode, you'll need to also specify the OIDC issuer and signer identity to tell Cosign who you trust for the verification process.

For convenience, you can export those values as environment variables in your shell, and then tell Docker to pass those environment variables into the running Cosign container:

```shell
export COSIGN_CERTIFICATE_OIDC_ISSUER=https://token.actions.githubusercontent.com
export COSIGN_CERTIFICATE_IDENTITY=https://github.com/chainguard-images/images/.github/workflows/release.yaml@refs/heads/main
```

The following example uses the Cosign image to verify the signature of the Cosign image itself:

```
docker run --rm \
  -e COSIGN_CERTIFICATE_OIDC_ISSUER \
  -e COSIGN_CERTIFICATE_IDENTITY \
  cgr.dev/chainguard/cosign \
  verify cgr.dev/chainguard/cosign
```

### Signing a container image

The following GitHub Action will log into the registry, push an image, and then sign it with Cosign:


```yaml
on:
  workflow_dispatch:

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
      - name: Log in to registry
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
          docker pull cgr.dev/chainguard/wolfi-base
          docker tag cgr.dev/chainguard/wolfi-base "${IMAGE}"
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

### Attesting to an image's SBOM

Another common use case for Cosign is attesting to an image's SBOM (software bill of materials). The following command creates an attestation of type `spdxjson` for an image based on the provided SBOM file and image digest:

```shell
docker run --rm cgr.dev/chainguard/cosign attest --type spdxjson \
 --predicate example-image.spdx.json \
 sha256:7f95c5aa7e789ad51737e03021586949346f38ced1533ecdcb2ef2b9104137ac

```

A detailed guide on how to sign an SBOM with Cosign is available on [Chainguard Academy](https://edu.chainguard.dev/open-source/sigstore/cosign/how-to-sign-an-sbom-with-cosign/).


### Verifying an Attestation

Cosign can also be used to verify the identity of the person or entity issuing an attestation. To verify that an attestation was issued by a specific entity, we use the `cosign verify-attestation` command, specifying the email address of the issuer:

```shell
cosign verify-attestation \
 --certificate-oidc-issuer=https://github.com/login/oauth \
 --type https://spdx.dev/Document \
 --certificate-identity=emailaddress@emailprovider.com \
 sha256:7f95c5aa7e789ad51737e03021586949346f38ced1533ecdcb2ef2b9104137ac
```

If the identity is successfully verified, an initial message similar to the following is printed to stderr:

```shell
Verification for user/example-image@sha256:545a731e803b917daf44e292b03b427427f8090c4e6c4a704e4c18d56c38539f --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - The code-signing certificate was verified using trusted certificate authority certificates
Certificate subject: <you@domain.com>
Certificate issuer URL: https://github.com/login/oauth
```

## Configuration

The following environment variables are required when verifying a container image signature:

- `COSIGN_CERTIFICATE_OIDC_ISSUER`: Trusted OIDC issuer, example: `https://token.actions.githubusercontent.com`
- `COSIGN_CERTIFICATE_IDENTITY`: Trusted certificate identity, example: `https://github.com/chainguard-images/images/.github/workflows/release.yaml@refs/heads/main`

### Detailed Environment Information

To obtain detailed information about the environment, you can run the `cosign env` command:

```shell
docker run --rm cgr.dev/chainguard/cosign env --show-descriptions=false
```

You'll get output similar to this, containing the environment variables used to configure Cosign:

```shell
ACTIONS_ID_TOKEN_REQUEST_TOKEN=
ACTIONS_ID_TOKEN_REQUEST_URL=
BUILDKITE_AGENT_ACCESS_TOKEN=
BUILDKITE_AGENT_ENDPOINT=
BUILDKITE_AGENT_LOG_LEVEL=
BUILDKITE_JOB_ID=
COSIGN_DOCKER_MEDIA_TYPES=
COSIGN_EXPERIMENTAL=
COSIGN_MAX_ATTACHMENT_SIZE=
COSIGN_PASSWORD=
COSIGN_PKCS11_IGNORE_CERTIFICATE=
COSIGN_PKCS11_MODULE_PATH=
COSIGN_PKCS11_PIN=
COSIGN_REPOSITORY=
GITHUB_HOST=
GITHUB_TOKEN=
GITLAB_HOST=
GITLAB_TOKEN=
GOOGLE_SERVICE_ACCOUNT_NAME=
SIGSTORE_CT_LOG_PUBLIC_KEY_FILE=
SIGSTORE_ID_TOKEN=
SIGSTORE_REKOR_PUBLIC_KEY=
SIGSTORE_ROOT_FILE=
SIGSTORE_TSA_CERTIFICATE_FILE=
SOURCE_DATE_EPOCH=
SPIFFE_ENDPOINT_SOCKET=
COSIGN_CERTIFICATE_OIDC_ISSUER=******
COSIGN_CERTIFICATE_IDENTITY=******
```

## Documentation and Resources

- [Chainguard Academy: An Introduction to Cosign](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/)
- [Blog Post: Chainguard announces new Sigstore Images to bring critical software supply chain tooling to enterprises](https://www.chainguard.dev/unchained/chainguard-announces-new-sigstore-images-to-bring-critical-software-supply-chain-tooling-to-enterprises)
 - [Chainguard Academy: How to Sign an SBOM with Cosign](https://edu.chainguard.dev/open-source/sigstore/cosign/how-to-sign-an-sbom-with-cosign/)
- [Chainguard Academy: Verifying Chainguard Images and Metadata Signatures with Cosign](https://edu.chainguard.dev/chainguard/chainguard-images/verifying-chainguard-images-and-metadata-signatures-with-cosign/)

- [Video: Signing and Verifying Container Images With Sigstore Cosign and Kyverno ](https://www.youtube.com/watch?v=HLb1Q086u6M)

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