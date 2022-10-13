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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:52df93138d9e54a6902321351ad459513569f0bf470e775a40410b8e4920bddf`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:52df93138d9e54a6902321351ad459513569f0bf470e775a40410b8e4920bddf) | `amd64` |


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
        "docker-manifest-digest": "sha256:52df93138d9e54a6902321351ad459513569f0bf470e775a40410b8e4920bddf"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a4393b3c0cfd50a4b701958a864928be27791e74",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIH5qoHzZjjvqFntAx9I41RFwYMwEbDo6Q/w9RwE9QVOzAiEAj+kfrD9R7mix1Xp8oMvf0RnOVpFrC4wqzTrtqx8wJbA=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1ODUxZmIyODhlMDU3MDY1NzE3ZTY3ZTYzM2QxNGY5OTc5MzU2M2VhYWUwMWE1NDk3OTg0MzI2Y2I0NDc2MmY2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNEdnBGQzRLUGt1M0dUcVRmd3VPdTZoUlF1ajBNRy9KcGE1dkppUnlsL1dRSWhBSmhuUS8wWEg4OTdFYk9GT1daTnRobUsxZkd6d1RqS0dZZFNBV0ZQNC9ieCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwaFowRjNTVUpCWjBsVlJHNU9SMVpoYUV4b05TczFXRlJ2YTNad1dGTkpRMjlOWm14emQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFbDZUWHBCZWxkb1kwNU5ha2w0VFVSRmVrMUVTVEJOZWtGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZOZEhSUmFUWnRLMjVtV2tORGIxZE1jakJqYmtseGRVazRNVFUxZFV4Uk4zQlNhM01LZGs5U2QybEdVa3RLVG1SclUwSnplRTE1WTBoSVdYQktjbGwxV1VKTFFVVktkMUJHVTNweVVqVnBhbTB6Y20wdmFXRlBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZLZVd4UENtWklWMGsyUW5WNVEyZGlTbmh6V0VRNGNFSkhOa0pWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5WlZGRjZUMVJPYVUweVRYZFpNbHByVGxSQ2FFNUhTVE5OUkVVMVRsUm9hRTlFV1RCUFZFazBDbGx0VlhsT2VtTTFUVmRWTTA1RVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkS1FtZHZja0puUlVWQlpGbzFRV2RSUTBKSWMwVmxVVUl6UVVoVlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFI2ZWtGd01WRkJRVUpCVFVGU2FrSkZRV2xDUzJkVFVYa0tWM2xLVkc5UlpFVTBVM2MxUjIxNlZsaG1WVEIwY2s5WFZtWlNjMHA0WmpJeFRVcDRSM2RKWjFCVVIzQjNRVWN2Y1UxNVowdFFiVEp4YTNneFkwcGhjQXBFY21rME16VlhaVGxFUlhOVWFrbExZMWwzZDBObldVbExiMXBKZW1vd1JVRjNUVVJoUVVGM1dsRkplRUZQTkVZeGVGUnFaR3RDYkZKSWJsRTBOSGgwQ21Kd1JtSmplbXBOVFZWcFRHOTNZMFphYkdob1RHNHpSSHBPTVdwd2RFSnRSV3RrYjBKdFVtSndRVXczTUdkSmQwSkpjMHRIUnpoWU1YQllWbU5JV2tVS1RrbHJLMFZrVVVkdFdFZExTVmgxYWprM1VIZEhSMlIxV1ZoamJWQm5VWHBpUTFsbmRUQk9WMkZQV0Rkb2NHdzVDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665628388,
          "logIndex": 4999849,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "a4393b3c0cfd50a4b701958a864928be27791e74",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3239271186",
      "sha": "a4393b3c0cfd50a4b701958a864928be27791e74"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

