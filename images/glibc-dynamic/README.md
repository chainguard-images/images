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
| `latest` | `sha256:10cb63e12f72d1fda3b0fb6ae2756d2d88ec6b881f16a73afe2ae93106ebad7c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:10cb63e12f72d1fda3b0fb6ae2756d2d88ec6b881f16a73afe2ae93106ebad7c) | `amd64` |



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
        "docker-manifest-digest": "sha256:10cb63e12f72d1fda3b0fb6ae2756d2d88ec6b881f16a73afe2ae93106ebad7c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "447ef53d2c6459f5735942b32fa4f98a46f4b148",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCSqOODAF1/deumjaKOfmQK3MlvjzTWhx59syp4+/p+pAIhALEu9zoNoPj1b6UrPiSAtvGcW5se2kjFC29sH7dRFOsD",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1NTBkZDlmODIzZDFiZGMzYTI4MGI2NmZkOTE2NDFiZjhiYmE2N2VhYmQ3OGUzNzExOWFkOTBlMjQ3MTVlMjYzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUM3RXg0S09wVGkydFhEQ2JOWHlmeFhFdllQVnFMR3Z3K2VGZzc3ZzkwcWtnSWhBTEd1dzZDQ1lXR2FpelRtRlBRM3oybDBRcWVPeHRSc245ZXJSRnRtZmwybyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvclowRjNTVUpCWjBsVlJGbDBNSGhaZFVWbE1FSjBSbXAzVlZsaVltOUdVMlp5TjBaRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhkTlJFa3dUV3BKZUZkb1kwNU5ha2w0VFVSRmQwMUVTVEZOYWtsNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVVyYWxwYU16UkljbXRGZEc5blJsVnBRamQ1Y2tOblFTdE5lVTkxTjBkelVVcHNTbTRLUlhCbmVrZHZhV1JDYmpWa1EzZFpkVFJtZVhFMmJ6SkJOVzk0ZWtwVlExTnJlV1JYUjFGMlJucEtaMDkxT1U1NVRuRlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTU0haVkNraE5OREpxVFVkaGJ6UmljbE56V25jcmEyVmpXSFpWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJSTUU0eVZtMU9WRTVyVFcxTk1rNUVWVFZhYWxVelRYcFZOVTVFU21sTmVrcHRDbGxVVW0xUFZHaG9Ua1JhYlU1SFNYaE9SR2QzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5RVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVHk5NFduQllRVUZCUlVGM1FrZ0tUVVZWUTBsUlEyVjJjWHBuTTJ4dFZGcFJiRk5xYmsxbmRtOURhVEJxY1RGTk0zSnBZVkZLVUV3NFQzaDRiRWRXV1VGSlowWjZkVXRCVG5wdFVtSlJjUW93ZFN0MVVXbHRhRzFrYkdNdlNVUkRTRVpZYkV4SldFUnJWVGh6T1dFd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFFVRjNXbEZKZDFvMFdFMWhVVE5EQ210TlFuSTRXVFkwYjNKNFlXRkRjaTh5Vm5SVGRVaHhkekl2VTIxSWJUbGFSa0Y2T0doSk9XcENWa3ByTm05S1dVMTBVVXhMZEhoUFFXcEZRWEpWTUZJS1N6VlpaV3d4V0d4YWJta3djM2REY1M5cVVraGljakJuYzNRNVVUTm1iV0ZCVWtsMWRTdFlRV3hVZERsSGVGUXpaSGcyU1RjMVEwTTVUbWRPQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665369745,
          "logIndex": 4788989,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "447ef53d2c6459f5735942b32fa4f98a46f4b148",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3216545346",
      "sha": "447ef53d2c6459f5735942b32fa4f98a46f4b148"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

