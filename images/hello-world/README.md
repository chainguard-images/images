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
| `latest` | `sha256:57d86b0a52e9fd64f3f828e17a6a2eb72a44d836937f9fd775c8f624524c7b0f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:57d86b0a52e9fd64f3f828e17a6a2eb72a44d836937f9fd775c8f624524c7b0f) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:57d86b0a52e9fd64f3f828e17a6a2eb72a44d836937f9fd775c8f624524c7b0f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0733f127eac63f9b02ea23a304bec516e587b374",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBawAIst1KvdIm0eN6rdbRtQI5rTHuQAUWJZkn/nz5CRAiEA6BvR43zRK86DSAByG37lekBHY1JO2ZzenIW0TeR6OR0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiMjlmZTkzYmMwMjBlZWRlOGZjNDFhYTg5MjNlYzEyNTljYjM2ZjZmMThjNGM3MzU5ZWRhNWMxNjI2NDYyMDRkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURrRFBSVHEyNTdXNlBQSlZmUGUvaUQvc1p1NWw0Z21MS1lVNkxQWStKNnlRSWhBTmUrZHN1V1kzTE5aVWFtSE1vL3NEZGVubmw0ZlVyZXk3d2ZPNzNGbHdtNSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlRUaGhUVGRUVVhOcFpHdFhTM0VyU0RaT0swcE1WMjF5VVU1cmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlJFVXdUVlJCZVZkb1kwNU5ha2w0VFVSRmVVMUVSVEZOVkVGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZPVUVrd05HOHZiRU5DZDNaaGRrUmxjemw1VWt0bU5USnRaRE5JYUhwV2RtNVpZbE1LY0hCdFlTdG1UR1ZUYkhGM1NEUlpWRUpzYTBKU04za3plVVV2UW1wV1QyTlhLMGRWY1doaVpraEpOVlpNU0haUGRHRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZrZGpCQ0NscEZXblJVVTJzM1ZrSjFWVFZXU1ZGSFkxQnpNV1YzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDNUbnBOZWxwcVJYbE9NbFpvV1hwWmVscHFiR2xOUkVwc1dWUkplbGxVVFhkT1IwcHNDbGw2VlhoT2JWVXhUMFJrYVUxNll6Qk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6aHVZVXh4WjBGQlFWRkVRVVZqZDFKUlNXY0tTVTR6UzJGcFpqQjVjREpYZEhoTlpFdHFhSGQ1ZVRCdk16SldiMUpwYUV4U1Ftc3paVFpwYlhwSFNVTkpVVU0wU0dwNVZtdGhOV001T1hCeU5VbEdhQW8xU1RsbUswZExPRWg1ZVVWUE5IVnJRa0V5VTB0T2IyZFNha0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJhMnhSVjJSM2RrRlpkRzkzQ2xoM1dTc3hjbk5FVUcweGVHVjRaR1kxYzJkVFkxZHZRbVpUYzNacGEweERiSEZrYkdSbFptNHlTekZKV0N0eGJWZE1iV1ZCYWtGQmJsSlBUM1UyV2xjS01qRllWbUZMUzBvd1NpdHBNelZvWTNrelRqY3lMMnBtVVdWdmJHSmhTa1pMZW1KWE9ITjZXUzlyUm1oaVowODVRMXBoWTFjMWR6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665538881,
          "logIndex": 4931782,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "0733f127eac63f9b02ea23a304bec516e587b374",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3231417814",
      "sha": "0733f127eac63f9b02ea23a304bec516e587b374"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

