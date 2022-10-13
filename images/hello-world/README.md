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
| `latest` | `sha256:3d6df6e7cfb65acefe9696b726bbcd0aa4f7d97ebe1891c9e291073d3b08474f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3d6df6e7cfb65acefe9696b726bbcd0aa4f7d97ebe1891c9e291073d3b08474f) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:3d6df6e7cfb65acefe9696b726bbcd0aa4f7d97ebe1891c9e291073d3b08474f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "82fc232b7f1d4d0ea523da4842bbecb6b3563320",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHpPbigR8KvWcVaFT+tRmzci/6uvVEHaHnfMC9x+NikIAiEA+G0fdvXfL7QS7o2oACkrcnfBVB8QstSAUD/HMJwbYqo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkYTBhN2U2ODNkMmUyN2YyMGNmMTRiOTc5MGM2Mzk4ZmI3NzEzMGYzM2ZiZmE5Y2I1MWE0MzA0MDM4MDhmYzhhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURaUG5qUWtyZ1JXbk9TUHoyam1XMmE0UWZ4SmZ0VFlOMzkwVEFta3RmUWNnSWhBTWdneFRLY2FzTHVXSnhXeHJ2cmVRZkR3NW5tQ0R6RmVWRGVJNWlsdWJxcSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVldXUkNkMnBNZWtnMlpIRXhObHBDTWpaTFdFMXFZbFJIY1hKWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFVjVUVlJKTlZkb1kwNU5ha2w0VFVSRmVrMUVSWHBOVkVrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYxUm5KUFZESXdPVmw2UlROdU1pdG5aM2d5ZVZKclQwdzVNVUppYUZremVFbENkQzhLWWl0WmMwVXZRblpEVFRrd1puWldVREZxWW1GbFJrVm9NSGxWVlZNclRGaHVkbWxqVWs0MWNrbFlkRXhvUjNBeFZqWlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZVG5oM0NsRlNNWFJqUVZWaE9FdENWMVYxTVN0TlJrNHdSMWR2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyYzBUVzFhYWsxcVRYbFphbVJ0VFZkUk1GcEVRbXhaVkZWNVRUSlNhRTVFWnpCTmJVcHBDbHBYVG1sT2JVbDZUbFJaZWsxNlNYZE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6ZzNkWEJaWjBGQlFWRkVRVVZqZDFKUlNXZ0tRVTF4TVRsMlEwcFhaMkU0T1dOQmNFUk9NVmRNU0RoQlNHMHlTbmxKUlc5MFoxaFVSVEJpVERObGJucEJhVUphYTNWa00zSnVlR0pxY2pKU2VWWlpNQXBST1daQ2RYaE9NMGRDS3pkUmQyWnZhbXBNUmk4eVJYaDJla0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJhQ3RrVWpsWVkySXhVbU5zQ2tGc01uTnRkalUxY2tJeFp5dHNkM0ozZUZkTmQxQmFNbmRHWXpRMGFHaHdRVTUyVkhobE9XSk5ZblZ2UTFGNU5qSnpWemxCYWtJcmJqTkRVa3hCUTNRS1RWbFdXSEphZW5oRU9VTnZkRmxWYTFCSFRVRnRaRWhSV2pneVVsaDZkMmxHZWs5b1lXZENLM2swTVdrMFVFMUhURzg0V0VSd1NUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665624098,
          "logIndex": 4996598,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "82fc232b7f1d4d0ea523da4842bbecb6b3563320",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3239014890",
      "sha": "82fc232b7f1d4d0ea523da4842bbecb6b3563320"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

