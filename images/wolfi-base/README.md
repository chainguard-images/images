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
| `latest` | `sha256:ab8e650d77ae09fbe92ca9be3061e1460765e2af875784ce2ff59e44695ca65a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ab8e650d77ae09fbe92ca9be3061e1460765e2af875784ce2ff59e44695ca65a) | `amd64` |



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
        "docker-manifest-digest": "sha256:ab8e650d77ae09fbe92ca9be3061e1460765e2af875784ce2ff59e44695ca65a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7dbd4b677a382d81db3e221682f71822008aa475",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCnqHGEFsdLUbGs3pnxLX+tzDkaiQh3NC4LekIuAVW3UgIhAPlRQx6TZLMIzrIAHcehZZLl+iJKzutlev1CeEHXn9FO",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNzUxOTFkYmNkYTVmYzI4ZjIxYWZhYjUyOGNjMzNkZjI5YjNhYTRmY2EzYjFjZWQ2NGVhMTljMjQzZmU3MDU5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRGpGalp4ekZvS0U5UkpKYS9TeUtOMWZyb1ZNNXlEMEJhRUF4MytWVWpzSkFpRUEyVldSMXpWTmkrTG0rVTBiT0NmV2cxNmtJSU1RYjZQYWRDSnRwbnN5OHlFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwcFowRjNTVUpCWjBsVlptOHhOMFZZZGs1VlVpOTZVR1FyVFdJMVZEZ3daRVl3TUU5emQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRGTlJFVXhUMFJSZUZkb1kwNU5ha2w0VFVSRk1VMUVTWGRQUkZGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZoZERsWlpscHRSamR1V201bVNrWkdMemRyT0RjemIwWlVTSFF3V25ZM1puSnlRbGNLV21waE9YZG9abTVGVFhsYVREVlFRVEJ6TlhWclpVTlpkVGR3WTJsbFRXcHRkMWxLTjJZeE1IWTBUblUxTjFOVVIwdFBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV2VEV0SkNqRnJibGRXTkVVd1RWcEhTMFJRYlZwM2FqSkhXR2hSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJHUnJXVzFSTUZscVdUTk9Na1Y2VDBSS2EwOUVSbXRaYWs1c1RXcEplRTVxWjNsYWFtTjRDazlFU1hsTlJFRTBXVmRGTUU1NlZYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHJSME5wYzBkQlVWRkNNVzVyUTBKQlNVVmxkMUkxUVVoalFXUlJRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCYVdGZDBTRUZCUVVWQmQwSkhUVVZSUTBsR1prY0tRVmR3TTBvNWEySTNOa2hCZWpsUlJIcHdVVTlsVUZOaWJsVjVWWFkzV0Vwc1lWUXZlVU5wTkVGcFFXTllaazVCZEU5TFJtbDFkRGcyV2xkeGQwRjJaQW8zUjAxak1sYzRjMnd6T0M5S2NsWklNMWhTZFVSVVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dlFVUkNiRUZxUlVGd1RIWk5kVXBCUmpRMlJXMXVhVlJFQ2twd1RFOXlOMnhQZFc1WU5WbHBVVkY1VW5WaVkxUXpkVkZxZVhOV2RuY3Jka05SUVcxSU5sVk9TMGhUWTI0eE5FRnFRVzQxTmk4dlExcHJNMmN4WjFJS2RYUmhSRlZGYkZWU09XUXhhWGh5Y2tWUVlXcFFNVlV6V1RSRlVtRm5UVTFIWVdsdmNVZzBPR0p0YzA1MldrdEZiVnBqUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665799125,
          "logIndex": 5129347,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "7dbd4b677a382d81db3e221682f71822008aa475",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3254025268",
      "sha": "7dbd4b677a382d81db3e221682f71822008aa475"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

