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
| `latest` | `sha256:48d3cdd71ce1c700e90653bc1957726194e5ccb4834b0e1a8e047d062ff16f62`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:48d3cdd71ce1c700e90653bc1957726194e5ccb4834b0e1a8e047d062ff16f62) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:48d3cdd71ce1c700e90653bc1957726194e5ccb4834b0e1a8e047d062ff16f62"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "63494585aa66b63cba1f46a9ba4c9fd1aee79676",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCQQ4xtLJ64AI8f3J6+Q1t0eYcZ41JqNIGX6VOc5hkOgAIhAKat2KuPMWcPKGT39PpiObmpTNwoNYyRiuM9YNV8ShJd",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZjczYjJhMzJmMWZhZWIyNzZkNThlMmYyZjQ4OWQ0YmFkNjYwNGVmZjdiMDY5Y2Y1OGQzMmIzY2UwOWI4ZTM1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ3I1NXFya1BFVWZXMDMremFEZlQ0U2NlTC9WbWhRUzhDSHBCSWdqTEtYMUFpQTBZMU91TmpENHlYOW85NzhyQTN1S1c0WkpVS2JzS2I2Mmdxc0hjMm52aFE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhweFowRjNTVUpCWjBsVlRFZDFSVUpzVkdsWWRuaHlhV0owTldwTU1EaGhMMms1ZDJKRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlJFVjRUMFJGZDFkb1kwNU5ha2w0VFZSQmVVMUVSWGxQUkVWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXU1RSUU1XcHVkMEptZW1sbmF6UTBVaXRLT0ZaUVIyRlFhVFpITUhZelZISk1UaXNLUmpSaWFHUlBVa1ozY0ZZelpsQm9WVXgyZVVkS1dIZHRlak5VVm1ORFdIbGljWFZxVVZFME9HUkhWWFJSVEhoRVYwdFBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlVyZUZwa0NrbDZSVkk0V1ZOemFEUldiazFHTDBocVJXaG5kR05qZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3lUWHBSTlU1RVZUUk9WMFpvVG1wYWFVNXFUbXBaYlVWNFdtcFJNbGxVYkdsWlZGSnFDazlYV210TlYwWnNXbFJqTlU1cVl6Sk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFUlljWGt6UlVGQlFWRkVRVVZaZDFKQlNXY0tZelJXZVN0NGFrVTNlRFZRVG1oM2JuVlJVM3BLYm04M2MwRm1kbkEwZWxSUVdsQm9aa1I2T1dsSGIwTkpRM2haTVVOTE0xQlJaMWxIYzA5Vk9FbERNd3AzZFV4UlpYSXhkaTkwVDFSbFQxa3ZVQ3RITW1GTWRUUk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSmpRVTFIVVVOTlIxZFdiMWd3TkNzNWJraFFlRTVLQ2twU2RsQlNiRnBEUkU1cVdWaDZRM0ptVDB0dGRsbHFkekF3ZGtWdlZIVnhUbEpVZEVzMkswZ3pVeTlpTkhkaGRVRlJTWGRRTVVwcVdIUTFSblp0T1hjS1ZTdGhTRzByYnl0M1dXaFdVRTk2UVhSNVREQmlOME5yUldaRmQyNVplVW96V0hOSVZrdE1lazU0ZWtOMmJtMHZaRzgxWkFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667351899,
          "logIndex": 6324663,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "63494585aa66b63cba1f46a9ba4c9fd1aee79676",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3374119901",
      "sha": "63494585aa66b63cba1f46a9ba4c9fd1aee79676"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

