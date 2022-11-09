# sdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/sdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/sdk/actions/workflows/release.yaml)

Development image for [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/sdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:b9a5b44417a1278a80e979214770921541a1c158203d76b508bdb5ef6e2a0a8d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b9a5b44417a1278a80e979214770921541a1c158203d76b508bdb5ef6e2a0a8d) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:ca62f8fe2643a33fde3c94d24542c60741470089483d8f31cd42b34c8a5ffad1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ca62f8fe2643a33fde3c94d24542c60741470089483d8f31cd42b34c8a5ffad1) |  |


## Usage

### With melange

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/melange.git
cd melange
```

Run the image, mounting the repo workspace (`--privileged` flag required):

```
docker run --privileged --rm -it -v "${PWD}:${PWD}" -w "${PWD}" cgr.dev/chainguard/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the development environment!


[sdk] ❯
```

Inside the environment, test out local changes to the melange codebase
by running the following:

```
make melange install
```

Then run melange commands as normal:

```
melange keygen

melange build \
  --arch x86_64,arm64 \
  --empty-workspace \
  --repository-append packages \
  --signing-key melange.rsa \
  examples/gnu-hello.yaml
```

### With apko

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/apko.git
cd apko
```

Run the image, mounting the repo workspace:

```
docker run --rm -it -v "${PWD}:${PWD}" -w "${PWD}" cgr.dev/chainguard/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the development environment!


[sdk] ❯
```

Inside the environment, test out local changes to the apko codebase
by running the following:

```
make apko install
```

Then run apko commands as normal:

```
apko build --debug \
  examples/alpine-base.yaml \
  alpine-base:latest output.tar
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/sdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/sdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/sdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:b9a5b44417a1278a80e979214770921541a1c158203d76b508bdb5ef6e2a0a8d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "bc3274c385ce710b818ee58b0de2f1e53da9ab04",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCLzRf/Uh3SQ/qCHR6p7APTM12J1X4fZYbbi4a5KEoxlgIgGpflxm0k52k1n5X91QYlVI/GTGQa6nLDSAMG4EArE7o=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkNTE2OGIxYzg4NjRhMTk2YWQ0ZjI5MGE1ZjU3NTU0OTMzODIzMGI3OTFiMzg1MzEyMjIwMzI0ODJhMGE3OTgxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNYVndSYk1wUmQvRVhEN3hHODNPVFpYVm05N3Q1eUVLZXgwWFBlRkI3bDd3SWdNak9Uc2tnWnVkZ255alJFTFNOalh6aFAxOXZtUEhhMDVaeGZCMkx5bkZFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVlNHSXZXVzg0VW5SMWVUbDFVRTlVUkZKU1VWaGFhWGhXTm5vd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTmFrVjRUWHBWZDFkb1kwNU5ha2w0VFZSQk5VMXFSWGxOZWxWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZEVkVwSlYwSktNa05PWTBOVFdscE5TaXRTUm1SNmFFcFRjVVJGYjNaTmNrNXhPV1lLZDFweFJrMDVkeTlpTkRac05uVm5hWHB6ZEdJd2MybFVaMmRMYm5ndlZtNWxTRE5STDAwclUyaGlWR1ZxZW1WYVFVdFBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZQWnpWcUNuSnFPQzlYWmt0TGQzbG5TMDVCYm1NclZWVktWeTluZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwaDNXVXRMZDFsQ1FrRkhSSFo2UVVKQloxRlNaREk1ZVdFeVduTmlNMlJtV2tkc2VncGpSMFl3V1RKbmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXVzFOZWsxcVl6QlplazAwVGxkT2JFNTZSWGRaYW1kNFQwZFdiRTVVYUdsTlIxSnNDazF0V1hoYVZGVjZXa2RGTlZsWFNYZE9SRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmFrSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSldhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWVscEhjM2RJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUFwamJWWnRZM2s1YjFwWFJtdGplVGwwV1Zkc2RVMUpSMHRDWjI5eVFtZEZSVUZrV2pWQloxRkRRa2gzUldWblFqUkJTRmxCTTFRd2QyRnpZa2hGVkVwcUNrZFNOR050VjJNelFYRktTMWh5YW1WUVN6TXZhRFJ3ZVdkRE9IQTNielJCUVVGSFJWaHFNek5oZDBGQlFrRk5RVko2UWtaQmFVVkJjVmQyWWxGc2VGUUtRekJETjA5NVIyNXZiSGhWWjJ0dFRVOU1kbEUzTkdjMmRIcE1TVFV4VlZKb2JGVkRTVWhUYjFSYVFWRTRha1pXVldaNloxTmlhV1JGYUd4cFNFSTBiZ3B2WjJOWlIzWTNNemQxT0UxQ2NuY3lUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRWRkVVa0pHU21WUGRsQnZSelpxVTFKTVFrSnlSMHd5Q2tnM1JrVk1SRVZUYVZZeFRtMWpNbFl5Y25Cc1ZGTmhkWFo1VUVsUU1YSkpNbFZPZHpKd2FHcENWemhEVFVOVGMwOVpVVlJzTmpZNVlTdG5RVmRXZUUwS01pOXVhRzFwV2taSWNXeEZkV1IzUmxNd1IySkJVWFUwZFc1Rk9EWmxkekJYWVRCeE1XUmxaV3QzWTFKR2R6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1668028444,
          "logIndex": 6797464,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "bc3274c385ce710b818ee58b0de2f1e53da9ab04",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3431643923",
      "sha": "bc3274c385ce710b818ee58b0de2f1e53da9ab04"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

