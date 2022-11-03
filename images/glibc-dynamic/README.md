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
| `latest` | `sha256:508c527f1bfa63ed7b3aac2341bda4049d47d8850d742e0c6587462031ac5879`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:508c527f1bfa63ed7b3aac2341bda4049d47d8850d742e0c6587462031ac5879) | `amd64` |



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
        "docker-manifest-digest": "sha256:508c527f1bfa63ed7b3aac2341bda4049d47d8850d742e0c6587462031ac5879"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9abf3f5121f3b49fb8d3bf07aacc33eda5b9fbc9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCIRWE77cIXiwOQWXRcByntDaXmSLZVqHJ1svG/wQwfJgIgJ6Xqce452tq/k9u/KFYtsbI+xrpV0BV0dcobVxyItXg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmMTcxYjhkOWFhMDAzYWNlN2I3NjUxZWIzMTVkMDQzOGI3OWZmYTNjNzY5YTU5NWI3YzU2OWFhZmY3NjE4YjcwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQnJZaGJ1WWlZRGY3TTBSN2J4SVViK250VE9NY2JYSWNKTHFvWnlMU0VQZ0FpQVpXUWsrMitpRHlXRHpRUmZLbml0d1ZVTkl4bXAwbWZrQVVHZXdGNVJUVnc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFha05EUVhvclowRjNTVUpCWjBsVlFXUnVRbmRoVUcxd0syYzROWEp0VlhjeVlrNHlVRXBPYmtvMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlJFbDRUa1JSTTFkb1kwNU5ha2w0VFZSQmVrMUVTWGxPUkZFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxY3pjMmN6WlZjbU5OY0hsRVZqSkJXVlpTYkdSVFMyeElNalJxZDFoU1dXZ3dPV0lLVW1kWU0xTnhjRXRaU1RseldsQlpTRmhLVkd0UmR6SkRUek5ETTJaemExaHBVVmxxUlRCVVVWcGtaMjl4VVVFM1F6WlBRMEZzTkhkblowcGhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZuVVRSQkNpc3ZaR2xOWlZvMFFVaHdhbTlCTlVkclVHNVlUMnRGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJzYUZsdFdYcGFhbFY0VFdwR2JVMHlTVEJQVjFwcFQwZFJlbGx0V1hkT01rWm9DbGt5VFhwTk1sWnJXVlJXYVU5WFdtbFplbXQzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldXOUhRMmx6UjBGUlVVSXhibXREUWtGSlJXWkJValpCU0dkQkNtUm5SR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVVRkU1VIb3JRVUZCUlVGM1FrZ0tUVVZWUTBsUlJEaHZaM2wwYWtrNVJGSmpRVmRJYlhOaVpuSXdUSGxVTDI0dllXdFZNMk5QU210c2JrUkpjVGh1YjBGSlowMVFWVnBwVTAxMWIwVkdlZ3BtUkROS2FGQlZXVWMxTTBVellrUXhWemhWYkRCM2FXZHlSRll3U2tnMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFVSaFVVRjNXbWRKZUVGTU5FVm5kM3A0Q25Ca1ZXSkVlbGt3WVdrMFVGQk9jSGMzY0d0WlVXbEdjSFV5WWxWSloyd3JORmd4WmxoQlEycGlXRFpOY1hKWVEzSnlaa295S3k5bVUyZEplRUZPTVhJS2NYSTNNak0zTW05eFV6WnJSbEVyTVhaa1dYTm1LMDV3YlM5dlJVUlJXRE54T1VoQ1RteE9ia2NyVldzNFYyZE9TR1p1U2t0QlFqYzBSMFI1Y0ZFOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1667441690,
          "logIndex": 6396068,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "9abf3f5121f3b49fb8d3bf07aacc33eda5b9fbc9",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3382531388",
      "sha": "9abf3f5121f3b49fb8d3bf07aacc33eda5b9fbc9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

