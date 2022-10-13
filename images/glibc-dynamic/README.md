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
| `latest` | `sha256:bdacfb9e5f36474e00748963871ee210b7c940f8aa4a3fdc4cf8a8acab580333`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bdacfb9e5f36474e00748963871ee210b7c940f8aa4a3fdc4cf8a8acab580333) | `amd64` |



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
        "docker-manifest-digest": "sha256:bdacfb9e5f36474e00748963871ee210b7c940f8aa4a3fdc4cf8a8acab580333"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "2d6c160acc7c27f329da51e90cd6ba0e1d04ff51",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICo7yuo85v88MSgEus/zwe/UBbqG8OoSVsAsIBsB7sdjAiEA1Y48JVy5hRq0NIp8vDJP6MN0GxMaV7UY+i8idRW4As0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmZWZjMTAzY2JiYmU1YzAyNTdjMDNjYWEwYzZjYTJmNGIzOGRkOTgyMmM1YTc4ZmU4ZTJlMDRlMmU4ZWQ5OTg3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURJZEFOZ1pSOEFhL245TUtvTDdTa2ZNUi9VeGtTTHROM1BydnRvT3pwWmNBSWdRWmJnZkNoSDlLc3BvTVlxNE1NUFVmbDhxa0grbkhndi9Zamd0RHJTOC9vPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlVqWm5WVEpDWTNWT016bGlVRFExWTNaTFFuZG5UVGxzVVNzd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlZHdDRUV3BGZVZkb1kwNU5ha2w0VFVSRmVrMVVhM2xOYWtWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2UlhjMlRVUTFOWEpTVXpCMVRTdFFXVEp5YmpOTEsydDFkMUpZWnk5RVRVcG1iMVlLUVhOM2NtRTNNMFJHTlZNM05IaEhhMU5vZFZoNGFUbGxSVXBoU2tWSk1WRTVhRFpDWlhsbk5IQmliWHBRV25Wb1J6WlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZQVEhkeENrTnhlR3RHT0hwSlptRmtPSFowVlZkQk1HSk5PV0l3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDU1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUWtoQ01RcGpNbWQzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5TmJWRXlXWHBGTWsxSFJtcFplbVJxVFdwa2JVMTZTVFZhUjBVeFRWZFZOVTFIVG10T2JVcG9DazFIVlhoYVJFRXdXbTFaTVUxVVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUYwUW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUWpscVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1WWtkc2FWbDVNV3RsVnpWb1lsZHNhazFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6bE1RelUxYjBGQlFWRkVRVVZqZDFKUlNXZ0tRVTR5V2tkUGFtSjRVWE5VWW5CcVFWTXhSbU5oYjJodWEzUjNNRmhHYkM5RVoxbFVZbkEzVG5obGQzaEJhVUpwTWxCMVFsbEdVQzlDWjBkbFNFRnNjQXB1U1ZWbVozTkNWakZ5VW5wd1FsTm9ha1U0YjFBeGFsVllSRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJNMjFvWjFobldHbEdkbXd6Q2taSFNXMDRXakkwVERjeFEybDJkbXgyTUhScGR6UnhZM1F4YzJkSE16TlVZM2wzTlhCSmRWQm1ZVVp4YUZwVVYzSlpjbVJCYWtKWVFVaHZhVEZ3TDJNS01qUklWbFYxWWxKVk1YTlJPV3Q1UWs1RU9EaFNUa3h1VkZwNmJIVmxjbUZXV0ZZNVRHUjBialJoTVhSTVdtWnFaMHBUTXpCbmF6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665688336,
          "logIndex": 5045608,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "2d6c160acc7c27f329da51e90cd6ba0e1d04ff51",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245024838",
      "sha": "2d6c160acc7c27f329da51e90cd6ba0e1d04ff51"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

