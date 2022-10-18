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
| `latest` | `sha256:c531bdff2486517a3115175f209a2d12001b6bc5d323f6904ab4ca3c11a03b43`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c531bdff2486517a3115175f209a2d12001b6bc5d323f6904ab4ca3c11a03b43) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:c531bdff2486517a3115175f209a2d12001b6bc5d323f6904ab4ca3c11a03b43"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "28f1d1176646e2b984c7266551604a4a4bdc4b74",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIE0rFeijFF3y2CnCJJMatNNtM5azJQvOiMw71fYcgD+hAiEAyAdtJQaIP67EBL79L9FEG7DCnEUJznFLAIelCQjn94c=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkOGRhMTAyZGJhMTRhNDQ4NjhhMzc4ZTA3YWZiZTcxOTUyMzVlMzgxYmE4OTRmMWFkZTg5OGI1MzAzZGQ5OGQ5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQ3cVpkdHc1M3pFVlZIeXdqaEw0cTRITGJsT2JKS25ybURHT1RxUndITzl3SWhBTlpMMnBIZVkyT1BhU3dZTUtOa0tEeU5VeXl0MUFGV2lNaHlsV09XbjB6NCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhweFowRjNTVUpCWjBsVlRXTmtkVWRyY2pjdllpOVBSVXd3YzFWNk9YZFFRMDVtYWxGemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRSTlJFVjVUWHBWZWxkb1kwNU5ha2w0VFVSRk5FMUVSWHBOZWxWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZQZFVObE5VcFVkVkV3YzNsalIwTmFNSEZ4VW5ad09XbFFRV2w1YjBzeGNXdHhTM1lLY3pOc1NqbHZWWHBLTkVRelVGWjJhM2xGWjNkVVQwYzNRMlF3ZDJkeFNrVXpRa2d2YUdkM1JtczNSMHhrUVhOc1IyRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZWUTFSRUNrdENOWE1yZVhoamIxTnZiVGxuU1hwbU1sSXdlWGhGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDVUMGRaZUZwRVJYaE9lbGt5VGtSYWJFMXRTVFZQUkZKcVRucEpNazVxVlRGTlZGbDNDazVIUlRCWlZGSnBXa2ROTUZscVl6Qk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p5dHBkMjk1T0VGQlFWRkVRVVZaZDFKQlNXY0tWRkUyY0dwR0swOXlRV0ZCU2lzd1ZFdHdaMHRrTTBKaGNVNTBjRWd3TVd0d1drSkpNVGhZTVdKc1owTkpSRlU1ZWxncmRqZzFSM2xGV2toS1NFbDNNQXBQY1hoT05XRldNMnhYYWtVMlVVNUZUM1pVUkRoRmNuUk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSmpRVTFIVVVOTlJVbDFPVFZKZURCc1kyVklSbkJHQ2xoaUwyOXpUM2dyU1RkSFIxWkNUV2hyUW05SFRVZHRZV3czVFZWUlJUSkxkVmM1VVdOb2JWZ3hiVmwzVEhkWFVscG5TWGRQUW1KSmVqTkVSVVZ5YUVVS2RpczJhVGR0WTJkcVRHMHpRalpLTmpscVJuaHFTRFJIU3pNMWRFaFNha2huTVVsNU0waFpkMWhrZFdzckx6bEhUVm80T0FvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666056244,
          "logIndex": 5317514,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "28f1d1176646e2b984c7266551604a4a4bdc4b74",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3269890257",
      "sha": "28f1d1176646e2b984c7266551604a4a4bdc4b74"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

