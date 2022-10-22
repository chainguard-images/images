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
| `latest` | `sha256:a25d6c7203522d2e415701fd6ae1f4d29249d0262f97aa4fff38ed3f558170c1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a25d6c7203522d2e415701fd6ae1f4d29249d0262f97aa4fff38ed3f558170c1) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:040e59e05b76bfb44e5a446f58df05dd2ae84f2fba23340f6edf553732d3165a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:040e59e05b76bfb44e5a446f58df05dd2ae84f2fba23340f6edf553732d3165a) |  |


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
        "docker-manifest-digest": "sha256:a25d6c7203522d2e415701fd6ae1f4d29249d0262f97aa4fff38ed3f558170c1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "8d2ccd95433ea928d8cedfc2598657a44840dd2f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCNQCkD5fjT3a0JTeg68k5lmpjyI1ucROeV7nkBGO73hwIgIbV00Rkjx32FQkcD4fWjc5vOOUxBE93N+HumUgmbMOQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4YjUwNGM2OGQyMzdjYTE2Y2VmZWRhYWUzZGU0YzUzYzAzMmI0OTZkNDE0ZWI4ZjdmNmRmMTRlODJkN2ZiMzNkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRUxrb25CeENpZ3FCcWZhbzJPMXp6RDFLSmpqQjJTNnlGL2phclFLUWxmTEFpQWE1REhqS0NQa3RmTXlmVDV0RFBobkxqM1N5Qmp3Q1hjM2RQVkVSL2VvVlE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlVXSkVVbEZ1T0ZnMUt6VnRUMjV3ZWtFd1VsWjNjMFZ1VXpGUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hsTlJFVjZUV3BOZWxkb1kwNU5ha2w0VFVSSmVVMUVSVEJOYWsxNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyV2sxMmVYTmxRMmxQTms1eFZ6ZFpiVVJ0ZFdkTU5uYzRkRmxhYTNKQ1V6UTVjMHdLVnpkME9ISk9kVGRSYnpCNmJUbE1PRXh6WW14eVlqTnZWa2RvY0doVVVGZ3daVXhoVmsxUFMwWnBZMWRXVm5WalJrdFBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZxWlcwckNtNW5PRTkwT1hSamNrWjJablJrUkdRelpIbDBSRTFCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlQwZFJlVmt5VG10UFZGVXdUWHBPYkZsVWEzbFBSMUUwV1RKV2ExcHRUWGxPVkdzMFRtcFZNMWxVVVRCUFJGRjNDbHBIVVhsYWFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkM5V1NVRk5aMEZCUWtGTlFWSjZRa1pCYVVWQloxUnRPRlE1WkVkdVFUbFFUamxIWlVKNlZ6UUtUWE5pTmpjNUwyNXpOMWh5YWtkQlVFcG1LMjlCUXpSRFNVVXdWRGgyUTFJeVJHbFdjbFI1UVdwa2JWQkZaVXREU25OWEsybzVTbFZzV1N0NE1qZzRWZ3BSUzFSdlRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFVoa1R6SlNNbkZ0UmtGWmJtVk1XRWxsTTFwTFZGRjZWV1ZCTUdSTU9USk1UV1Z0Q2tGblprWXpNbFJZV0U5NGJFRkNZazlHVjFkWlJYVjZhREZTYVRGTVFVbDRRVTgyUnpkUE0wWTJWRUYyUlRFdkx6QnBla1l2V21GV1dFUjRSamRFYVdrS2RYUXdiakpDWlN0clQybDZkWGMzU1RnMk1XcGpPR1Y1VlhkQ2FYbFJNazFtVVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666402362,
          "logIndex": 5609842,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "8d2ccd95433ea928d8cedfc2598657a44840dd2f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3301316248",
      "sha": "8d2ccd95433ea928d8cedfc2598657a44840dd2f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

