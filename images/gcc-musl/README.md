# gcc-musl

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/gcc-musl/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/gcc-musl/actions/workflows/release.yaml)

Minimal container image for building C applications (which do not require glibc).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gcc-musl:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `12.2.1_git20220924-r2` `latest` | `sha256:74ae82fbe4a3c61a88f467f0138ad0f7b6f897c29103f726cc9e65b193225252`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:74ae82fbe4a3c61a88f467f0138ad0f7b6f897c29103f726cc9e65b193225252) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `12.1.1_git20220630` `12.1.1_git20220630-r6` | `sha256:556b4207da3272a152fb441982f6fac448a763a23e2e750cf04cba9620eeb813`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:556b4207da3272a152fb441982f6fac448a763a23e2e750cf04cba9620eeb813) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `12.1.1_git20220630-r5` | `sha256:908fa1f99f90faf71209ccd87700153bc8546c03bcb2aecea20e4a048a5f885d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:908fa1f99f90faf71209ccd87700153bc8546c03bcb2aecea20e4a048a5f885d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `12.2.1_git20220924-r1` | `sha256:b3c041c03449bcf68dc9b4965335626757fa865223203cb9eb64608f154f0e7e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b3c041c03449bcf68dc9b4965335626757fa865223203cb9eb64608f154f0e7e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `12.2.1_git20220924` | `sha256:92448583518d1a430534811abc4fb14ad9c5fcbc758841fd44274b943d765fa8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:92448583518d1a430534811abc4fb14ad9c5fcbc758841fd44274b943d765fa8) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To build the C application in [examples/hello/main.c](examples/hello/main.c):

```
$ docker run --rm -v "${PWD}:/work" cgr.dev/chainguard/gcc-musl examples/hello/main.c -o hello
```

This will write a Linux binary to `./hello`. If you're on Linux and have the musl library, you
should be able to run it directly. Otherwise you can run it in a container e.g:

```
$ docker run --rm -v "$PWD/hello:/hello" cgr.dev/chainguard/musl-dynamic /hello
Hello World!
```

We can also do this all in a multi-stage Dockerfile e.g:

```Dockerfile
FROM cgr.dev/chainguard/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc hello.c -o hello

FROM cgr.dev/chainguard/musl-dynamic

COPY --from=build /work/hello /hello
CMD ["/hello"]
```

And we can also compile statically to be used in environments without musl:


```Dockerfile
FROM cgr.dev/chainguard/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc --static hello.c -o hello

FROM cgr.dev/chainguard/static

COPY --from=build /work/hello /hello
CMD ["/hello"]
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/gcc-musl:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/gcc-musl:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/gcc-musl"
      },
      "image": {
        "docker-manifest-digest": "sha256:74ae82fbe4a3c61a88f467f0138ad0f7b6f897c29103f726cc9e65b193225252"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "c4f9d25cdf7389ae77ef41b091efa3ef6a49b48a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBN+zQxJlrtqGRV9svmjEEYP7yyk0b4wVYKT65ClMSORAiEA11u6R5PffpG+rffDdKCZDvG96OBu4iMuSmAJh/XEiuQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkYmMyNzk1MTJkMTI1NzliOTM4YTZhMDI5MTJiZDRhYzYzMjQ2NjQ1MmJhYTczZTkzNjJjZWQ0Y2Y1NTgyM2IzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSGs1cG5EUWxiQ01SZE40R3B6MXgvcSs1WkV2MlNWS000ZmRXZkxJTDZaOEFpQUIwVHNaSDQrc2lJRzV0YWlncFZCNTdsNStTVk81TlBjWjhqVGl2T0lZc0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhvclowRjNTVUpCWjBsVlpFbG5SMkpFU0hKSlIyTlZZamhRSzNNMVVqY3JURlZLUWpWQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlZGRjZUbXBWTlZkb1kwNU5ha2w0VFVSRmVrMVVVVEJPYWxVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzTkhSTWNYcFVia2d4ZUhaMVFsVXdWVVV4VGxOWWNtUlFXalF2YjFSNGJDdFlPWFlLYm5jNE1uRkhUV1pXZFRoVlRURXhWV05xY2pWTFEyaHZkbFZPY1RkNU9FMURPSFZVT1VoQ1lWaHFZbFY2VlZwMVRqWlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyU1RaRENtbGFhMEZ6Y1RJM1pWZ3hjRlJzUjJNd05tRjZaMnRKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGbVFtZHZja0puUlVWQldVOHZUVUZGUTBKQ1JqTmlNMHB5V20xNGRncGtNVGxyWVZoT2QxbFlVbXBoUkVFeVFtZHZja0puUlVWQldVOHZUVUZGUkVKRGFHcE9SMWsxV2tSSk1Wa3lVbTFPZWswMFQxZEdiRTU2Wkd4YWFsRjRDbGxxUVRWTlYxWnRXVlJPYkZwcVdtaE9SR3hwVGtSb2FFMUNkMGREYVhOSFFWRlJRbWMzT0hkQlVWRkZSR3RPZVZwWFJqQmFVMEpUV2xkNGJGbFlUbXdLVFVOblIwTnBjMGRCVVZGQ1p6YzRkMEZSVlVWSGJVNXZXVmRzZFZvelZtaGpiVkYwWVZjeGFGb3lWbnBNTW1ScVdYa3hkR1JZVG5OTlFqQkhRMmx6UndwQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcGQxbExTM2RaUWtKQlNGZGxVVWxGUVdkU09VSkljMEZsVVVJekNrRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNVFVRkJRbWM1U0VjNGREUkJRVUZSUkVGRlozY0tVbWRKYUVGTGNVRmxlVTQ1ZWpkYWFqSXdVa3A1T1hsaFFYVjFialY1U1dkWFlWSjZTMVpLWWprMlJXaEtlWHBuUVdsRlFXMVRkMVpyVTBOb1QxQnRNUXBZZG1sYVExWlVNR1pCTmxOWlJYa3pZM1JLUTNCMlUxRnlibEJSWWs4d2QwTm5XVWxMYjFwSmVtb3dSVUYzVFVSYWQwRjNXa0ZKZDJWWmRYVnBXRXBCQ2pGM2JFUmlXazgyU0VkeGVYZFhaRTEzUWpNNE9XRldZMWxTV2pKSmJsUXllbGRyTDFwdk1pdHhlbEJEUVhCeVdHTnZkbWxWTldRMlFXcEJkVW94Y1hFS0t6STVkR29yWW5kaWFIWm9WVmhOYmpaNmNXTkVPVUpSZDNWSmIyUk5hbkJ6T1VJNWFHbFdRM2hHVlVVM1RubG9hRkY1VGxGUlZ6TkdjV005Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665671846,
          "logIndex": 5032214,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-musl",
      "githubWorkflowSha": "c4f9d25cdf7389ae77ef41b091efa3ef6a49b48a",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3243253214",
      "sha": "c4f9d25cdf7389ae77ef41b091efa3ef6a49b48a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

