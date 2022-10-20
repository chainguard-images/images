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
| `latest` | `sha256:bd513e1051ca7aa76a552dc3edbbb1275374d229eab1ce36b90e1d5310e94ce1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd513e1051ca7aa76a552dc3edbbb1275374d229eab1ce36b90e1d5310e94ce1) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:bd513e1051ca7aa76a552dc3edbbb1275374d229eab1ce36b90e1d5310e94ce1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9f3bfb31d5aee29b4430687beca27606fb4b34ce",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBFLDYTulsjUpjrUIkLtkxwNb3mTeZKAnKrjyJl7YJR3AiEAsPz9PMxuRl8WNoisIdtSgfUMMANnKH4g2hKQSSxZs5w=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzMDI1ZTM2NTRjMjcwNjIwNjZhNGRjYjI3MzQ3OWEyZGE0ZmVlMzcwNzA3YzVlY2IwNjk2ZmEzZGU5ZmIyZjJkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURaTDFZTko2VUZBeDR3SUt6Yi9tSW1WbUNaL01raGl5RUhNYXREY3FNREpRSWdNaXMvSGxJM0dQRU8vbC9ZZThmc1FmbFJGUGN1YWZ3aW5qRmNCcy9VRlg0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhweFowRjNTVUpCWjBsVlMycFNTbFV2WjFGUVFsTjFlRUZFTUhacUswSlpVVWMxVmxaamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlJFVjRUMVJWZDFkb1kwNU5ha2w0VFVSSmQwMUVSWGxQVkZWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXT1dWa1dTOVBLMUpxYVZoalFXbFVUREJLVWxBdlFtdzRWR2xPV0hOcU4waFVNMnNLTlRGQldYQlhja1JaUTFVd01WVnlkbXQyTWtJdldIWXpSMDlSUmxKbVpuUXdUVFpoZEVWcmJXTjRkbVZGVkd4MEszRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUyU1dkckNucFZiRVo0TVU1R1VqWjNaVWsyTWxoa1YxVnJjVGh6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyYzFXbXBPYVZwdFNYcE5WMUV4V1ZkV2JFMXFiR2xPUkZGNlRVUlpORTR5U214Wk1rVjVDazU2V1hkT2JWcHBUa2RKZWs1SFRteE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p5OU1OVzh5TUVGQlFWRkVRVVZaZDFKQlNXY0tVa2xDU2paQ2JrSjFjbTk0SzJ0T056aDBOakJMTUVRdmFsY3piR1o2V1VWTVdUbE1VSGMwTkhrNFdVTkpSMHN3SzNCMU1tSm9VakJDUWtRMGJDOHpOd3BMTDJkUFF6QnlaMWgzWXpKNFRqbHZXVVJDTWpOSlpWVk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSmpRVTFIVVVOTlNHNHlRV0ZyU210RkwxQkZVRk00Q2tkR1pWbFJXV0ozTTBKUE9YSmlNVmh5VHpWd2JsRjVXU3N6YlU5V1MwUnRRWFUxWWpseGRFcHNLMVZXV2xkbFRWUkJTWGRJTkdkRGFXaG1XVzFRVUhJS1dteElVM1YzVjNRclJWSlBiRE5XY2k5VFMzQXhTekJIT1RGbFFtVXlka3N5UkdaTGR6QmpOVk5HUTBjemRrcDNNWGhwWndvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666228806,
          "logIndex": 5466156,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "9f3bfb31d5aee29b4430687beca27606fb4b34ce",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3286136933",
      "sha": "9f3bfb31d5aee29b4430687beca27606fb4b34ce"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

