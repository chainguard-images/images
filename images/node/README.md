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
| `latest` | `sha256:f4555041a6ff4cf653029a4e19f00c77894f58ec151746f378a42bd25f2e4bb5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f4555041a6ff4cf653029a4e19f00c77894f58ec151746f378a42bd25f2e4bb5) | `amd64` |


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
        "docker-manifest-digest": "sha256:f4555041a6ff4cf653029a4e19f00c77894f58ec151746f378a42bd25f2e4bb5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d35cc64b8c82d58a2e70245d1a9933b7fe3d02b1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDn//eckw8hlnaTZ+w+bm74syr9XRrtsexcUmoABR2qFAiEA/gJTO0LyE5Pe/xKk+wNPcMzj+5UttGCzifLUWtbHCqM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2MWVhZTk1ZThlOWNlZTc0ZWQ1ZGZlNTFjYzUyMmEwZDg4OTA0NDU1ZjQ5NjBkZDIyMGZiZWM4MWExN2Q1NWNlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSFdTbHFwc04wUU5ELzAyeGY5RkRsQld6UWUwcXpDSG5vdkZ2Q0MweU5WMUFpQnE3VnMydmo5eDYwYW9Ld2IyNUQwMVJhU2kzKy8vN0E3UGZHQitscWliYWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsNVowRjNTVUpCWjBsVlNscDNVRVZTWmsxdVdsVTFSVmQxVG1SeE5WbDVjRGhaWmk5UmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlJFVjRUbnBKTUZkb1kwNU5ha2w0VFZSQmVFMUVSWGxPZWtrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVVyZDFWR0swMUlObmg2YnpRNWMzQnFMeXR1Vm1aRGVVVXpVRVJMYWtoME1HeGxRa1VLVjJOMFJsVlBkM1o1YVZaTWJtMXNZakJoS3paTVRXUTBNMGxqYTJwTk1uTk5VR3RGYUVSemVDOHJSbXBXZG5CMWFEWlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwZG1GdUNuSXZSV2w0YW1rMGJtaGxUV1pUYkV4YUwxUnBZazlaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwZFJlazVYVG1wT2FsSnBUMGROTkUxdFVURlBSMFY1V2xSamQwMXFVVEZhUkVab1QxUnJlazB5U1ROYWJWVjZDbHBFUVhsWmFrVjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XV3RIUTJselIwRlJVVUl4Ym10RFFrRkpSV1YzVWpWQlNHTkJaRkZFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVYZDNOM0ZJUVVGQlJVRjNRa2ROUlZGRFNVRnFVVFo0VHl0TU9VTnphemhWYVhSVWNHMEtiM294YzA5SVlYcFNVbEkwTm1sc2N6QXJjSFJsZDJKdlFXbEJURTRyYkdSRE1XMURSVll4Wnl0WE1reDRUelYxWVcxNUwwSnJOVXhJTDI5VlFuTlRiQXBXVDB0eU5rUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtNUJSRUpyUVdwQmFFWm1RME13Y2xBeVpUTm5hWFp0Y0RSbmVteFJhVmhzY2pOc1FtOU1MemhGQ25SMmFsVjVVMHBJYTIxbVZGRTViRGxXVjA1WVNsbDNSUzl6TkVaM2F6UkRUVWhSYzNOTlRXTjFiRFExTlVGWk5FaHVhbnBvVVVnMmNIZFhkWGxSVDNVS05IZExXbFYwUlhGTVpISmxSMjlYWmpsTmMzbHNhMEppYTBvNVFXVnFSbmwwZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667265447,
          "logIndex": 6261137,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "d35cc64b8c82d58a2e70245d1a9933b7fe3d02b1",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3365999889",
      "sha": "d35cc64b8c82d58a2e70245d1a9933b7fe3d02b1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

