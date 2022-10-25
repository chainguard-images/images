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
| `latest` | `sha256:bf3f15e2ae2f312176b7f89dc69cbeac76f24246a73e9718632a70db96bfd622`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bf3f15e2ae2f312176b7f89dc69cbeac76f24246a73e9718632a70db96bfd622) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:bf3f15e2ae2f312176b7f89dc69cbeac76f24246a73e9718632a70db96bfd622"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1993500afff9563493868d32d70b96c0556ce3e8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCX5JGNVnZZQ9e1jTnqqCdeXr1LL5Wkg+dPMYa7TYI8bgIhALB2hXolgCaxam/SUumPkR9Zv4BnIrYfS0BKk1M6zdhx",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlMzAzZWU5YWY5ZGRmMDdhN2I5MmQwYTllNzk3NDQxNDFiMTAzNDA1NzI1NTkxNjE4NjIzOWQ1YWI1ODZlMmMzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ2hWMzVsZXAzZ28yL0lzclFoUHpSSXFDa1dDcmxUWStZVFdFcHVJZFBPQkFpRUE4Tm9uMHpBc2JhVjllOFd4RStKNWxkQU0zQkhCR2tYbXdmWmNsTUNqT0ZZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwMVowRjNTVUpCWjBsVlRGRmlVbWsyYm0wNWVtNWxTa1JVYTJ3d1dXVlJSVFV4UmpoRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RGTlJFVjVUMVJGTUZkb1kwNU5ha2w0VFVSSk1VMUVSWHBQVkVVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ5VjJGRFExbDVTRUo0VDFwNVZrRm1WWGRWU3paeFpGcEJNVVZYYjB3MGRXMVVaazBLTTNWNVNUaFhRMUl3VEdSVVlrZHpiemw0VVZneFUyMUVkeXRTYUZsWk1WWkJkRk5RUkU5NVprNTZVemcyVGtjdlRVdFBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyTDBKaENtZFBOMGw2UlVwWVZEQk1UbkZMVG10WWVWVnZNMFZqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDRUMVJyZWs1VVFYZFpWMXB0V21wck1VNXFUVEJQVkUwMFRtcG9hMDE2U210T2VrSnBDazlVV21wTlJGVXhUbTFPYkUweVZUUk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFRjZRMFJpTkVGQlFWRkVRVVZqZDFKUlNXZ0tRVTR3TUZwb1JuRjBNVlJsWm05dE1YcERjWEUzS3l0R1JIaG9ZMmhEYVROMmJsZEZkMGxLY2t4RE4zbEJhVUpZWlZFd1FqbHVTbVpUWlRNellsSlVZd3BvZDFCS04ySkRNVmhNUmpBMEsyUlNTVzFyUTFKR2JEaFVWRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9jRUZFUW0xQmFrVkJkalZ5UWk4M2JWbDRObFpRQ2xkNFVrVk5Vek0zTTFWVWJFOUZTRVZyYVU1dGNrVlBLMFJoWlVGYWNHUXhaMU4yYnpNMGFucFRSVU5QWXpGNFVuWnhORFpCYWtWQk5uRlBhM0JSUzBVS1dFOWxORGh1Y1V4S2JWTjVZbmN5WmtWdEszbFFZVGRuTDNKM05XNHZLMFZVY2t0b2NraFlXbkpDZG01bmVIVkhRVmRJUjJGTWR6SUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666661369,
          "logIndex": 5803438,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "1993500afff9563493868d32d70b96c0556ce3e8",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317481123",
      "sha": "1993500afff9563493868d32d70b96c0556ce3e8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

