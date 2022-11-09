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
| `latest` | `sha256:0225133b0ef0d489fa740a1b0fc708c439dfd6a650f8287a554d967c8c8a0847`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0225133b0ef0d489fa740a1b0fc708c439dfd6a650f8287a554d967c8c8a0847) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:0225133b0ef0d489fa740a1b0fc708c439dfd6a650f8287a554d967c8c8a0847"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "aac0a8d429b6a75f0e9c8baadb930641d07029d7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCvA527WRsE2tKg3IhY4risQhkxClSYBIX/bKX/BdUi3gIgAOVj35U8GPFPnyKHE9qj11Rt5prxlbjpILrjwfHovA8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2YTg4NTFhNzQ5NTJlOWNkYWEyMjg3MmJiYWEzNzJiMmRiOWUzMzc5NGM5OWFhMjQ1NzQwNjY5Yzc4MTQ1N2Q0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSHBzdWVVZEx5QTEvTkZia2dQKy9Tbzh6NU55eHhxRTcwOWdOdGFjTFZQNkFpQmdaQ21DMmExOFlJQkRpOVFuWGc2NS9SSm5lUzIvNllUbDhSOHArcTFRNmc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlJYazJPRTFqTkUxaFdHMUljRFU1WlRGbWVITjFTMUp4TlcxSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlJFVjNUMFJWTUZkb1kwNU5ha2w0VFZSQk5VMUVSWGhQUkZVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxVVZwRlJVNXFNRUVyU2s4MmVEaHpSV1pYY25ndlV6TkNLM0I1V0ZWUVIzYzJRa29LYjBGNWQwVndlbk5uYm1vdmJtMURlRUZtY25rMFprcFNLMk5sU0d0aVRHNUNWbWMyY0dwcFZEaExVVFZuY0d4eU1FdFBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5VVdKa0NpdE1NRFZaTDNwVGFucHRjWGhzWVdwNGNHTlpUVUpuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaG9XVmROZDFsVWFHdE9SRWsxV1dwYWFFNTZWbTFOUjFVMVdYcG9hVmxYUm10WmFtdDZDazFFV1RCTlYxRjNUbnBCZVU5WFVUTk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFWnVkVEZIWjBGQlFWRkVRVVZqZDFKUlNXY0taVmhWUVUxNmFFTkJaV2h4VmtwRlRrTk1jblJtZDNaM1dUSkdXREZLZDFaemFIaElNR1IzVVVoVk9FTkpVVU5qTkU5dWVWUjNkSGhwVUU1aWNWVXZlUW9yVFhOUWVWb3ZiRXhzUzJGcWFrMUJhbTF6WmxoTWQzZ3pWRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJNVWxOT1N0VVRuTm1UeXNyQ2s5c01GUXpUR2R6TDJoaFRFaHBjRXhVTkhwUk4xUnNORlJDWWsxU2R6UklNMmxXV0ZsQlNWWkNXWGxvTkZscmNVVXllWFZCYWtGQ1NHMUhWMnBWVURRS2NGQk5UMVJzYjA5VWNURnlNa1JWUm10NGFFeG1iazFwTkdkWmRIRnRWamQzVjB4MGFuZzBjVXhHUzNoV2NtZExiRWRzTmtoYVNUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667956143,
          "logIndex": 6756800,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "aac0a8d429b6a75f0e9c8baadb930641d07029d7",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3424516957",
      "sha": "aac0a8d429b6a75f0e9c8baadb930641d07029d7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

