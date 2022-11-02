# node

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/node/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/node/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/node:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:49da66b07c25d44bf8795a4d4b5973f0d36f5af1a9453d3cc8882ab1d28c3587`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:49da66b07c25d44bf8795a4d4b5973f0d36f5af1a9453d3cc8882ab1d28c3587) | `amd64` |


## Usage

Minimal container image for running NodeJS apps


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/node:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/node:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/node"
      },
      "image": {
        "docker-manifest-digest": "sha256:49da66b07c25d44bf8795a4d4b5973f0d36f5af1a9453d3cc8882ab1d28c3587"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5d5417c654d7b11fc033ad768df3bcfaeda4108c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDqRa8m6HYf2reedHvJAFGVNwOeSJ8hiuYMaHX3YD0tNQIgE9TzwxpJWBzKrV+maLWM3pjpT2ufhZOQSvN+j3Uhvyo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwNWZmNjc3MjIyZWE5ZTBhZTg2M2IzMGU5YzkzNmZlNjRiZDVmMDI2Y2QxMmQ1Y2M4OGYzNGM2NTI0ODg3ODA1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUM0dWhJQnhGY3RheXdEdWlNTXVxNnZUSHZRdVNtS3doVjJ6Wm5lQmZOU3ZnSWdRQWtheWU5SlJxZEF6ekg1azdKa25QZ2JvUldPUVVSS0M4Kzl3OVhBZ2R3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhreVowRjNTVUpCWjBsVlJGTXdURGhIWld3cmFTOTZUMjlXUmpZMmEyOTZSbGhxU1VRMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlJFVjRUVVJGZWxkb1kwNU5ha2w0VFZSQmVVMUVSWGxOUkVWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZST1N0RmFqaHhLMWQ0TkhGS05WSnNZVWR3Vm1ab01TdERaemRpY1VrMU5tZFdZMFlLVDFKdGFtVllZaXRpUTJJelRtcHRjMWRIYUN0dGJYQk5SRXRQY0V0TmRXazVXRkpzUmpOcWJYZFVjMUJyVjNCcGQzRlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyTm1GNUNtNHlNRTlEWjJoaVdFaE1OR3B2YjBwYVRUZHZaRFYzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUldhMDVVVVhoT01rMHlUbFJTYTA0eVNYaE5WMXBxVFVSTmVsbFhVVE5PYW1ocldtcE9hVmt5V21oYVYxSm9DazVFUlhkUFIwMTNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVURTBORkpWUVVGQlJVRjNRa2hOUlZWRFNWRkVWMHN6ZUhCTGFGcDViMnBPWkV4dU1HMEtRM3AzTVhVeU4xaHhTRlpZUVRWR1JEbGFSbmR2T1RRM1FYZEpaMU5vYTFReFNsRndiVWRXTUc5R1RucGFRVUZwVVV0MlF5dEVSak53VFVKVGNUaElWQW8zVlVWaVluZFJkME5uV1VsTGIxcEplbW93UlVGM1RVUmhRVUYzV2xGSmQyWTFjV0V4SzBGS1NXSXpiSEZaUVdsSmVDOXdka2wyTTIxSllVTm1TRGwyQ25oQ2JETmFOSHBXVDJjMVoydGtiRmt6VFVjMGVXMURla1JGZWtSTFRsZENRV3BGUVdreGRrNHhXbEZXZVc4dlJraDJVRVJCYldGRGJUZElibFZZVjNFS1pGQkhReTlPU20xMlJVeFFRVXR1Wkdsa1ZVMUtVRm9yTnk4eE0xZzRPVFJYTld0ekNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667351417,
          "logIndex": 6324283,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "5d5417c654d7b11fc033ad768df3bcfaeda4108c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3374094559",
      "sha": "5d5417c654d7b11fc033ad768df3bcfaeda4108c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

