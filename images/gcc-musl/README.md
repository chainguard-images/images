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
| `12.1.1_git20220630` `12.1.1_git20220630-r5` `latest` | `sha256:f570b0e8a7a43661d351b825a2794b73b4894b5cab5911c0a855c09b2c29ad81`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f570b0e8a7a43661d351b825a2794b73b4894b5cab5911c0a855c09b2c29ad81) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:f570b0e8a7a43661d351b825a2794b73b4894b5cab5911c0a855c09b2c29ad81"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fba31f363d35dfad5886204603bcaa0f0a66edad",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFPi8Z5n6QCPoJVGJ0NEYSpYGfUu4hIn5rXQJfqxCKwyAiEAmNhW2DheGLuWrpdfBmMZ0ah1pGnXp/rdR6q80SurykE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkYzkzNDY0ZjRjN2Q0ZjM3ZjFiZDNkNGE5ZGU4ZjgyMzE4ZjA1ZWM2MWRiNDYxODI4NWY4NTUwNjA0NjA5NDc0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURvRW5xcnRKVy9YZnpaQnZISWxSUDZwWWFyeHY1Rk5ycFpWVWNMWHNlVE53SWdSdERWZHJoU2RMVzhhTFFlaXJlK21QOVlUVTR2SnphT0h5Z3BzZkViTklZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwWFowRjNTVUpCWjBsVlpIaExOMmRQV1RZM1ZqWk9URkp0VkVkTVFqVjFjU3RuU1dGRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFRjZUbnBWZUZkb1kwNU5ha2wzVDFSSmVVMUVRVEJPZWxWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ6VDJzelZtaHVaRWd5V25OS016WjNNSFZ6ZG01Q2NVbHpiVmxsTTJwR1FVOHJPUzhLWW5kV05XRkxPRTlOYzFZekx6ZEZWRlZsUkRJdlNEbEdUVWh3ZG1Wc1NuVlZUa3g1Um1oNk1FdEdZME53TkVaVWNFdFBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNZVM5RkNrbEdSV1psVERkYWNFOVRlU3RWU2xkYWR6aERiVmhOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEYUcxWmJVVjZUVmRaZWs1cVRtdE5lbFpyV20xR2EwNVVaelJPYWtsM1RrUlpkMDB5U21wWlYwVjNDbHBxUW1oT2FscHNXa2RHYTAxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NbVJxV1hreGRHUllUbk5OUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtY3lTMmhLU0VsQlFVRlJSRUZGWTNkU1VVbG9RVTFGY0UxUWJrMEtaMUJOU0c5VVpXSXhRVlV3V2xsMGVuUlFZM0p5U0M5UVdYSmFaVUpSV0V0cFdFNTBRV2xCVWxOWVQxUlJlV2hGUlhCNlFrZHdlVEpvYTBsNk1DdEJXQXBwY0doS2N6SnpaemRVWlhwd1pVUllWMnBCUzBKblozRm9hMnBQVUZGUlJFRjNUbTVCUkVKclFXcENkV0phVTBsTk5FaFlWMDVSTkhwWlVVTlNXRTFZQ25wR01YSlhiWEpuZWpKalRuaFpaMEo0WVVOdFJHWXdWV1pJTmxsRmFuVnpiMk1yVDFCQmFTc3lOVmxEVFVkWFJsUXZZMVJHVnpaWFR6UnFWQzlaVTBNS2QzTXdOMkYxV1dkM2JuazJkekJqV1RseFUycHhiSGwxU1VWMUswSTBaRmh5Um1kMldsWndUV1kzZDNOTGR6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663807089,
          "logIndex": 3711045,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102065690",
      "sha": "fba31f363d35dfad5886204603bcaa0f0a66edad"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

