# gcc-musl

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
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
| `12.1.1_git20220630` `12.1.1_git20220630-r5` `latest` | `sha256:c968f94bd2a9bcb81a6146c0ea413f1dabe821f31334756301be399333480a34`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c968f94bd2a9bcb81a6146c0ea413f1dabe821f31334756301be399333480a34) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To build the C application in [examples/hello/main.c](examples/hello/main.c):

```
$ docker run --rm -v "${PWD}:/work" distroless.dev/gcc-musl examples/hello/main.c -o hello
```

This will write a Linux binary to `./hello`. If you're on Linux and have the musl library, you
should be able to run it directly. Otherwise you can run it in a container e.g:

```
$ docker run --rm -v "$PWD/hello:/hello" distroless.dev/musl-dynamic /hello
Hello World!
```

We can also do this all in a multi-stage Dockerfile e.g:

```Dockerfile
FROM distroless.dev/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc hello.c -o hello

FROM distroless.dev/musl-dynamic

COPY --from=build /work/hello /hello
CMD ["/hello"]
```

And we can also compile statically to be used in environments without musl:


```Dockerfile
FROM distroless.dev/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc --static hello.c -o hello

FROM distroless.dev/static

COPY --from=build /work/hello /hello
CMD ["/hello"]
```


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-manifest-digest": "sha256:c968f94bd2a9bcb81a6146c0ea413f1dabe821f31334756301be399333480a34"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "b87e7327fca2749fd229337d52b8266fbfe18c90",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDOB9G9RFj6oS2GobzCa4qwpseu4TIT0bvtLtCHYWx6nwIhAPPf0tTXU7gU6dFtLew7ZP2HFCtSRrfk3xUy/gVHjLjM",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkNDBjMTIzZTgxM2YyZjAzZmRmZTIxNjBlNGZiYjhhZmM4OGZhMWIxMzU3ZGEwOGFmMDM4YzJiNjUwYzdiNmFmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNoRXpGMzE4R2FGZ0ZNeithWXo0SllmVThIV3FDMjlIUS83V1RCWmJCZkl3SWdNZ0JTcVRMUisyOTZPRjRoTitEQ3hVN0JCOHR3QzgwN3k3dzFjUllHYmlJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvMlowRjNTVUpCWjBsVlpWaEhiWGRZYjJKcFRVUjFTbGh4WW1kaE0wOWhkbU5aUkZWcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZGa3dUbXBCZWxkb1kwNU5ha2wzVDFSSmQwMVVXVEZPYWtGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYzZFZWVlFWVk5SekZKUTBzclYwSkVSUzlLUmxOVlZGWlFORGhNTjJkMWJXVnpXRkFLYTFWUGMxbHBSWHBhYzNWNGRHZGFkMDF5VFhoUFpXWk5hVlZWTmtkWGNrMDFORTgwY2xKWmVYaG5VblpGVHpGa04wdFBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZWTm1wTkNqQlBNVEpHTWpZMVVWTmxVa2hKUVVNNWRFRlVkbkZyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGbVFtZHZja0puUlVWQldVOHZUVUZGUTBKQ1JqTmlNMHB5V20xNGRncGtNVGxyWVZoT2QxbFlVbXBoUkVFeVFtZHZja0puUlVWQldVOHZUVUZGUkVKRGFHbFBSR1JzVG5wTmVVNHlXbXBaVkVrelRrUnNiVnBFU1hsUFZFMTZDazR5VVRGTmJVazBUV3BaTWxwdFNtMWFWRVUwV1hwcmQwMUNkMGREYVhOSFFWRlJRbWMzT0hkQlVWRkZSR3RPZVZwWFJqQmFVMEpUV2xkNGJGbFlUbXdLVFVOblIwTnBjMGRCVVZGQ1p6YzRkMEZSVlVWSGJVNXZXVmRzZFZvelZtaGpiVkYwWVZjeGFGb3lWbnBNTW1ScVdYa3hkR1JZVG5OTlFqQkhRMmx6UndwQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcFoxbExTM2RaUWtKQlNGZGxVVWxGUVdkU09FSkliMEZsUVVJeUNrRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNVFVRkJRbWN4ZGtzeFdUUkJRVUZSUkVGRlkzY0tVbEZKWjA0MlVUaDBhMGR2YTB0bVRVbDVXR3BhUm1aS1VUUldXamxtWTFWdlVreERMeXRxZDNGUlpEbEZZa0ZEU1ZGRVptTkljRWhTYmxORlNIWmxVd3BPWlhCWGVucHlSVFJwUVUxQ1ZuSm1NalZJVDJKdk5rVmhaM0ZpY21wQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG5CQlJFSnRRV3BGUVRsRmIyaG9RbEp3Q2s5Q05rRlBhMHBZWVV0dFFUWnpZVlJxTmt0WVoweDVOVTFYVlRsbmEwWTJWVzlWZDJ0cFZWTktZak5xVDBoQlEyOU1TSGxsZVZOa1FXcEZRWGxOTVdzS1RVUmhaekZ0ZFhkVGJsTXlUVkUyV2t0RVZsbHZTa00yV201UlUxZFFRamg0UldzclpXWnNiMlZWTUhweVlUVnZOR0YwUlZOR01IUnNTMGh4Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663692408,
          "logIndex": 3617172,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3091886979",
      "sha": "b87e7327fca2749fd229337d52b8266fbfe18c90"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

