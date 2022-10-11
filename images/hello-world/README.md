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
| `latest` | `sha256:7de9ec8991bc24fe13903e9cad5db5ac27e55087fee5e7c8050ef3b323e9b3b6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7de9ec8991bc24fe13903e9cad5db5ac27e55087fee5e7c8050ef3b323e9b3b6) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:7de9ec8991bc24fe13903e9cad5db5ac27e55087fee5e7c8050ef3b323e9b3b6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c29a098a208c973c4eb8575f719148bd56005951",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEEPuRaF0c6Lo6Q5Y5X9SObYWL0B6zyxOGcGbqangxkTAiBe3nQozwGo/0dLmWhxHmprknnB+KNked9tDHzEwX7nEQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4Y2JjYzZiNTM2NWU1MTAxOTIzZWJlNmZjNjgxYzI5YjJjYjQ3OGI0MmMyMzQwZjBjMWI3ZmMzOWVhNGE2NGIwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ2R3aGlsRVFQL2VQcEMweUQ3NE5pU0VBYTFncXl6YlJmSndFbEw0Z2hUb0FpRUFyL0lyck9WWm1hak9QUzBlRTZrM0xYaHVIaEdhZUgzSUhWbExBOG9PdXhZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwNVowRjNTVUpCWjBsVlVURTRNRVZ4YmxGUlVtNVlObUZ1TWxGRWN6SnZOMlEzU1RsVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhoTlJFVjRUbFJKZWxkb1kwNU5ha2w0VFVSRmVFMUVSWGxPVkVsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwTkhwaVZrNUVUa1JOU25VNGRUQjJla1pvY0VOWGRWTm5OMHhRVEZaaVRsUnlTaklLUldoMmJ6TnJTMEp3VVhZeFVGSjNRbVkzT0Zrd1prTnVWRXd4VjFkRlZHMUtWMDE0TDAxeE9VOWlaVEJWVTFRMkwzRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZDWkhWVENqRlhNMkZRTDJaYVQzTllkbEpOU1VoM01HVkRZMFpyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHFUV3BzYUUxRWF6UlpWRWwzVDBkTk5VNTZUbXBPUjFacFQwUlZNMDVYV1ROTlZHdDRDazVFYUdsYVJGVXlUVVJCTVU5VVZYaE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6aFRZMVpVWTBGQlFWRkVRVVZuZDFKblNXZ0tRVWwzTlc5eGFsVnJlVGwyTlV0blYzSjVVelU1TVVKUldFeHpXVkpITm5wa2N6TmpjVXMwVFUxRWVVSkJhVVZCSzBsSWRIRjJhMHR6V0dGd2NGUmxlZ3BoVkdsb1oxaGpTWE5SVW1KS1VqQTFOMEUzTXl0dmVrRm9OazEzUTJkWlNVdHZXa2w2YWpCRlFYZE5SRnAzUVhkYVFVbDNWbmxWU1hBeVJ6Tm9lbTFJQ25ZcmFteFRkbWRIVlZwdWVHRlRhWHAyZWpadWNWVlVVSFZwYTJaQlEwZFZWVkZ5S3pGWmJUUlFPVEp2VURKalJtZHhhVXRCYWtKblZuRnlXbU53WmxrS1JVOWtMMWQwUTJVNVlWTlBLMGhEVFhadFlWUTFPVzVLYUZsclNsZEhkWEZNUVhwTVUwVmhVV2xWWldaVU4xWnpXR1J1TVU5Q1l6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665450931,
          "logIndex": 4858664,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "c29a098a208c973c4eb8575f719148bd56005951",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3223432612",
      "sha": "c29a098a208c973c4eb8575f719148bd56005951"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

