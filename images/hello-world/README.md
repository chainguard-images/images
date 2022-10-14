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
| `latest` | `sha256:2fd61a75b04a019b3ddb2c0d211a3ce3cee22f3f125490197d265f7dec30d504`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2fd61a75b04a019b3ddb2c0d211a3ce3cee22f3f125490197d265f7dec30d504) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:2fd61a75b04a019b3ddb2c0d211a3ce3cee22f3f125490197d265f7dec30d504"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7f2baad1dcc6a7bd33fc33cb4f141c15c52725df",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC7Fd+cQXazVgJi6rke1JpTOifyM4KH+mD0XTUpNxPdYwIgeEThnPOKaOqXbfDVEUFjrzYA+XCnSC/WnncvCdyUzBE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhNzc4YTA1OWY1MzY1ZDVhMDJlMmJiMzdhMGY0NWU2OTM5YzY2NjYyMDMwODIyZGIyYjM5YzYyODE4MjZkODViIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSEF5bU9lTVhsUDh0WjVvaWJnR0haRXo4WUVDYWZLclZic2orSldGUDdRUEFpRUFubTZFMWNjZE5SeHptd0gwSkN1bXVVQUU1eklBVnIwYWtYRzh1eFIwTmlJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVlN6ZDBaMFpEUzJ4U1VrRlNTSGQ1ZW04cldFeFNiM0ZsUTBGSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRCTlJFVXdUVlJGTkZkb1kwNU5ha2w0VFVSRk1FMUVSVEZOVkVVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwWXk5VlRIaGFVbllyTWtkQ2RVVmlXRGhQWlVOT1luSndkbXBxZFVSaWRVWmpla1VLWVhjeFkyTnBabFJtU1V4cE1rZG9LMmxuU1ZKMGJtUnROVWhPVENzNGMzcG1hbU56U3pGaE0zWjFUa1YxYlN0RFJFdFBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ4WldwekNpdG9kMDB5ZUc5c1p6TkRSV2RoTlZZeVNUWm9jVUZWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3pXbXBLYVZsWFJtdE5WMUpxV1hwYWFFNHlTbXROZWs1dFdYcE5lbGt5U1RCYWFrVXdDazFYVFhoT1YwMHhUV3BqZVU1WFVtMU5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6bFJia3BLU1VGQlFWRkVRVVZuZDFKblNXZ0tRVWxhWm05TldUSlhhSFpMTkdkUEx5OWlXaTlHUVhoSVJrczVTSGh6TlVrMFNFUXdPRUpLYUhKSlJVSkJhVVZCYjBOc1UwVkpiRmhLYmtrd2FtVXJRd3AyYkhCbWMxcFVhazRyTlVsSmFHYzJiSEE1T0dNM2RrWTFOekIzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDRRVkExT1RkM05FMTBUVUUxQ2pRMk9GaDRjelppZFVOU1dtZzBiVUpMWjBkYWNuQkhRVEo0V0ZkeVNHTldPVVEwVG5oTVpGSjRNSEJVWWxJMlJsZFphemxIZDBsM1NteDJjWEZUUVdzS2RqaGtabXAxZVRSUk5HZHJURkppTkRkdldUZzVabWcwY25OWFpTdFpjbUp5UTA0cldubzBXR1J4ZFhVMVUxRkZiVGQyZW1OWlkwb0tMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665711687,
          "logIndex": 5063764,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "7f2baad1dcc6a7bd33fc33cb4f141c15c52725df",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3246857900",
      "sha": "7f2baad1dcc6a7bd33fc33cb4f141c15c52725df"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

