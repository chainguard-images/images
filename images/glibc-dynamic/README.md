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
| `latest` | `sha256:7149753e4bc2792802280188a282c089f8f746ec8d0c61146360a8af5b1824df`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7149753e4bc2792802280188a282c089f8f746ec8d0c61146360a8af5b1824df) | `amd64` |



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
        "docker-manifest-digest": "sha256:7149753e4bc2792802280188a282c089f8f746ec8d0c61146360a8af5b1824df"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9adb0cbaef930753682cc24e0961acba3b07554b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIA5Tuzjt+zKdPTattaeXwa+YXHFRM+v8VIuzjMiBelb5AiEA6yc+6mhNWGKB9U3kKWrnzAOz3GgAUM7iiQZWkUBuheg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3ZWUxOWU1NDI5NGQzZWZiM2I4NjMwYTc0NDUwYzBjM2YwNTFmMWQ2YTQwMmU5MmI5MTkzMTdjOTM2ZWI3YjE4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRVIrRnlXSDlzdCtyWlY3TnM1a0Y5dXJ1Vlhxckh1ZlpJemMwaWlmejd1T0FpQWhKVW5YTE5YSWd3cktHL05IQnVwb0JGalBuQ0Q1WVdEZ2dBa3lPTDhudVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFha05EUVRCRFowRjNTVUpCWjBsVldqazFOSEF2VEN0S2FGQm1ZbnB2SzNSV1ZVSnFRVzFFVlZkamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RGTlJFa3hUVVJSZWxkb1kwNU5ha2w0VFVSSk1VMUVUWGROUkZGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZpZDA1Nk5WTlVZbk5ZWkRCdEszTXJRa05PVWxSUmNsSnRTVGRhYVd0MFUyWmFRa1lLUW0xc2VXaEdPR0pGTjJOS2VWUTBSak5yYW1WNk5DdGpSVTVCYm5RdmNrcHlaVTA1UlRscE1qazVOSHBKYmxaM2JXRlBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU0TlRkSUNsZERTV05VU1dsck9YSXpabEZ0WjBWcmVVaHFlWE4zZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJzYUZwSFNYZFpNa3BvV2xkWk5VMTZRVE5PVkUweVQwUkthbGw2U1RCYVZFRTFDazVxUm1oWk1rcG9UVEpKZDA1NlZURk9SMGwzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNRVWxaU2t4M1MwWk1MMkZGV0ZJd1YzTnVhRXA0UmxwNGFYTkdhak5FVDA1S2REVnlkMmxDYWxwMlkyZEJRVUZaVVU1RVMyUkVRVUZCUlVGM1Fra0tUVVZaUTBsUlJEWjZUR2hHWTJkSk9USmpTVTlIYkUxUFRHOTVNM0JLVVhGcGR6RjNibE12UzFRMk5teHJXbGR1ZEZGSmFFRlFaVWN6T1ZBMFZGRk9SZ28yTml0Mk1YUlpZV2RNVjBOdWFGRkdTbUZuYmt4TlZFbHNiMUJNUlRCaFIwMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tZEJUVWRWUTAxSWQyVk1RblZXQ2paek1ISXpPVmhXYTNOS1JtdENWeTkyU25FeFVXOTFNR3RQZHpoM1lYcEdUVmR1V1RBek1HUjZjalZXZG1oelQxUjFaRkYwU1VneWMyZEplRUZQWldVS1pHVnpURTlyTkZKNlZqWjBZVGQ2YVhSVWVreG5URmN5TlUxQk4wcDJVR0pGV2xFMFFsVXhVblkzZFdGVk0xZGhVWFE0VVZWa1JIUjJPR0o1YzBFOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1666666249,
          "logIndex": 5807375,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "9adb0cbaef930753682cc24e0961acba3b07554b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317808413",
      "sha": "9adb0cbaef930753682cc24e0961acba3b07554b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

