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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:3c095ba6d869c5abcc15cd7562dd25fd1f58f6b114a9fcdcd081374e6cdbe81b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3c095ba6d869c5abcc15cd7562dd25fd1f58f6b114a9fcdcd081374e6cdbe81b) | `amd64` |


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
        "docker-manifest-digest": "sha256:3c095ba6d869c5abcc15cd7562dd25fd1f58f6b114a9fcdcd081374e6cdbe81b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2f9258d28b8b2431ba519bed2bee81b6f814b479",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC6wrKzRk4pCaO8ggqKfLDHMN0Ro818HozBF3em+mcc/wIhAJVNWeTkDR+TahnkOypz/i9LOiDlhRwjYLEz+Dd6VEf5",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2MTAzZGQwMDMxOWUwNGI2YTEyNGNmZjQxMTAyNzRjYTYzY2YyMjZmYTBhZDNhMGU5ZjMyMzQ3M2U4OTMyMDM0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURYR0ZrYzg3R0kzWTBHZUk3NGlkYjJwQXMwSFFITitGU0ovakhRZmQ4ZDJBSWhBTFZCenQ1WkNLYzVtM2k2Wldaa1VkRUtjOGh3WFBua1lyT2tBMHJxYzZmTyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwcFowRjNTVUpCWjBsVlV5czRXRmRVVDFkTmNTczBVVWx1T1ZGSE5VZEdjRnBHUjJWRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTlJFbDVUbnBWTTFkb1kwNU5ha2w0VFVSTmVFMUVTWHBPZWxVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSVGxweVlucHZOR2N6VFZsaFlWSTJTRVIwVG5sWGQyeHhRVGRqVUcxa01ERlVkMDRLYkZncmEzcFJZblF5YWtjM1NteDBUVE5tYUU5bFZWSk9OMVpMTjNCNlJWWlBPRkJOTTNWUFlpczBlalpDT0dOdWVHRlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6U1c4M0NucFlOSFl2VWpKRk4wZERhRlY2WVROSWVYQm9ZVEZ6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5TmJWazFUV3BWTkZwRVNUUlphbWhwVFdwUmVrMVhTbWhPVkVVMVdXMVdhMDF0U214YVZHZDRDbGxxV20xUFJFVXdXV3BSTTA5VVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTVFtZHZja0puUlVWQlpGbzFRV2RSUTBKSU1FVmxkMEkxUVVoalFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFZMT1RNeFNXZEJRVUpCVFVGVFJFSkhRV2xGUVhoWWR6VUtTekJEVW1sbFoyeExiM3BvWlhkdlJVYzJVSHB4UlU1VVlsUnRUQ3QwT0dkME0wWXZZbEZuUTBsUlEyZDZNV1JtZEcxaFVVSldTMjExWVZWUVVpdFlSd3BES3pSNllUbHNWa0owYUdRd2VrUTRXa2xuZWpSRVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1d1FVUkNiVUZxUlVFemFXYzRVMmx0VTJsUlVqbGtaSGRSQ2tsRE5HOUhkelYxTUhoM01taEdSMkk0WkhGcWR6Sk1RMnBNUjFCVE1GTXhPVzlvVkRreWRTdGlaRVF3WkRKS2MwRnFSVUY1WWtrcmVGVjNjbmhxTUhvS1ZHYzRRbko1TkUxYVpYbHFMMUV5VlRKTmVITlFWVEZDT1hSS2RuaHhNbnB5TVVWc1JXWk9RM0pvUWt0elJFdHBUREpqY3dvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667183280,
          "logIndex": 6193968,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "2f9258d28b8b2431ba519bed2bee81b6f814b479",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3358116097",
      "sha": "2f9258d28b8b2431ba519bed2bee81b6f814b479"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

