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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:449b310c49f4bf2d9524888d8bd0dac28d0485fe7931246fe99c853ab92d7e76`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:449b310c49f4bf2d9524888d8bd0dac28d0485fe7931246fe99c853ab92d7e76) | `amd64` |


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
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys

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
        "docker-manifest-digest": "sha256:449b310c49f4bf2d9524888d8bd0dac28d0485fe7931246fe99c853ab92d7e76"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "11bef92178f13209efbcfb9ec9ea6468fd7c00fe",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC02kKT6Bd5Qt9JwfzM0cRWxjNxp1QT9IPX9xJWmDo6SwIhAOkBAflkd0GFHUVeCuzTnP3jDt40EE59yoFWEPrBE36q",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3ZDIwNGMxNzc1MDYwMGE5MDRiOTQ4ZGQ3N2FjOTg0MGM3MTVhMzZjNWE1ZmQyYmFiMGYwNGUwNmQ2MTFiZGVhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURvZk1TLzJUL0NNVER2TzdHL1BMK3Z1NXdaUlhNK01ObThSYjBDZEljZEV3SWhBSWRQRzlXaXBlb2tQckhBdHNkd21aV0dPZ3VOdklqemRIYjFzWHJqSlVXZyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwbFowRjNTVUpCWjBsVldWbHpXRWd2U2xSTFozTmpNbGxHVlRaT1FVRk5Lems0TVV4SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVhwTlJFbDNUMFJKZUZkb1kwNU5ha2w0VFVSQmVrMUVTWGhQUkVsNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ4WlZJclNrZ3dhbk5MZERCR05WVnZTM055V1RZd1ExZGpPVVoxZFRGTGFGRnBhbmNLUkZWVWVFVjZZa3hsUlZwUGVrWmFZblJuZUZwelZsQlphMUZ6VkcxSmFWQlhLM2d6V0ZneVEzUTNORkF2V0hoNVJ6WlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKTUhRMUNuQlVNSE5IVkU1RGJYRmFaSEpOWlhVeVpUVkVibU00ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5TlZFWnBXbGRaTlUxcVJUTlBSMWw0VFhwSmQwOVhWbTFaYlU1dFdXcHNiRmw2Ykd4WlZGa3dDazVxYUcxYVJHUnFUVVJDYlZwVVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFJ0Tlc1NU9IZEJRVUpCVFVGU2VrSkdRV2xGUVhaTlVFMEtVbWRLWmxKd2QxVlVkalpvYVN0RFJETlJPR3BDWkVWb1MxZEVURlJRVm05WldXcE9VMlZSUTBsRFlqZDRWMGhqVG1WRlMyTnhORzFPUnpoTmNuWjZaUW96VDBKR2RWbHVSamxoS3pSSk5GUndjbk13TmsxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW10QlRVZFpRMDFSUkRaYVRWQnFNbHBCVlVkeVdVeHNVRGs1Q25ndlEyNVlXV0V2YTI1Vlp6WmhVbk5wWkd0RkwxaE9UVmhLY25VMlIxTjZTaXRFT1hoM1ZIbGlPR05KTjBVMFEwMVJRMmw1ZEZoUlJsQTJOWFU0VFM4S1JqUkZOSEJxVldZeWRGaGpXWFkzYlV0SU1GbDVlVlEyVTJKWFUzRjRNRzVyWlRSQ1UxRlpjRVZMWjJkVFJYcE9USFZKUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1664762908,
          "logIndex": 4408759,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3171038308",
      "sha": "11bef92178f13209efbcfb9ec9ea6468fd7c00fe"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

