# wolfi-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/wolfi-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/wolfi-base/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wolfi-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:1835c6ec29653af2223dc9600ad82122751b5ff9d5891d73d06584f2a5ed29a5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1835c6ec29653af2223dc9600ad82122751b5ff9d5891d73d06584f2a5ed29a5) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/wolfi-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/wolfi-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/wolfi-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:1835c6ec29653af2223dc9600ad82122751b5ff9d5891d73d06584f2a5ed29a5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ba01e16004cab071f601525e414bfe2831a5dd16",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDosdVwQnZ3KGEUgWn0KSoFKBxcltcrEGuLcHv3Xp0zPwIgFIJJHS1zb0F3Gb4Xg3P+3dO1bbzCMXJ60oVQd/IK5HI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwODM3ZDgxZDJmMTNhYjQzMjE0OTlkMDNjMDBmY2Y1Mzc5ODk0NGNjMjYwNTFhYWEwZjg2YzkyNTZiZmEzOWU5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURGT01kZG14emVPMGt1NkZsYWplUUZDYStVUDZ2MTZTNmxZaFhPb2xzODZ3SWdCdXdrNjJJY1ZseGM5RTFHUTEreU5iNlJuVzcxblFrVFVScnJhUytBQTdjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwdFowRjNTVUpCWjBsVlZrMHZUUzgxZFd0WGJIZDJTMVpyUzBGRmNXSlVlQ3RxTnl0VmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RKTlJFVXdUa1JSTlZkb1kwNU5ha2w0VFVSSk1rMUVSVEZPUkZFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZGZVdOUGJrMVBXRkZZUWtwa04yc3pOVEZXTDJSNFJIZDBaV3RKVVU1bVozUlFWV1lLUWpSRmJuTm9Na1pqVEN0NlNuQnhNMFJ1WVhSSlpFTkxiMjlDT0VGS1RFNWxkMDR3ZFVwQ01UZHVMMU5EZGtoRk1YRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXTkZCWENuWkNiRzlFTUV0a1UzcE1UMnRTWlhCWFVEWjBRbU5WZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIwcG9UVVJHYkUxVVdYZE5SRkpxV1ZkSmQwNTZSbTFPYWtGNFRsUkpNVnBVVVhoT1IwcHRDbHBVU1RSTmVrWm9UbGRTYTAxVVdYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZGU09YRXlZVUZCUVVWQmQwSklUVVZWUTBsUlEwTUtlall5WVdKUFZEWkpablZoVjJwdkt6ZzFVMjlwUnpOWlNsQnFVbHA0U1RCdldHVnlTRGxtY0VoM1NXZFhNVGRpYTJwdloyTTRaWG81UlV0eGQxWTFhZ28xU0Rkd1FXeHpTMFJNUzI5b1IxQlpNM2h3YmxKak1IZERaMWxKUzI5YVNYcHFNRVZCZDAxRVduZEJkMXBCU1hkamFYSnZlRmMzV0RGV1ExQkxSMWR5Q2tWSk16Qm1aemRvT0N0bFNHbDJlVk5tWTFJNFRWSm9WMkV4TUdOTU0wdEZNR3hpWVZaR2RsQlRTRE5XVTNWcWQwRnFRV3hLVURGU05YUjNOVzg0ZW1vS05YY3hjMnBqY1dKNlJuaHlZeXRIVFM5R1VuUlJUblpaT1ZWWFdGTkRlRXhHSzJaWFdsRmlUWGx0YTFWb2NuTmhNSE52UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666748695,
          "logIndex": 5873245,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "ba01e16004cab071f601525e414bfe2831a5dd16",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3325570085",
      "sha": "ba01e16004cab071f601525e414bfe2831a5dd16"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

