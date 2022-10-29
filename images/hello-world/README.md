# hello-world

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/hello-world/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/hello-world/actions/workflows/release.yaml)

Hello, world!

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/hello-world:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:c9139365f25f54e0184698449421d47c1737d5709d0d7f7e693bf36881077f15`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c9139365f25f54e0184698449421d47c1737d5709d0d7f7e693bf36881077f15) | `amd64` `arm64` `armv7` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/hello-world:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/hello-world:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/hello-world"
      },
      "image": {
        "docker-manifest-digest": "sha256:c9139365f25f54e0184698449421d47c1737d5709d0d7f7e693bf36881077f15"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "517e3d734dd742bcc6c897ac1569eb0ede006548",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCrHbaq8S8cSsrhqUCnLRgerA1/jQgfhqYwxBmJ5D3ctAIhAJCk6dWqJ2TJyX++Wk6SKk6NVPeXRis8PUlMak6UZ5Ko",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2YTkzNGI1NzJkNTRkN2M0MDEyM2NiYjg2MWNmYmY4NjRmYzU3MzNlZDQxZTUwMjNmNWQzYzViYTcxYTRiYTY2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURmL3hWZEVqbXg4bHdOSHNXd1VhMmh4b2d6UlJHZlYwNmllODJWQWFZUGZRSWdKN3d1QlBLeWtKQUVBbUxwcm80WG96ZlJoYStkTGk5Q2FGY251MTI2S0xRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlJrcERSSEEwTmpCdFVtRkVUMGhXWVhaMllsWmFSbWhCV2toWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RWTlJFVjNUbFJCZWxkb1kwNU5ha2w0VFVSSk5VMUVSWGhPVkVGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZOYkRJMVZFRm1lVGw2ZERWMFpFSlhRak5LVmpOa1QyOURZMlZ1VWxaM1lrbHZlWEFLV0V4MlowSnljSEZvYldoM05VNTVSWE1yWkVScVlVdFpSSHBrTkdWbmEyMURUMjQzYURSdVRqTnBZM1ZCTUVRME5uRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXUm1ObENuaGhUbWRYY25CQ1ZYZG1aMWh0TTA1clZUUkNTMGhqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3hUVlJrYkUweVVUTk5lbEpyV2tSak1FMXRTbXBaZWxwcVQwUnJNMWxYVFhoT1ZGazFDbHBYU1hkYVYxSnNUVVJCTWs1VVVUUk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFTkdSbFkyVVVGQlFWRkVRVVZqZDFKUlNXY0tXV1pYTUZkRmIxcHpZMFIyUlhKSU56azJWbEZST0VkNWRFOUZhQzlFU1ZaelFsaEJLMWh2TW5OVmIwTkpVVU1yZUhKd1prNW9MMjFqV2sxd1duTkNLd3A2U0hSUGNuQktkME5pT1Znd1NsWkRhMnBsYW0xRmR5OVNSRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJjMVk0WXpZemFqRXhZalZWQ25CelEyaHRZMFo2U25CMlNrUTRNVlJzVWs5SlVFcHJjazF1ZVVkeU5YbGtSakZJYzJGbWVWSXZVWFpGWWxSblVUaDJSRWRCYWtJd1NYUmFLMEoxUkZRS1RVOHZhRTVqVURCT2RtZHZUV0V3UXpoSWNtZGFUalJwU25kQmVXWm5UVnB3YW1KQ1ZXNU1ZVkVyTUhOMWRGRTBRVXgyVmpoMWJ6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667005511,
          "logIndex": 6073806,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "517e3d734dd742bcc6c897ac1569eb0ede006548",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3349494357",
      "sha": "517e3d734dd742bcc6c897ac1569eb0ede006548"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

