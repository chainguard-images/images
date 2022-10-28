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
| `latest` | `sha256:5a50451bc5bd81b751a1f98a9f62db6c0ac9439ba4b0980a7f5765224a0405cc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5a50451bc5bd81b751a1f98a9f62db6c0ac9439ba4b0980a7f5765224a0405cc) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:7e29df083b9aed60709fc354523a9ac3aa7efa8cf1109efe2bc08d72cbd2f422`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7e29df083b9aed60709fc354523a9ac3aa7efa8cf1109efe2bc08d72cbd2f422) |  |


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
        "docker-manifest-digest": "sha256:5a50451bc5bd81b751a1f98a9f62db6c0ac9439ba4b0980a7f5765224a0405cc"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a7211296c21edda8ce1c673b02b2e13145eec23f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDhICMvx32r1oxdwOsEAsla4M4oX0IwZRfpWtseuFhQEAIgJ39t0axcPB7OCi7IitDcnYT/6DZDDdw3t7je/BDhUGo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZTkyYjg4MzNiZTkxZjIyZTJlOTkxNDI2NjZjY2UyZjUzMzZjMWY3YTgzMjA4NjNjZTIzYzRjMTdiYzA2MDcxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRTR6bGIvOFZ1blN6S3crdEtFaERRbUNBVCswckdTUTVYQVhFV0VTMWNNVUFpQm9vckh1dE5OenRhV0xWNmlJVGkvaENGWGx0ZnNIdDd0d2dadUF3UzEvOVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlpVWXpZakZtZFZsUEx6UXdTMFJ0VTFoTVlXZDVTVGsyY0VWM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RSTlJFVjVUV3BCTUZkb1kwNU5ha2w0VFVSSk5FMUVSWHBOYWtFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwY0RobVEzRTRkMHRoWlZGbFRqaFNjbkpHU2tkMk1tSnRUazV3ZGpaeVZDOWxaVk1LZUZodVNUWXZOalpJYVV3eFFrWjJiVFIzWVRNMWNYcE5jM0JaUnpKbllVSnpjRFE0VVVWd1dFRTFiMEpXWVRBNE1HRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSTkVWMUNtbFlla1JPWkRGUE1rb3JjalY0Wm5OaloxbFhLMVE0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldWUmplVTFVUlhsUFZGcHFUV3BHYkZwSFVtaFBSMDVzVFZkTk1rNTZUbWxOUkVwcFRXMVZlRTE2UlRCT1YxWnNDbGw2U1hwYWFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVoRE5sQm5VVUZCUWtGTlFWSjZRa1pCYVVGeWR6bHFWMVpYZDNkdFQwOVhORGxzV2xkSlZuZ0thRGRsZGxGWFlXZFFTbmczZG05VFFqRkZZM2ROZDBsb1FVcFFiRTAxVDFwblVUQjRWMmt5YkRodVUyOTJjRUZIV0d0alIxUmFXbWxNVlc4NFFVazNVUXB6U1ZOWFRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFZGRVZXNXpOa2xqWldoSVlWbFBibkZOY21kTVpsTlpaVWxHZGxkc1FVNUViRGhOQ2twNk5VdzBLelI1YTB4cEsxQnJlV3hvU0ZCUllqTjVSRlVyYUc4ck5UUkRUVUpzTlZCdFdHSnlTVkpEUzJWVlVYTkhTR1F3YnpSb2JIaHhURUZ1VGtnS2RHRlhkbUk0UzB4WFJrZEpMMlk1Tld4elJucDFWRFpYTldGNU9UbDBVa0kwWnowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666920140,
          "logIndex": 6014609,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "a7211296c21edda8ce1c673b02b2e13145eec23f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3341920759",
      "sha": "a7211296c21edda8ce1c673b02b2e13145eec23f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

