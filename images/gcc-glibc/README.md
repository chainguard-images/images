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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:50fb09d7ede26da94b321dd43f0c4c1fe3cc5517094482226b2c01a6fc90f32a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:50fb09d7ede26da94b321dd43f0c4c1fe3cc5517094482226b2c01a6fc90f32a) | `amd64` |


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
        "docker-manifest-digest": "sha256:50fb09d7ede26da94b321dd43f0c4c1fe3cc5517094482226b2c01a6fc90f32a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b978f23ba10b8a79306f7bdcd5744f18eef99fd3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC1ZeF6ZqVlrH1KTR4F5ejXyjYUr1BaVTx3Pf+qnxmc7wIgWHW3GCaEqVDb6YtB3wgXJr2weXc1EXHTYQkPAu7zSLo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiZTViODExZmIyZmUxZTM1NzY2M2Y4ODEwOTRjMDc0MjcwNDc3ZWRjZDM0NDk1ZWE0Y2RlNDYzZDMxNDk2Y2U3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUN4R2ErT3psUVlqWHJEbStQSjFoYnF4OTBrNEoxQW1Gb3p0dHh2UFBPbVRRSWhBSW0yUGRQOTFOeTlQVmhwaWw0c1A2NUk3bTJYdHRac2VCMlBaRmhMYllWYyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwbFowRjNTVUpCWjBsVlJXMXNPRTlHVFZFdkx6SXhTekJVUzFKVVQyMXdaVkJOZVVVd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRKTlJFa3dUa1JSTkZkb1kwNU5ha2w0VFVSRk1rMUVTVEZPUkZFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ2U2pkdmNqZHBOMkpCY2pWcFpHeGFOR2g2UlRKRGNHOWtSMVpvYjNWSllVNXlVRXdLU3k5VlFscE1RakJ5WkcxM2VXOVBXU3MxWjBoRlMzVnlWRUYzVm05dWFWQnNTMHREZEhCTGIzUklVVWhPUkRKd01qWlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZWUW5SakNsa3lXV2RXV1d0VlRXdzRVbXBhVjNsNGJFbGlkVkJSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5WmFtc3pUMGRaZVUweVNtaE5WRUpwVDBkRk0wOVVUWGRPYlZreldXMVNhbHBFVlROT1JGSnRDazFVYUd4YVYxazFUMWRhYTAxNlFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFF6Y1RSQmIwRkJRVUpCVFVGU2VrSkdRV2xGUVc0Mk9UQUtaR3RDY21KaVIxZGlaVFJZWVdkbGVtMDJWeXMyVEhoT1EwbE5hSFZrV1hrMmMzSXpabFZSUTBsSU1qTndiMWRDTWk5Q1lrZ3pNVVpZYTI4MU4yZ3hWd3BzVUZGNE5XVTFjMU0xVDJJNVZTOHdXWFoyTmsxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1OQlRVZFJRMDFCYzBacVpuZHVOM1owU1cxSU5qUmtSMHh5Q2pSMldXNDBWVmxrZUZwNWREWlZZMVl3U0RkMFpEWldSMFpQTmxWRWJrWlBTakZyUkRGaWJESTJiVTlDTDNkSmQwMXBSWEIyUmxsWVVYQXdUemROUkdJS2RUSkxRMVJ1YTIxbldGSklTbU40Y1U5VlRrWlFPWE5RVTI5MFNVdFBWRGxZUWpSeWQyWjFXbTAyYUhSNGVtTnBDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665888292,
          "logIndex": 5191587,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "b978f23ba10b8a79306f7bdcd5744f18eef99fd3",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3257995969",
      "sha": "b978f23ba10b8a79306f7bdcd5744f18eef99fd3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

