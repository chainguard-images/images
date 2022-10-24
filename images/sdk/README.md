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
| `latest` | `sha256:bf650a70525ea81c163b08f8b22a85052bc3ce99c578ecfdc3784368547940d8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bf650a70525ea81c163b08f8b22a85052bc3ce99c578ecfdc3784368547940d8) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:6f7f8d333ae5a529b4f2aa4ca58d96b61cd3535d1ee703f69fca41e4ca4ba8a8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6f7f8d333ae5a529b4f2aa4ca58d96b61cd3535d1ee703f69fca41e4ca4ba8a8) |  |


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
        "docker-manifest-digest": "sha256:bf650a70525ea81c163b08f8b22a85052bc3ce99c578ecfdc3784368547940d8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "956a76b5159b41d2c9aadab1b1e0b49915f17b64",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDcF2N5F6TexwzYF8NRUWIhLtfx82sSws4l3P6uX5QVVwIgNedG6ZZO0eDgs8pFftxTNPdMEVR5LP9rR6h4WjneaDE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNGJmMTgyMzVhNDc0ZGY4NjM3MGM3NjdkZDdhZTVmNWJjZTdlODdmNGM5MmZhNGVhMGQxY2ZjN2U4ODNhYTZiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRjMyaWtEQ1NvS1NJZHdQWDZNK25ub25UM0gxTG00NE5TTmdNSlBRbHhNcEFpQTIvNUJpcG9OdEFhNGo5K2p2MXhtWFhBN0ZuLzQxMDgvbVpZczE5WjNXU0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlNVRm5iMVptY1VoUFNFNDVNVVJQZFdaNE1YZHFkMGRyV1dkM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RCTlJFVjVUbnBKTlZkb1kwNU5ha2w0VFVSSk1FMUVSWHBPZWtrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZRZVVOa01HOU1XbVZpVTJodlJtWkZjVlZ2Um5vMFdVTjNURmhZTHpGT1RtbHdhemNLY1ZVMmNsaFVUSFJuWVc1NVVFUXZVR1Z0UzA5MWFrNTNOVFJMVjFFcmFHZEpjM1prU0c5U01rbFVWVVJqVm5ONGJ6WlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZrTnpOaUNtWnNaRUp1VmxCUFNtSjZlV1F2VTB0elJYRkpiVlZ6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlQxUlZNbGxVWXpKWmFsVjRUbFJzYVU1RVJtdE5iVTAxV1ZkR2ExbFhTWGhaYWtac1RVZEpNRTlVYTNoT1YxbDRDazR5U1RKT1JFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVJMWIxVTFkMEZCUWtGTlFWSjZRa1pCYVVWQmJIUm5kWFJoTmpkRFdsWTJTemh0ZGxSYU9Xb0tVRk56UzFkVWRpOVlSRTFRWml0aFRFOUtOM2xKTDNkRFNVZEZOR2cyVTBJNVV6QlpZbTVhZUZseE9HcFJWMjVpU1VoMVRXMUZjbHBGWjJaeVRXSmlid3BDT1ZKaVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFZGRVN5OW9lazFVZGs4eWVFNVhkREJLZEVWSksydFpRVGxPZGl0R1EzTk9MMHRrQ2xGMVJscDVjV2xVYWpFdldqZHpTSE5tU25SV1ZDdHdNbUZLTTJRMU9HZERUVUZITkRCUVYzaHBZUzlMYlc5eGRuRTVTbFUxTDNSWWRGUldlWEZLYTBFS0szQnBaME5rVmpCMFZuTlZiWHBIVVVnNU5rZDVkazFSVEZOMksyVk9WV1ozZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666574856,
          "logIndex": 5731284,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "956a76b5159b41d2c9aadab1b1e0b49915f17b64",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3309224133",
      "sha": "956a76b5159b41d2c9aadab1b1e0b49915f17b64"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

