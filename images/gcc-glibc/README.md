# gcc-glibc

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/gcc-glibc/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/gcc-glibc/actions/workflows/release.yaml)

Minimal container image for building C applications (which require glibc).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gcc-glibc:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:3b361d14ec995de30928bb3658d7b61fb96c2da1a07ff75c185967fd38786e31`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3b361d14ec995de30928bb3658d7b61fb96c2da1a07ff75c185967fd38786e31) | `amd64` |


## Usage

To build the C application in [examples/hello/main.c](examples/hello/main.c):

```
$ docker run --rm -v "${PWD}:/work" cgr.dev/chainguard/gcc-glibc examples/hello/main.c -o hello
```

This will write a Linux binary to `./hello`. If you're on Linux and have the glibc library, you
should be able to run it directly. Otherwise you can run it in a container e.g:

```
$ docker run --rm -v "$PWD/hello:/hello" --platform linux/amd64 cgr.dev/chainguard/glibc-dynamic /hello
Hello World!
```

Note: only `linux/amd64` is uspported at the moment.

We can also do this all in a multi-stage Dockerfile e.g:

```Dockerfile
FROM cgr.dev/chainguard/gcc-glibc as build

COPY hello.c /work/hello.c
RUN cc hello.c -o hello

FROM cgr.dev/chainguard/glibc-dynamic

COPY --from=build /work/hello /hello
CMD ["/hello"]
```

And we can also compile statically to be used in environments without glibc:


```Dockerfile
FROM cgr.dev/chainguard/gcc-glibc as build

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
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/gcc-glibc:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/gcc-glibc:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/gcc-glibc"
      },
      "image": {
        "docker-manifest-digest": "sha256:3b361d14ec995de30928bb3658d7b61fb96c2da1a07ff75c185967fd38786e31"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "bd79d60194872a5f973b5dec1b0f756bbc4554f9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHS1vw8N3Pb4gCY9JVGWNtPev3jNqZMtxYWmvwEIw5riAiANFGQ7YUaYlsbrfUOyHkwJoaUkPWGMgwRtReQ5i7Su9Q==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5YzM3MWNlYTBiM2NmZGMxMWZhMGVlMzI0OWQ5NjRjODdhMjExMDQ2Y2ZmNWUyZDlmNzI4YWFkYTZmMjNhMjhjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRkpVZ1dsR1VxYi9RWSsxbFVuMzVNU00zcDFMellpYmlzd3hKanB6OXJZWUFpRUFqQ1hJUGg1TTBvUWd1MjdzcDRmaU84SFZzR2NoOGtIMjRENGdNRndEVFRrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwbFowRjNTVUpCWjBsVlRHaEpSbXRCZEZwa1NWaEZjVzh6T0N0T2NqZzNZbEJHY1dwemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFbDZUMFJCZWxkb1kwNU5ha2wzVDFSSmVrMUVTVEJQUkVGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY0U2xnMUwwNTBaUzk0U1VkM01rOHpNMUUwT0U1blRIaEVlblE1VVVaT1RWZHhjemtLVDFsd1RWRjRWVTlRY2xaTWVsRmpMM04yYlRFMFMxSnpTSGh5YmxWalZ6ZEdka2QxWjB4NlZIcHdaM2xqVVVoMlNrdFBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYxY2pCekNqZHVZV3hyY1dsbFFrNWlUakZJSzNSWGRuRm5aek5OZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5WmJWRXpUMWRSTWsxRVJUVk9SR2N6VFcxRk1WcHFhek5OTWtreFdrZFdhazFYU1hkYWFtTXhDazV0U21sWmVsRXhUbFJTYlU5VVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFJoUkZkT1pGRkJRVUpCVFVGU2VrSkdRV2xGUVRGaFdrMEtjSGg1UVVoemF6aHFlVEIyT1hJNGVYSlhXSGN6TjJOUWRVUlROMHQ0Y0VZNWEwcDZhakYzUTBsQ2FqSTRSRlJFTkRRd1JsUkVObmgxV25vcmRUWmhTQW95YW05blRqVlNURmR6U1U5TGJIQk9jbnBaWVUxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1kQlRVZFZRMDFIZVRsNVdHVjZVbVZqVEVGM1ZXaDBTRGhwQ2tSSWJVRjRaVk5JVVVkM1luWklhME53WlZCU05scFZOWGhPVjJaTVNIUnJRa3g2TWtSUmVWTnBWRFE1UTFGSmVFRk5WVGxWY2xocVpXUlBSV0pSZUZnS1ZYRjFRV1JsYmxoMFIxbzVVMU5yTVhoTWVraFVOV2hSV0hkT2VTdFBPVFJpVlUwMEx5dG9aRGRTWTJjeWNtUmFRWGM5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663900687,
          "logIndex": 3783800,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3110049466",
      "sha": "bd79d60194872a5f973b5dec1b0f756bbc4554f9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

