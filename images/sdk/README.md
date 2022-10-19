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
| `latest` | `sha256:dea147cf3d3284e58a692dcc30cb851149027a16d74e4af88a1b69521af8059b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:dea147cf3d3284e58a692dcc30cb851149027a16d74e4af88a1b69521af8059b) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:f511ac69c7df07f81d8be72e98a506536b977bce304a497ee382edb376ae8fa0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f511ac69c7df07f81d8be72e98a506536b977bce304a497ee382edb376ae8fa0) |  |


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
        "docker-manifest-digest": "sha256:dea147cf3d3284e58a692dcc30cb851149027a16d74e4af88a1b69521af8059b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "69e2f26f86b75acbbe7bbeb799557bbe40a4f0c3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDLhLTtNcyuAxBoDqnFNnD9dITx8DnYFO8pgzP3h10fhAIhAIJjjzbobsTCcd4UmTFL0PigvRuEO1sAOXGQJ6siygsK",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyMjhmYzc2MjZkNzE2ZmI4ZjkzODM3MDVlZjg1NDM3MzgwYjAyZjE5YjQ3NmVlMTNiMzhiNWJmMmVmMTQwZDFhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUMwbUdadnFxMXFhaEpCalJFbmR4aWhGd3BTSHZZN09rYnJnbklMQUk1Mlp3SWdhQUwyRVF0UENDOGhybHVGOHNmUkRjcWh4YkFyLzJNSmtmS1hJTXJSMGlRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsMVowRjNTVUpCWjBsVlJXWllSRVZpWjA1eVJFMUhiVk0yYjFVck5VcEZTMVJLUlUxWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFVjZUbFJSZVZkb1kwNU5ha2w0VFVSRk5VMUVSVEJPVkZGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZyWm5kQ2RETmlWVlZZTUVabFIxbzFURWhYVUVwRWFHRkVhWE5MYm10R09Ha3dUR29LU0ZZNVF5dHJlV1F3U1hocGQyaDJLMWd6TVVKMVRFUlZVbkZYWjNWSk4yUjNhRnBqVDNsNlREbDZRakIwZFRjeFpFdFBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYyYWxBckNqaEdRbVZoU1VoRVpYcEpWbFJTVmtSR1N6TTJaWGxWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRtcHNiRTF0V1hsT2JWazBUbTFKTTA1WFJtcFpiVXBzVGpKS2FWcFhTVE5QVkdzeFRsUmthVmx0VlRCTlIwVXdDbHBxUW1wTmVrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRkbFNGSkxkMEZCUWtGTlFWSjZRa1pCYVVWQmVsSmxUbXN2VjNBNGQzVk1Mek5QTjFScVlrWUtNeXMxWVhWU2EyWnNWbmhuYzFGS01HSllOek15VlRoRFNVWmFWamhYUzFKc2JUWjRVRWxVVnpjek9HWTJaMnhVUm01WlRqTlJaVk5LZFZFemVHTmhOd3BoTkU5NVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeWEwRk5SMWxEVFZGRWJUUXJSMmxRWkVGelREQlpXRXBKUmtOMFRDczFOMU5EUzA5dFVsWTJhVFZZQ2pWWmF6RTFaQ3RKZUd4TldVazFSamxHZDNSeVJVdGtkMnhOTjB0WldEUkRUVkZFVFRSblIxUlhNSE15U3k5UGNIbzVlbVphTlhOUE1VZHhXRUZ3Y1dzS2FHbFNLekJYUVdFMlJHeFJOelpUU1Vab1FYaFlURWRQY1hoMFJIUlJSRGxNTVZVOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666143359,
          "logIndex": 5399864,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "69e2f26f86b75acbbe7bbeb799557bbe40a4f0c3",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3277966422",
      "sha": "69e2f26f86b75acbbe7bbeb799557bbe40a4f0c3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

