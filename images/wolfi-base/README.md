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
| `latest` | `sha256:e26c890a7c9091f795865370de12a57287431536c4428e2a0470071317634648`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e26c890a7c9091f795865370de12a57287431536c4428e2a0470071317634648) | `amd64` |



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
        "docker-manifest-digest": "sha256:e26c890a7c9091f795865370de12a57287431536c4428e2a0470071317634648"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d3d1675df78026298a5320465010a551f3955ee8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCSxla4hRqY+u2Sl2r/WOfa/mf+tG7MracuoN3zdKSshgIhAOaUo1YagGZ/Zg5QfNrjAaMCYo7bgdTotAFZmbgBxJxR",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkOTJiNDQyZjI1ODI1YzM5OGUwNTlmNTY1Yzg0Njg2YWYxM2Y4YTMzY2VkOTljMjlmMmQ3Njk3OTQ2YmIwNWI0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSG1Od21OZVBrM21mRjUrc3lWb010bUlIbXhzSzBsSGs1K0V4U0IrS0pOUUFpQjZxTnV0dHNIeXBZMGRxMHBUMXFZaVhLM3RZSmVXclhaSkZaUkQ3R2pyQ3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVlJsZzBlWE4wTUZCTWVTOW5RbEphUW5vMGJVeEZVVUYxWW1oQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlJFVjZUMFJSTUZkb1kwNU5ha2w0VFZSQmVrMUVSVEJQUkZFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZtZWxWSlVtZDVlbVJ3UVdaMWNuRXhSREpHYTJsbFZGRTVUM1p0Ulcxc2JUbGxZMEVLY0dKMGN6Sm5VRkl3ZWxkM2R6UnRTMmcwVkhBNVptaGpSM0I2U2tOaVFVaERkbWgyT0VSblUwSkhjbEIzV21aR1ZHRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZOWVZsR0NsRnVhR1EzTUhoVWJ6SmtSMjE1YjNOSWVtRmphMGh2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxRjZXa1JGTWs1NlZtdGFhbU0wVFVSSk1rMXFhelJaVkZWNlRXcEJNRTVxVlhkTlZFSm9DazVVVlhoYWFrMDFUbFJXYkZwVVozZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZFM1NTOXNlRUZCUVVWQmQwSklUVVZWUTBsUlJFOEtWRkYwWmxZNVExRjVOVnA0WWpGaVpFRlVaRVEyWWtVMFdGZHJaalZGU0VaME5VeFNPQzlRWm1KUlNXZFdTamx5U1hGSFQzRTJhakl4ZDJKSVlVWnhTUXBrWm5OVFJITldVaXRNVWxaV00zQklNelpuUVM5NGMzZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hkUU5tOWFUSE4zUm1RMGFUZ3ZWRWwwQ2pWWVUzSmxVM0pzWmtwWVZIVlBTbUZVVmxwb2QwZFdjV2RKWVdWeU5FRkJRbVoyZVhGWk5sUXplRTlvVmxnNE0wRnFSVUYxSzBkWlFtZGtVVUVyUkcwS1ZrcFpOVzFZVkU5VlduUkNUR0p5WWtKV2VXOUNRelZ0UVU5Q1dHZHVVa1ZCZFVwc1NqRTFRM1V4UTFGcGJEVndkM3BYUXdvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667439529,
          "logIndex": 6394286,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "d3d1675df78026298a5320465010a551f3955ee8",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3382398147",
      "sha": "d3d1675df78026298a5320465010a551f3955ee8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

