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
| `latest` | `sha256:f95abe1564280d5a8357c9151c846aa22a7b4b6643c888413d65d189f419eac7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f95abe1564280d5a8357c9151c846aa22a7b4b6643c888413d65d189f419eac7) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:f95abe1564280d5a8357c9151c846aa22a7b4b6643c888413d65d189f419eac7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b7b4d7e1ed25c3edd3eae78cdd159cebdc8e5f73",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDiwvGNSM+Ogje39gzdNdsECknncDug6BJ0BKSjmZltpAiEAwLbnLLWCtS8fzleiu71BSLBYx/m10hy/cjGNY+ecfWY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ZGY2ZmQxYzYxZGQ0YzhhZTg4YmYxMDY0OTAxZDE0NGU0Mzc3ZmFiY2VkNmQ2YmViNjg2YzNhOTczYWI5MzVjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQWlLQ3NEcllpM3Zqd210RWFRa2J1Y3MyQUtuRWJxZGxXMXVWMjBVWVVaT0FpQWZxRTJiNm9GNHh3Rmt4dnB1aVJHKzloRDJmNm1PTEpPdHQrNllvNnFXRWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVlJYZEdLMmhEYkdabVVHeDJjV2N3Tm5OSU5EZGlibTFWVnpJNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFVjVUWHBSZWxkb1kwNU5ha2w0VFVSRk5VMUVSWHBOZWxGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZpWkZjd2JpdGpORlpQYTJGRGRtbFJPRFpTS3l0TFlVZFlSRzlWUlVaQkwwdzVkRk1LTW1WMFprRnZNbWhxVDJsck9WSTNOVk5FVXpJMFZVYzRjVXRRU1RJeFpVaG1lVVlyVjBkbVEzZEZjR3AxWjNCbVUzRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4U2xZdkNtMVdaVTV1VkU1R1dGVjNWbU5WZGpsNlptcFJkMmswZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHBUakpKTUZwRVpHeE5WMVpyVFdwV2FrMHlWbXRhUkU1c1dWZFZNMDlIVG10YVJFVXhDazlYVG14WmJWSnFUMGRWTVZwcVkzcE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p5c3pWekYwWTBGQlFWRkVRVVZaZDFKQlNXY0tWMGhST0hOQ1ZuQk5RMlZrUmpOSVNXVmpkbEJTUjNkdWRDdEVkalZJVFdRd05GcHhlazlwZGpWVFdVTkpSeXR3U21rck9IaHhUMVJyWVU5UmVVNUdPQXBHYTFadk1raENZazh5ZWtOTGVURk9lRVp5ZWt3d09ITk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlJscE1SR2N2ZEhCUE5UbEJWelZFQ2t0MGVGVkVNelp3VlUwNFFWQnhhak5KYkdKV1dGZExjM0ptZEVWd2VGaFhiR0ZqVGxSS05rdGxSV1ZsUjJkNmVqQlJTWGhCU1hSb2FrOURjMnBvZUZFS1UyZFpZbFpaUTFsS1FUQm9VM0pSUlROallYVmtZWE5tZFZkTFJVZElWa1ZxYURSeVdtWXpSREJHZWpsNE9WVnRURVlyZGsxUlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666142639,
          "logIndex": 5399326,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "b7b4d7e1ed25c3edd3eae78cdd159cebdc8e5f73",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3278119123",
      "sha": "b7b4d7e1ed25c3edd3eae78cdd159cebdc8e5f73"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

