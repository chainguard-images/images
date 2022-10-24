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
| `latest` | `sha256:6da3d024e481ab7ac6386d625a8cfd2e5b1afd088422f141cf3c1e87f994761c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6da3d024e481ab7ac6386d625a8cfd2e5b1afd088422f141cf3c1e87f994761c) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:6da3d024e481ab7ac6386d625a8cfd2e5b1afd088422f141cf3c1e87f994761c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7234c8bb63f5bd6b1014d66d5ff4afe910718274",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDHPDBc63753ywG1cwza+fAHTgJyLB8KUJ4zUXYED/wdAiEAksUCtiIMiQPXF5V9beLNaFAaDhNphjxLIgqjCuSWLgE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5MWJhMDMwMTdkYzRmNjFjOTM4NmY3MzU2Y2UyMTI3NWQ5N2JkNDcyMWIxNTI0MjJjMjc5YjVkODA1OWMxMThiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUN2c2l5WmFrS3p1bWdLMHJUS2NWTVgxRkhrK1I1S3VrbE1qMzBQR2svWGd3SWdKRDlUVEhZTTJuREJnV2RKd0RKWXk2MXhiTDR4bUFCc1MwMlRzeFMzVXQ4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlJWaEVRV1l4THprcldTdGhWWFpyY0daTWMzRmxUbkE1WTB0SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RCTlJFVXdUV3BCTkZkb1kwNU5ha2w0VFVSSk1FMUVSVEZOYWtFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1VVM5c1JIbzVValZVTmpWSVQzVlhaMDVoU2xOR05sVk1jeTl5UkdwUk1qZDFUMU1LTjFZMWVrcFBkMWxyVTFaMlozTnNabkZIY20xa1MwRXlPR2xDTVRKWVpUUXpNMjFPS3pCTFRIbFNaMlZwWm5FeVRqWlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6THpGTUNuSjFOVEJMUkU1dVEwbGxNbTFRU25wME9FUjBia0pqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3pUV3BOTUZsNmFHbFphbGw2V21wV2FWcEVXbWxOVkVGNFRrZFJNazV0VVRGYWJWa3dDbGxYV214UFZFVjNUbnBGTkUxcVl6Qk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFRmxibVprWTBGQlFWRkVRVVZqZDFKUlNXY0taRzkzYW5rNU1IWnBRV052WVZGU2FpdEtNR3hpZDJocmFtRk1ObWR2YlZjNVlTOW9TVFEwZDAxVU9FTkpVVVJuY2tWUVJYYzRMMHB3YzNkeGRWZFFUQXBMYlM5YVEzTk1jMjlpYXpoRlRFcE9WazFWZUdSMk5FVXpWRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJiVzVEY0hGVk5GSmhNMFJRQ2tKNU9FNXhjR1U0VkdReWQxRkNSa2xVWkdKR2NVcDVVbmMzVDFwSk1sUXpSQ3RHT1hWRldrbGtla2xTVEZkRFNTOTFTRlpCYWtGVlVHVXlkbElyYTNVS05XVlBNV3RPTUhaWFZXdHFkVkZvYnk5MGRFVldiVzFvWjFnNWJtbHJkR1I1VXpkNVRYTm1lR05HZEVsU01Ha3pSVEZZTjFGb1VUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666575736,
          "logIndex": 5731934,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "7234c8bb63f5bd6b1014d66d5ff4afe910718274",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3309399343",
      "sha": "7234c8bb63f5bd6b1014d66d5ff4afe910718274"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

