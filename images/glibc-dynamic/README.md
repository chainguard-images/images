# glibc-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/glibc-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/glibc-dynamic/actions/workflows/release.yaml)

Base image with just enough to run arbitrary glibc binaries.<br/><br/>This image is meant to be used as just a base image only. It does not contain any programs that can be run, other than `/sbin/ldconfig`.<br/><br/>You must bring your own artifacts to use this image, e.g. with a Docker multi-stage build. If you want locale support other than `C.UTF-8`, you must bring your own locale data as well. This may change in the future based on user feedback.<br/><br/>See also [musl-dynamic](https://github.com/chainguard-images/musl-dynamic) which is an equivalent image for running dynamically-linked musl binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/glibc-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:12e100e273070a9efe9b969d5dff406e871677bf2b3079136d9ac2877fbf4986`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:12e100e273070a9efe9b969d5dff406e871677bf2b3079136d9ac2877fbf4986) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/glibc-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/glibc-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/glibc-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:12e100e273070a9efe9b969d5dff406e871677bf2b3079136d9ac2877fbf4986"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "8fa4ea81a482c84777473087a7e1d81f91e4820e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCTIgHE5yMmLR52BN2vIzsQFh82bjn+sgTQBAGPAIN0qQIhANTcrq/MV6uxdFcNa8EzxufLBXjNoMdOcU+aAnXmbAtq",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZjk5NWZiZWIzYjdlY2U4NGNiNzVjZDQ5MzQzZGI2MWU3OWQ2ZDExMDc5ZGQ5NzE0MmExNzNhNmRkNjhhN2U1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ2Y2QmNvaU92VXNTaEwwdGxFMXRUQzMrdzdTVDhiWDFtdjlrR3lHdkRvYkFpRUE0TCtYRHFkRk1JQzRDRGEyaGVLV3llaWtkS29LZm85RS9UbWh5T0NXcEZBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVlVqbHdUbkJFVTB4TGNIVmFTMDVPWTJGUWVDc3djbkpSTkROemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRCTlJFbDVUWHBOTUZkb1kwNU5ha2w0VFZSQk1FMUVTWHBOZWswd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzUkc5WE9HZENlVmhEWXpRd1VuZERaazByVXk5RWRuTnFNRTluYkRGMU1GVmtka29LYzFoWlptdFRUbnBwZG01dWJreHBZbTVoVUVGd1YxRTNNR2hvZVZkd1NreFVZblF5S3pKVGJEUjRTVnBMZGxWd05EWlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV2Y200MkNuZExOMlZMUlRCYVlYVkNhVGhvU25sMVoydExTMm80ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJvYlZsVVVteFpWR2Q0V1ZSUk5FMXRUVFJPUkdNelRucFJNMDE2UVRST01rVXpDbHBVUm10UFJFWnRUMVJHYkU1RVozbE5SMVYzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5SR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVWtGak1sQXJRVUZCUlVGM1FrZ0tUVVZWUTBsRlRrdDZiRUpvUjJvNFZ6VjZRVGxLVkhkc2RESmtOa2hpVkdsUU5UWmFZamR2ZFVkQk5WWnpVMFJTUVdsRlFUVXlaVE5WTTJkc1YwWkVPQW95V0cxbWVVUlFaVXhDVVVSR1FWUjZSRGd4ZURKUmVFaHVNa2x6TlhWWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZDFwUU5FZFFXR3RRQ25KeUsyb3JibUZTTTJSaFJtdzNORUZTV0RGTUszUTNXRlJ6UW1vMWEzRjRZMjk0TVRaRksyWlVSMGhyYTIxVFZVdE1LelUxY0Zvd1FXcEZRWGhwTDNvS1RrMTZUalpZV0hwVVJGaGFkbmhRWjI0M2QwOWpWMU5FVDBaTlRFNUJPRGxpWWpWVFdqZEtiMk5TTTFoNVYyVTRWRzVZYVhKV01IWnRLekU0Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667528618,
          "logIndex": 6462151,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "8fa4ea81a482c84777473087a7e1d81f91e4820e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3390765861",
      "sha": "8fa4ea81a482c84777473087a7e1d81f91e4820e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

