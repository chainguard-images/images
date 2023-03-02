<!--monopod:start-->
# cosign
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/cosign` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/cosign.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->
Minimalist Wolfi-based Cosign images for signing and verifying images using Sigstore.

- [Documentation](https://edu.chainguard.dev/chainguard/chainguard-images/reference/cosign)
- [Provenance Information](https://edu.chainguard.dev/chainguard/chainguard-images/reference/cosign/provenance_info/)
<!-- TODO: add Getting Started Guide - [Getting Started Guide](https://edu.chainguard.dev/chainguard/chainguard-images/reference/cosign/getting-started-cosign/) -->

## Image Variants

Our `latest` tag uses the most recent build of the [Wolfi Cosign](https://github.com/wolfi-dev/os/blob/main/cosign.yaml) package. The following tagged variant is available without authentication:

- `latest`: This is an image for running `cosign` commands. It does not include a shell or other applications.

Starting in April, accessing older tags will require authentication.

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

GitVersion:    2.0.0
GitCommit:     unknown
GitTreeState:  unknown
BuildDate:     unknown
GoVersion:     go1.20.1
Compiler:      gc
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
