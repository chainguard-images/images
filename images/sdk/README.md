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
| `latest` | `sha256:5e9488e223615d30abbe85609b894657f8ba2c8c4a127db292fd2406d074aba0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e9488e223615d30abbe85609b894657f8ba2c8c4a127db292fd2406d074aba0) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:5826362c65a7177d441e8f042044a513aca748319d64ba42286b5dda0de12210`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5826362c65a7177d441e8f042044a513aca748319d64ba42286b5dda0de12210) |  |


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
        "docker-manifest-digest": "sha256:5e9488e223615d30abbe85609b894657f8ba2c8c4a127db292fd2406d074aba0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7284a3575661163a59c626a62850e0ae70efa346",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIE/su4TOstKXHyfct6MAfp1woAtbu6Ry6Nh6eUciXrcLAiAsEb8bOzuyn+xELC7ksEVfP3obHQSz02AZHs0PZar8Wg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4NTk4NDM4YTUzMzJkNDY3NGI0MjlkMmNkZjg3MWRlZTA2NzVmMDc5NDc0OTljMGJhMzg1NjNiODM0MjcyYTMxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ0pva3FmWEtoR25NNHY0K0FXSHQrL25LKzd1b3U2MlZJMEpOelB5cjZlSkFpQWY5dHBRYVBVMUFTZnhMTW9BZjFDWXdUTVFaRENicXl3ZVREb2VsMlE5K0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsMVowRjNTVUpCWjBsVlNsVlFWVGR2TDFGdFVYRTBOVkkwUTJFeWFpOVBlQ3RNWjFOamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlJFVjVUVVJGTTFkb1kwNU5ha2w0VFVSSmQwMUVSWHBOUkVVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXVG5sNGIwNWxiVWRCV2xwd2VHYzRhMjV5YzJ0MFRVNU9lVlZ4VkVaU056WnhRVGdLTlU5bkszQnViSFpoU21Wd1JEQjRTV3RYVVVnemFuaFlZVEpQV1dONGREQmtkVmhCY0RGVllVVXhSemgzZVVzM2JUWlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZUTldNeUNqazJjV05xYTNwT01XeGFUSHByYUhOWVpUaGpPVFJGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRucEpORTVIUlhwT1ZHTXhUbXBaZUUxVVdYcFpWRlUxV1hwWmVVNXRSVEpOYW1jeFRVZFZkMWxYVlROTlIxWnRDbGxVVFRCT2FrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRoMmIxQXpRVUZCUWtGTlFWSjZRa1pCYVVGWlZuSlNhbk14YVcxbVNUbFlPVWxtUmtGM1IxWUtlSEl2Y2pGSU5WTnZXblZaTkd4RFJrcFFOV2xCZDBsb1FVNWxUVUZMU1c5eFRsWjFWWGhGZDA5clZFOXFOakV2TUhSck9ISkhOREZpUW1ocFduZFRiZ3BDWnpWR1RVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeWEwRk5SMWxEVFZGRVJ6STRVVE0xZVN0SFZUQlFlRGREWVRCUlZXWnhOVE00Y1ZGdlMwZEVZblYyQ2tsMlVWTTRkakUyS3poUVVXVlVMMjh5ZEZWWlZqYzJkM1JtYm1OSFJUaERUVkZEYWxWR2RrOVBjbXR1WWxwR1VVUjVORFkyYmtGMGEwUTVkMFZEWkRjS2VuRkRUMjlZT1hrNGNYTmlTVGxQU1doMlRFOVhlSGxuYjJabk1sbGxTRVJuZHpBOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666228826,
          "logIndex": 5466173,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "7284a3575661163a59c626a62850e0ae70efa346",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3285989058",
      "sha": "7284a3575661163a59c626a62850e0ae70efa346"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

