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
| `latest` | `sha256:bbf1c8f58d78903863ca9d83737e184ac6342cf3f97879508f79dc17fba7ce0c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bbf1c8f58d78903863ca9d83737e184ac6342cf3f97879508f79dc17fba7ce0c) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:43bc187929606ecfa876baff9d648676515cfcf3528310f44995c33f98452aca`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:43bc187929606ecfa876baff9d648676515cfcf3528310f44995c33f98452aca) |  |


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
        "docker-manifest-digest": "sha256:bbf1c8f58d78903863ca9d83737e184ac6342cf3f97879508f79dc17fba7ce0c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5e8e51a625b3b166a237fae9a9502909d06726fb",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC0221wz3+q32GX4yBmZ/jJWzx/dn2J71ulMO66IzJbSgIgQU0FuJFdgxG75y4teZvhGfU6PElwUbuWZfbJYEebVa0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzODgzNTg0YzYyYzM1YjY1YTEyZGJkNGNjMDdhZmY3ZTE4NmFiOWI0MDVkYmE4NzZiYTIwMzQwMTgxYWQxZjA5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRVRyRyswYi9BbTduNWlmRWdOM1V5M1RnSW5ScWRqVkxvOHIvL1hnQ1Z3UUFpQXRDc01ScjkxRDJHOWVMVW9DckF0WU83bE5mR2Uyb29QbVI1MkdpR3lRQmc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlJVcG5lbXh4WjBneFQySTFjRGt2T1VWcUt6UmtWMFpHV2sxM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhoTlJFVjRUV3BGTWxkb1kwNU5ha2w0VFZSRmVFMUVSWGxOYWtVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZvVkdKVU1ERXdVR05uVjFONE9EUjZiblJtS3pkV0x6VjNkMFZ4VEhab2MySXpSak1LT0VoNWJqRnZlRVZ6VkVWV1dsWlFRalZvVGpKbE4yOUdTRlZqVGxJd2Jpc3daMkZ3VTFRMFMyaDVNVzR4Tm5WNlRHRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4UW5Fd0NsSjNRbFppZUdwNmFUTkpSekZDYm1oa2FFUmlhSEU0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRsZFZORnBVVlhoWlZGbDVUbGRKZWxscVJUSk9iVVY1VFhwa2JWbFhWVFZaVkdzeFRVUkpOVTFFYkd0TlJGa3pDazFxV20xWmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZwRU5taGFVVUZCUWtGTlFWTkVRa2RCYVVWQmNtbG5ZMmxPT1hGUFNEbHpaVFpEU3paTU1EUUtPVXhyTkZwWWFHSXJVaXMzTmpoelJuWjRNaXMyYW1ORFNWRkRkbmgxYTFwQ1RXWmxaWGxTYTBkcVMyRlpPVkJUZUZKVlMycEdaR2h5TXpKWmEyeFRkZ28xTkRSeGNIcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFXdERSbXgyY25wVkwwMDFTMmxNTldKM2NuQjZWMGhvZEU5T01tcFhjbE0zQ25nMldDdGpXVWd2VWxaelVuSnJNSFFyYjNSRVZHWlVTeTl3YVdOb1VrUXdRV3BCYzJSaVQxTmhLMDUyTDBkQ01qaFhiMEV6ZEhGalNFRkpXVmxRZW1VS1VtSjVaM1J1VVRKcU9Xb3JZWEpsZVVKYU5FRnpUbFpSYVVzNVFXbHFNU3N6ZWpnOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668129154,
          "logIndex": 6848724,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "5e8e51a625b3b166a237fae9a9502909d06726fb",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3441536213",
      "sha": "5e8e51a625b3b166a237fae9a9502909d06726fb"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

