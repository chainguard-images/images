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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:0452bdb66a85547af4613b982b8cc03865719a16a9b6141ed428e88491a11f38`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0452bdb66a85547af4613b982b8cc03865719a16a9b6141ed428e88491a11f38) | `amd64` |


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
        "docker-manifest-digest": "sha256:0452bdb66a85547af4613b982b8cc03865719a16a9b6141ed428e88491a11f38"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "648c221b94a0c33877dd418a4cf83e2ca51ffc6a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFdcIRsGgXDG4MFkpOwXXJmobP3WSOyNxTUP3heoPvqqAiA+ihEAK8eP3fKK+4/ubJPcM8Yig1qqYE3wwUAB2pQz1g==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwNzc2N2E1NjBiYzBkMTgzODcxNTE3YWQ1MzhiOTE4NjRiYTYzMTBlZDM4ZDQ1MDkyMjg0NzhjMmIxMmRlODRkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQ4OFROR2N3dm5tLzZ0b0Y2UlY0ZEhpYzlML3lsc1BTVEdmcE9HazlLdEFBSWhBSkoxcWZZcHVtMktYMnBBeHIxVjU0SnNpWFNpYW5GQmp4SGMvb3VxWjFZRCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwbFowRjNTVUpCWjBsVlEwYzRZbFV3WTNCVVMwcEhkRWhxVUUwNE1rbzNWR2RtWkc5M2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlJFbDZUa1JWTTFkb1kwNU5ha2w0VFZSQmVFMUVTVEJPUkZVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYzZUhKbFUyNUZSMUl6TkdoNWRHcFBkamhGWkV0aFoyUnpZVVJhY1VOd1EwbHBaallLU0RsbU4wZzVTeXQ0YzAxc1F6azBabUZpWlV0TU1GRkRlbXRyUkVSTmEwMDFPVzU0VEdnd2MwUmFTRFp3YVhwbmRIRlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZWVG5aVUNsSkJkemxOYTA5S1ZWTlRURFpQU21oSWQyTmlSMGRuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5T2FsRTBXWHBKZVUxWFNUVk9SMFYzV1hwTmVrOUVZek5hUjFFd1RWUm9hRTVIVG0xUFJFNXNDazF0VG1oT1ZFWnRXbTFOTWxsVVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFUTlVNSGRoYzJKSUNrVlVTbXBIVWpSamJWZGpNMEZ4U2t0WWNtcGxVRXN6TDJnMGNIbG5Remh3TjI4MFFVRkJSMFZOVVhFNFEyZEJRVUpCVFVGU2VrSkdRV2xCZW5KTmRHd0tWa2hTV2t3eU9IQnVZMm8zWlN0TWMyRTRSVmM0YkZwU1NDdHZOMjlXUWxwaWFqRkVhM2RKYUVGSlEwWkxNRXhXV2tGb2VYWjBiMFkzZUVGd1pUQm1Md3B0YVhGNlQxUkZSRXhUZFZoVGVEZFhiMDFxTlUxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1OQlRVZFJRMDFJYjJSTFMwcDRkbTR4TjNobVNHOU1ibTFyQ21kcWJrc3hVRGt5ZFVOUVdUTkpia2xpWnpWMFRsb3hTMjFEZHl0YVJXbFJLMmxFU2tSSGFUSktaakpKV1ZGSmQxaGhjM2swVVVSVlYyRXlNR3B6TTNrS1JWRmhSM2hWWjBvdmRGUlRUbU5pVkUwMFZuTjJVM1p3V1VGQlUyaGFhbUZSZVhKdmJISnRWV3gwSzB4WGVXZENDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667270106,
          "logIndex": 6264606,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "648c221b94a0c33877dd418a4cf83e2ca51ffc6a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3366345822",
      "sha": "648c221b94a0c33877dd418a4cf83e2ca51ffc6a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

