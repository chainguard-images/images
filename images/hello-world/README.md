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
| `latest` | `sha256:d6608c89ef4e92d8622c7cecd2301e63722d155405c4d8c374085bd2ef08a443`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d6608c89ef4e92d8622c7cecd2301e63722d155405c4d8c374085bd2ef08a443) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:d6608c89ef4e92d8622c7cecd2301e63722d155405c4d8c374085bd2ef08a443"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6e519261c9167032cfa05e63702c44caa88f8051",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIB5Nawn/e3+sdXdj/iA0AmVk6UJaXROECzBFxZZ8R7JFAiBJQziLOxyXUB4BVcDb4lp2e7U3xz11YIMh4XAYgIjygg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiN2UyYThiYTkyNGNkNjFiMjk5YTU5N2MzMzE1MzNlZGJjMGRmOGIyY2MxMjNjYzE3MGVjNjIxN2IxOTgwYjhmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNZY2d5ck5RVlBoL1U2d3ViZGpZa2xSS1BkSFlncHlscFU4S3F0ZGxqU1pnSWdLQlllNmREODgvZ01WTTJrSTdmSUxqb2QrdnQ2dWJJM21qMEZ0alIxTzdjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwMVowRjNTVUpCWjBsVlUwSlBNR2xIZVVGMlRVUXhRMm80VlVJeWJqWnpValpuZVZBNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRCTlJFVjNUbXBOZVZkb1kwNU5ha2w0VFZSRk1FMUVSWGhPYWsxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZVVEZOQmNFNTJXR1ZRTlhOcmVEVTVObTlKWTFKd1drNW5USEpyVm5SVVdGQlZNVUlLTHpkak5tYzBibmhsYVZwclFuZzViVWczWm5GS2VuUTRhMXB3UlhGTmQwOVFVRFIxYkZreVpHbElPRGh1YVVreWVHRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ4WnpONUNtTmpObGRZV1VsNGNYSlVkbTVHYjJoaFQyTjJNVXgzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3lXbFJWZUU5VVNUSk5WMDAxVFZSWk0wMUVUWGxaTWxwb1RVUldiRTVxVFROTlJFcHFDazVFVW1wWlYwVTBUMGRaTkUxRVZYaE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFaFBjMlJVWjBGQlFWRkVRVVZqZDFKUlNXY0tVVEJFZVd4UFpVOVJZbkZCV0VodFoxbEplV0o1YzFSVFRYaFNMMG80T0dkb01HSkpRVGt3V21kbE9FTkpVVVJxVGpJdmFtY3pZVkJYYTJab04yWnRVZ28xZVROR1RuVjJVRmg0VjBaQ1Rpc3JNMGxTZUVvclF6ZFlWRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9ia0ZFUW10QmFrRlZVME5qY0ZwaEwyWTROV1ZJQ2paQ1RYbFpVMHdyVFdORlVsRnBaalZNZFVoMVMzVTFaVmhFU0VoQ1NFUk9NM1ZQV1cxbFYydDRlRkI0Y2tsdlVGRnJiME5OUW1kelMwcHNVREJGWkVvS0sxZFNhR3RFYkRKemNFNHJkMlYyWkRCMlFUZENVVXhNT1ZsSWRIcDBlVmh0YmxwbVEwSnBja3QyYm5aTVlUQnFkREJYZGtSQlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668388005,
          "logIndex": 7022320,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "6e519261c9167032cfa05e63702c44caa88f8051",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3457732084",
      "sha": "6e519261c9167032cfa05e63702c44caa88f8051"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

