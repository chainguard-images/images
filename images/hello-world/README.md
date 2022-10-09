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
| `latest` | `sha256:c83068ff6415a116cf695badba589941fe47f474f6ca72da98057e2efc2e2362`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c83068ff6415a116cf695badba589941fe47f474f6ca72da98057e2efc2e2362) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:c83068ff6415a116cf695badba589941fe47f474f6ca72da98057e2efc2e2362"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2890658b4e0a755511ded262136621083265b819",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDTE216WWwjIQYXofNGcfPfm4MjhVHDUlNlNw2nms2/UgIgAYRLEVY8GfkW1sOUNJI3IOn6FlTCaLBfOuC/V9O4284=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5Y2ZiODg3NmQ0NTc0MWFiOWJjM2FmOTFjYzE1ZjQ5NzcwMTlhZDYzN2RlZWU5MmRiZDE3YTE0OThmOTZkOWU0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURsRU4rUGVGMVAxaXJYeDhzazd3UlExMFhXSGZCYkFvc01Hc0h5NUJtQnZBSWdaUGEvKzBOMHp1TndDUUJIcWdlVlpSRTEwYkZVNFpkN29KTWdzZUY0WmxRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwMVowRjNTVUpCWjBsVlVFNUROM0psUWtkWGQxVnJVbTlNVWt0dVVtSlBMellyUzJkVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRWTlJFVjRUMFJOZWxkb1kwNU5ha2w0VFVSQk5VMUVSWGxQUkUxNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUTVZoeVVYRmhSMGcyYzJZMmIyTTVVelJPUkVNeVZ6SjVaalJQVERSR0wxRlZVVFVLV1c5RGRERXhXVVZ0YUZkMWIzSk9Wa2g2VURWS05VVnNMekZ4U2tWRlJURlpWVVp0U2xKaFNteFJTbWR2V1haMWQyRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2VFRSMkNrVXJTRlJaUlhCWGIweHBlVTlOV2pNNVIzRnBLM2xaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDVUMFJyZDA1cVZUUlphbEpzVFVkRk0wNVVWVEZOVkVacldsZFJlVTVxU1hoTmVsa3lDazFxUlhkUFJFMTVUbXBXYVU5RVJUVk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6ZHdVMmhFUlVGQlFWRkVRVVZqZDFKUlNXY0tVa2czV25kUGNrMVVTR1pPWmtKa1EwRTFaVEIwTUdoQ2EzRk5WSEZUVERSTmFtbG1kak5yVm5sVFkwTkpVVVJTYkdKQ05HSkdPVWxMVG1oMmNWUkNOZ3B1YjBkR1JWUmljVFYwUVRKcGVrbGxVM1U0VFcxTU5VeHVWRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9jRUZFUW0xQmFrVkJiVTlRWWsxeWRtZ3hWVUZEQ2tWeFNtODFSWHBqV0d0YVFqWktSVzU0ZGxsMllYTlRZa2hUTjFwemFtVTRTaTlWT1UxbVMxa3hXRVJYVW1OTWNrRndZakpCYWtWQkx6Rk1NV1JQYlRNS2NpdEpSM1pHUlVFeWMxTXlkM05YTjNGdWJtczJiWGRNYzFvMWVUZGFZMUpFTkU5cWVFeDZSekFyVWtZM1duWmxXVkJ2TVhWb1RYVUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665278330,
          "logIndex": 4725221,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "2890658b4e0a755511ded262136621083265b819",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3212428877",
      "sha": "2890658b4e0a755511ded262136621083265b819"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

