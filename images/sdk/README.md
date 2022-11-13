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
| `latest` | `sha256:3f77b7f1696fe2345c89c7782df808378cd60b4fc78a68c20d1b526decde2405`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3f77b7f1696fe2345c89c7782df808378cd60b4fc78a68c20d1b526decde2405) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:01551f93a4509c7e538fd11147d1f57a12f8a1f5c576b5317f793170adde1341`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:01551f93a4509c7e538fd11147d1f57a12f8a1f5c576b5317f793170adde1341) |  |


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
        "docker-manifest-digest": "sha256:3f77b7f1696fe2345c89c7782df808378cd60b4fc78a68c20d1b526decde2405"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "238628e25939769122e47d0bcd0be5dbfd6bf71b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDfQJbSG7i77FxpG1EeN0iGDvjBESe03CpWkSOtTy4ubgIgC5weXTyF+dyRb7rLRugzrnmbAZh1l4c/aMj7u0Es6ew=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4ODgzNTRjMzA0ODVkMGNhM2Y1OTY2NzVmODBjNzZmMmIyYjcwNTgzOTA3NWMyNDJmZDBjZGNhZDg2YzkxY2MzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNpb1FoR3N0S25MMjNGQ2dQMFU0MjZEeEtFeTNIWDRMYkxjaWQxSXNlakxnSWdlaHdIaVpBcWFRWU5raXJzVXJqOUZXOGt4NVVPZHFnUi9IMUp4eDIwS2lJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsMVowRjNTVUpCWjBsVlZqaFBWMVZMZDBNMFJVVmtORk5FYldsMmJUUXZlazlRWWxWdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhwTlJFVjNUVVJKTkZkb1kwNU5ha2w0VFZSRmVrMUVSWGhOUkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZCVkdkTVIycHBSa2d3ZW14UE1EWlBhelpZWmpabGJVNU9XalJpTmtWc2F5dFlNMFVLVEdFd2NIRm1hSEJrZGs5Uk5uTjBSR3hCVlhNM09USnVNMUZQS3pkRmFXVTBWV1JJYWpoeVkxaFVUMWxVZDI1TWR6WlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4VTJwNkNuWkRaazgwT1Vkb0wxTjNSVFZDYTJOcFpEbFFVV0U0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRXcE5ORTVxU1RSYVZFa3hUMVJOTlU1NldUVk5WRWw1V2xSUk0xcEVRbWxaTWxGM1dXMVZNVnBIU20xYVJGcHBDbHBxWTNoWmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUldKdlEwbFZRVUZCUWtGTlFWSjZRa1pCYVVKYVF6a3lTalUwU1U1WWFIZHhWRU54VEhCQlNFUUtUMHBuTjBaR1lWQTJWV3REWm1KSGNXMDVVbUZMUVVsb1FVcElURzB5ZUhWMmNURXJaM1JqV1VFeldHdGFaMWhuT0VkVFR6aGxTamh0ZWxSNVVYWXdiZ3ByWVRjMlRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeWEwRk5SMWxEVFZGRVRXSkdRbmh3ZEVkdGJDc3ZLMDltVldSM0wwVlJiRWRDUTA4clIxQkRNM0V2Q21OTVdXeElRbGd4TUZWT1dIWmxjMnB5TlZObWNrcEZVa293YjBFMFYyTkRUVkZFVW1KRWFVaFhTVmM0TmtoS1VVaEVlRFZMVkhsbFVIWnFaMWxvZURNS1dEa3pWRXBCVTBSeE5HWlJRWGhDWldwblJtUlBhSGxSWTNZd1IzSXlhVGhPYkdzOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668301236,
          "logIndex": 6962998,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "238628e25939769122e47d0bcd0be5dbfd6bf71b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3453146896",
      "sha": "238628e25939769122e47d0bcd0be5dbfd6bf71b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

