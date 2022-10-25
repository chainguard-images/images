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
| `latest` | `sha256:85a93fddb88664b4af5550432c3ed62b3d586df90a1d23e8a011cc015f62bad9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:85a93fddb88664b4af5550432c3ed62b3d586df90a1d23e8a011cc015f62bad9) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:3493a89939f662daa219bb3142794fc071a102c00e061c15a1a0ae458ae12b0b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3493a89939f662daa219bb3142794fc071a102c00e061c15a1a0ae458ae12b0b) |  |


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
        "docker-manifest-digest": "sha256:85a93fddb88664b4af5550432c3ed62b3d586df90a1d23e8a011cc015f62bad9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5644ca5f5770603beda672dddfca50c4c2735bcd",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDr5TezKPOhj2XZxFudC1GewAYbCIqpqLIhOGe3zA704wIgTSNbTOiWYIve6NJPhUPnRk6KvyvD6fLqJmsWeseqQgU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNDM5ODRlYzcyNTk0YzY1OTAyOTQwNGU3YjQ1YzMyNTE4NTEwOTY4NDQwOTA1N2IzYjMyY2ZhYjUyNTc4NTQ2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRWZVUFAvdWl6SVh1SDloM1l0RlA3dzkrSEZ0d0RoZklzVXMvdXlIYlJSdEFpQU9KK0ZQNnF2TVhoc2xkaHhlQjEwSVNERS84azh4N0JHT283dG1VT3g5ZVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlNtOHlPR05DV1RKaFpHSlhRelJZUVd4SlFuWm9XVWhqYkd4bmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RGTlJFVjVUV3BGTkZkb1kwNU5ha2w0VFVSSk1VMUVSWHBOYWtVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZYY1ZSTFNsY3hXVlJPUTI5c2NTOW5NMWw2TjJZMk4wbGtZVGczTUdWNGMzQjZlalVLVjJwSE5FMTBhbEY0U201U2RXNXhXRTF0Tkc5TEswcENXbkJNVmxKcVEzSllSVTFsTm5sNk1Ia3pWV1l4UVVJd1VqWlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZIWm5SMkNpdEhUMnBETkhKVVlqZENXbXB6UTJGcWJ6TlZXWGcwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRsUlpNRTVIVG1oT1Yxa3hUbnBqZDA1cVFYcFpiVlpyV1ZSWk0wMXRVbXRhUjFwcVdWUlZkMWw2VW1wTmFtTjZDazVYU21wYVJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVSTWRYbHRkMEZCUWtGTlFWSjZRa1pCYVVWQmQzQktObWhWYkN0SWVGQldWaTltZFhGRk0yOEtWMEpUYWpGUWNHOVhUamxFYmxRM2JXOW9Sbmt5VURCRFNVWm1hWEJIZDAxRk5rWk9iRmxuT1ZGeWVsQmlTR3RVY3pCclNHbEdNSFUzYWxBMllXOTFPUW80ZDNvMFRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVFclozTkRablJKU0ZCdlRVRTRjblF4VFROcWRXUXdWR1ZFU3poc2JtVkpiakZaQ2xkWFowSTFSRFZaVFhkTE0xbzFRM1JMVlRReFpqTTBTbEp1YkRBM1owbDNXbk5OTTJRdmMyMVFhMVUyVFRVemFrSXplV3hWTVZCb1VrOW5TRkZuY2s0S1MwMVVhMUJTVUVOckt6aFFWVmh0U21zM09UWnRZbVZHUjBOdU4zQXdjR0VLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666660946,
          "logIndex": 5803094,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "5644ca5f5770603beda672dddfca50c4c2735bcd",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317317776",
      "sha": "5644ca5f5770603beda672dddfca50c4c2735bcd"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

