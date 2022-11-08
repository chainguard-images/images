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
| `latest` | `sha256:75ccffa9a34d14ebc43fca864d57e287aeb164e8ebc6ed8a3ca0f5b7d3c5d8c4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:75ccffa9a34d14ebc43fca864d57e287aeb164e8ebc6ed8a3ca0f5b7d3c5d8c4) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:75ccffa9a34d14ebc43fca864d57e287aeb164e8ebc6ed8a3ca0f5b7d3c5d8c4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d27457ccd068d368ed02de4b16e0b59883c0eb94",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBJ0bzLBDj3LCdDU5IoNL9xw9htdNmSx2FkLhYo5MsVlAiB8JWB3oEVo2zefwhbGSqQBqd9GOCTgj05TZd/TQdECvQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4ZDUwMDczM2U3MTU3MmUxNGM1ZjUyNzllNmFhZTBjMzI2MmJlZThhMTE3MDAzMDRlYTRjYzNjOTQ3OWE4ZjliIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSGJyTXdFalZDWkViTW5tUWY2WE12UitlQVZMVmVlNC94a2pVSUxxR3JScUFpQWFsNEFmNWcwQzlOeUd2b3BvOThDZlhha1RsQ0xXQ25zQ3ZFY2gyNC9FNXc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVlMyeFRNV0pqUXpCdFExZDRSakZvVG5aTmVHcGpRMkkxUjBVd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlJFVjNUbnBOZDFkb1kwNU5ha2w0VFZSQk5FMUVSWGhPZWsxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMYkRsVlNrcDRPVWR2YWxGM01EQjFOamxvUWpCSFdVcHBiR2xOVkRWRFRIcFhNbEVLWWs5TWNYRXhVaXRRWXpVd1VWZ3dVR3QwUlRSMFJHUXZUWGRwVTA4clYweHdkRkZMVldSRmEzSjVSa0pNWWpBdlJEWlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSWnk5bENuTjZSWEJTVUhKRVpGVXJhRWhpTDA1T05qbElWMWxWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHJUV3BqTUU1VVpHcFpNbEYzVG1wb2EwMTZXVFJhVjFGM1RXMVNiRTVIU1hoT2JWVjNDbGxxVlRWUFJHZDZXWHBDYkZscWF6Qk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFWlVTRTFHVVVGQlFWRkVRVVZaZDFKQlNXY0tWWHB1VjBkell5ODVXamh5TDJwcUsyNVplWGxaWVhWMk5tbG9WV1pHTjJrMmVUSjVaa0Y2WlV0cVkwTkpRbXhWTWtkSlNFeDVXVGh0VTA1QmJVSTJMd3BHWXpaQmNUQXpPR1JRVWpaWVNFUldOUzl6VDBOT1VHRk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlVVUlVXV2h5TldGSFRXNXNlVXhKQ2xwa1lXdEdhMnBsTkM5c1YwcHBPVFI0TjBGT01EUlJObE5ITDFSRWVtSkxPVmw0YmxrMFdtTktXRWhXYVZnMVFXcFZSVU5OUTJNck1GUTVhSHBPVnpVS01tNWxVelpsYXpkcVZqUndZV0ZHVldST09DdG1SRGhVU1dOalpYcE5jbTlaWTBwRVMwNTJhbmgzV1dsUFdGVXlURmxYVkhkblBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667869663,
          "logIndex": 6703803,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "d27457ccd068d368ed02de4b16e0b59883c0eb94",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3415460545",
      "sha": "d27457ccd068d368ed02de4b16e0b59883c0eb94"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

