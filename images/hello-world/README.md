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
| `latest` | `sha256:57b6453bee85af9f7a82a28a69e15f7dd19479d010fb04b1890902197e232731`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:57b6453bee85af9f7a82a28a69e15f7dd19479d010fb04b1890902197e232731) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:57b6453bee85af9f7a82a28a69e15f7dd19479d010fb04b1890902197e232731"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9a23cbd42288c70fca84010f1feea63e1efdd620",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDndOK2Za8Cf4UexbesC00vkpZsjp3HZ4FTqCKlL7L+TAiEAwdxV3XCuwUPV4l8+Wa5UUD/nXkouAuHj7fd8pgkTbMY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1OWVmZTkxMWI0OGNmYTQ0ODkzMTEyOWY3NGVlNjJlYjM3ZDAyMTUxOTM2NTZhODFlNzE0OGQ2YjhlYjUwZWEwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNWYzM1VXNpQThGMzNPTDZSa0xaNWpMNjh3blQrRGtnQ2dtMmF0dkl4V2FBSWdTT1R1cGRzLzlOY3JrNzNYK2RtUGRJYmRIRWFqVFY4MkhtM1Ura1ZrZzFBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVlVYb3JUVlF4Wmk5M2J6UjBaV1ZLUkZZNU5qZzVRWEZpWlZKamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFVjVUMVJOZVZkb1kwNU5ha2w0VFVSRk0wMUVSWHBQVkUxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKSzAxU1MyWnFWMFJsUjJSQ2QyazNhMFZLUzFwTVVuZEhVbTFxTjJOV1kwWlRRa3dLTXprelpWUklTVWRVTlROR2MwVTFaV0U1WWsxV05sUmlTR3BGVTFKRlZrMTNOekYwTW04M2JGWlZWVVZCVDNVMGQwdFBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZhWm1ocUNtTllXazlvVFVsTU5sWnVOVTkyUnpGaVpFdHBSamRCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyYzFXVlJKZWxreVNtdE9SRWw1VDBSb2FrNTZRbTFaTWtVMFRrUkJlRTFIV1hoYWJWWnNDbGxVV1hwYVZFWnNXbTFTYTA1cVNYZE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p5dFBVR05OTkVGQlFWRkVRVVZuZDFKblNXZ0tRVTFxWlRoWGRtZDRORXBJYkZSSVR6ZzFlQ3M0VkcxUE5VRTVRVWhRUzJ0bFduUjRiaTlYVW1wbFNHNUJhVVZCSzJST05YcEVXazlLV0U1TmRWRjBNQXBUWlU1WlFWQTRkMjQ1Wm5BNGRtNTRSRGhvT1dWVlUycFJlR2QzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDRRVXRHZDI1bEsyNUtSak4zQ21GcmJsUldaWEJRVlVRM1oyOXBaM2hCSzIxRE5TdHJUSE5yYlVOTk1uWXdkMjlCUTJWRWJqZ3JXREU1YldsaFYxSktWeXRHVVVsM1IwOVJZVmxYZVUwS1ptRXJlVE5RUjBkQmJUVk5VMWMxVjJKd2FGTlhTVVp2YmxsS2VWUXdZMGxEY21Rd0wzTnZSVEEzTlV0VlpERlhTSGt2VkdkV05VTUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665970188,
          "logIndex": 5247674,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "9a23cbd42288c70fca84010f1feea63e1efdd620",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3261700381",
      "sha": "9a23cbd42288c70fca84010f1feea63e1efdd620"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

