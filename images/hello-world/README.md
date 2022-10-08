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
| `latest` | `sha256:6d2aec6f342171d68a201f633a48c4a24df2aa604ee047845ddd8bcc37fa99d4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6d2aec6f342171d68a201f633a48c4a24df2aa604ee047845ddd8bcc37fa99d4) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:6d2aec6f342171d68a201f633a48c4a24df2aa604ee047845ddd8bcc37fa99d4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "028132776418489ab99245f64f9459ef319e20f7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDfemzDgIrCUmjVgunABT0/hNFOBCoREZWwuj3ucZaE5AIgZtx9+krxuW1AAjCa/GK7dNRNo1vlqWeFpZNZfsHhclI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNGEzODNhZmFkMzZlZWY5YjhkYTEwZTAyMzM4Y2U0NzIyNWIzZmFkMmE4Y2Y0MmQxNzdjNzg3OGFjZTkzZjQ5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURkL0p3NzRKVFBpUVpFSVYzUUJIRjdWSVEvMjJiMHdwakZGYU11RENsZURnSWhBTnpHdWkyb1NlQmZVYnZZWmxYd0g1Y3lMVkRjWnV4UlZNMnB1VmRveWNrNyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVlpuaGxUQzl6YVZsMGJrczFORkZ5V2pKcWJYaHJRa2xIZG5CVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRSTlJFVjRUV3BGTlZkb1kwNU5ha2w0VFVSQk5FMUVSWGxOYWtVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaV0dKVVRVcDFaa2xGYlZOUmNWcGxRMmRhT0RsMVZFZDVlSEZZWm1SUGQybzRWR2tLVlRJcmNuTkxVMDF5WWxOdVRWSklaRzV2VG5JcmFYSk5VSGxXTTFwb1YwbENOVzlRY2psRksyZHdZbGhRYUdSM2NVdFBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTUVhwMENrVnpMMlphUzFobFZYRkxPR2xoY0M5MWVXWmhhRWRuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDNUV3BuZUUxNlNUTk9lbGt3VFZSbk1FOUViR2haYW1zMVRXcFJNVnBxV1RCYWFtc3dDazVVYkd4YWFrMTRUMWRWZVUxSFdUTk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6ZFZiV000VlVGQlFWRkVRVVZaZDFKQlNXY0tVVEJQSzNWdlREQjZkV3hGZVdwUGRrSTNOakIwY2tkNFpsZzJVVkE1WnpoQ2FHdGFRVTlwUjFSWlRVTkpSM2xuU1RReGQybDZhMDl1SzNNelRYQnJOZ3BPTWtSbGRERm9ablU1Wmt4RFRFODFPRUZIZFhoT1JpOU5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlVVUnBOek5NUm1KVlowMDNkRmhUQ2tSRlZVTmpOUzloVURKeVlpdHZhRTEzVURoT2VsQkphazFNZW5Cdk5WaHlZblp0VEhvMFUwRXZTbGxGVnl0dFRqVTBiME5OUWpoV2NXdGtRbEV3TmpNS2NsUlNRbmh0YkUxREwzaE1ZME5sZW0xd1FpODVTR1JGTWxwNVRuWnZkVzFuWkhOcGMxaEJhek5RTUdKSVp6UktRMFp5VkdaQlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665191555,
          "logIndex": 4665095,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "028132776418489ab99245f64f9459ef319e20f7",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3208587859",
      "sha": "028132776418489ab99245f64f9459ef319e20f7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

