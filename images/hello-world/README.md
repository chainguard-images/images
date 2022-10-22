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
| `latest` | `sha256:dda9a18bed30e961e4685e74e1f83420808a8fb25c8192e367ccfb12422dee12`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:dda9a18bed30e961e4685e74e1f83420808a8fb25c8192e367ccfb12422dee12) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:dda9a18bed30e961e4685e74e1f83420808a8fb25c8192e367ccfb12422dee12"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7766a4649c4f87920b40e17cbf6406b3e82a273b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDtzmRa1TXfOA6J1/6n2OYFtn/CJjYe1mr1pVf4RV89sAIgEm/ZX2TkjZnDf139RpGkgKBH0HFegWnn3dhc8ORTXwk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNGM5YzNhMTQ0ZTU0NzUxNWUxZWViNDFmZjgzZTQxYWEzNjU2Y2JhYzljYTQzZTNhODUxY2YzYzhmMmY0NWExIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ2E5YnprSHZyV2pzV2xWakpTZGJXc1hGWGJjemcwaWM4VExmVnVySTVSTUFpQlllcElJWDNQeEZsdkFHMlc4bDNKcXdyeW1CTVA2aTBqNmhIS1J3RUR2RUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhwNVowRjNTVUpCWjBsVlpXaHhTR3RLY2xkQ1dXVXhRVE5EVG5OSFREWk9XVGMzVFROSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hsTlJFVjVUV3BOTUZkb1kwNU5ha2w0VFVSSmVVMUVSWHBOYWswd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZLU3pWSU1HcE9kU3RXZG5SU1F6QTBNSE13TTBwWVdEWnVka1ZQSzFSWmVuZHNVMGNLZUZCT1NUZEZWalZsUTFSeVNESkRla1pGZGtOaGIxSXZiMjE0WXl0NU1GTnhZVXBHWjI4eldYaFFORE5JZEhKMVpIRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZYVTNaVENrSk1iR2RwV2psU2RXb3plR040Y1dSeE9HaHJTWHB2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3pUbnBaTWxsVVVUSk9SR3hxVGtkWk5FNTZhM2xOUjBrd1RVZFZlRTR5VG1sYWFsa3dDazFFV21sTk1sVTBUVzFGZVU1NlRtbE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p5OHhTVE5PTUVGQlFWRkVRVVZuZDFKblNXZ0tRVXBxTDFwUWVEWXpRVlV4VURkc2NWaDVNVmRoVVVaUU1GSlhSbVZIYzFGbWJqQkVaV1YyU0VGbVZ6bEJhVVZCZURGNVMySkRPVzlKZFN0TVpWYzFhUXB1VlcxdE5qUlFLM2RhVGs5cWVFMXBkRmRWVFVwdlRraDRiRFIzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZSUVhkYVowbDRRVXROUVZWd2RqaHllbTUxQ21RM2NGVlVZMjQ1YjJWcEszUjFjSG8xUzFoWVRXeG9LMkZuTUZGclZtSlJlREZyWlZGWWFWYzJabEJNYm5ZMGRYSllVWEJ2WjBsNFFVMHZVV2R6YWk4S1pFTnFSblpOVkZwb1VXUlRObFozY3psdmJGRnZiR0pIYkU1bVEzRnJjbkJPVHpNMWRGTmlWMFpUWVVvck16UTBjMHBwVjFCT1FVeG1VVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666401761,
          "logIndex": 5609369,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "7766a4649c4f87920b40e17cbf6406b3e82a273b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3301426905",
      "sha": "7766a4649c4f87920b40e17cbf6406b3e82a273b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

