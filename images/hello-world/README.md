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
| `latest` | `sha256:224a6aa2b4e20edf268c37a8b66ea02631bfee5142261a6ee088855f2ec49470`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:224a6aa2b4e20edf268c37a8b66ea02631bfee5142261a6ee088855f2ec49470) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:224a6aa2b4e20edf268c37a8b66ea02631bfee5142261a6ee088855f2ec49470"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "3eb6fcead76fb04f203bed0b4a3899dbaeb8c9c7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCs7MZs8rrzc1THUduv5BDg5g/eOVpcvC2OTbOldpCS7QIgPlR/7A1zA3OXpFKyZBYmT4rOidLKgjnM2hfvYHHgSMc=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3Y2NkYTEwN2QzZGIzZjM5NGNhZDJiMDUzY2MyOTI3YmU3MzZmZjgyOGU1OTg2ZGM2OWFlNGJhNWRjN2ViNDc2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRGRGSnY2bGNoamxUWVN5MHpTb2IrNGtpdG9EQk0xVTIzdU8zS0VuSE1HQUFpQlJtNHRhcTNvSXBjWmZaVTF0SDR2eGNtSGFYc2JaYjlXQkN3alNoZTBnNWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVlVtVjFUR3gxUlRkdGF5czRNbVJXWVhjMFkxZFNjemxNSzNSSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRKTlJFVjVUbnBWTlZkb1kwNU5ha2w0VFVSRk1rMUVSWHBPZWxVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZVU3pRdlpIUlpTRkp2ZDNsbmNraEJTMFJvVWxkQ0wwOWtjMGRHWmxOeGVtdDRVM1lLWjJneldrNUdXSEJuZWxjMFJIZDNlVGczUTJJeGVIYzBUV3hJU2twTWMzbFdhMjgxUW1Zek9VcEZabWcwVVVveVNYRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZPS3pVNUNsZDFibkpuY0VSS01UQmhiVlF6YUU5Rll5c3pUMjFyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDZXbGRKTWxwdFRteFpWMUV6VG0xYWFVMUVVbTFOYWtGNldXMVdhMDFIU1RCWlZFMDBDazlVYkd0WmJVWnNXV3BvYWs5WFRUTk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6azFibkpTUlVGQlFWRkVRVVZaZDFKQlNXY0taVk5HYTBkTlJFTnNTRnB5VDFvelQxcEtSR0pUVjJzMVNIRXdhMnhHYWpGcldqa3pLMXBMVWsxck1FTkpRMWxpZUhwelJURjRiakUyY1c0dllXNVFlZ280U0V4dWJXcG9ZVlZEUm5oNmVreGpTbVZYYkRKSGMyOU5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlIxQmtPWFpRTWtGR05GQkNNV3RuQ2tOMUszWllNMjQxVlVONlkxaFVMMGd3Y25NNGNFRjJNbFZPWkVGT2RsQmxjVnBGZDFKc1dUQlhWRXhoVWtoQlJpOVJTWGhCU1ZwV1IxRlJTMUZyT0RNS1NWSnplRkpJUVZKNmN6UkpjMWN6U25wMFpqaFBVVmRqZVc0eWEwNXNNakJtTVhJNWQxSjBiRUUyYW1vMldVWjBXazVtU1ZsQlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665883687,
          "logIndex": 5188240,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "3eb6fcead76fb04f203bed0b4a3899dbaeb8c9c7",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3257823206",
      "sha": "3eb6fcead76fb04f203bed0b4a3899dbaeb8c9c7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

