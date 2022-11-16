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
| `latest` | `sha256:39e4183e5f3920624583ed2643eaf7df8cc7e5754dc66bf4c64992f990b1895b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:39e4183e5f3920624583ed2643eaf7df8cc7e5754dc66bf4c64992f990b1895b) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:39e4183e5f3920624583ed2643eaf7df8cc7e5754dc66bf4c64992f990b1895b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "05da908cac8ebbb593bee9c2c265bff21337676c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHbPe3Jy0iSufOateVy7unfCPL71zwjVRsUFRnq68LSqAiBL/GpD/jgGTZ9doypr3fzRTuymKk8uq5uET4cMvNPMRA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4NmExOTJmM2NkOGEwOWYwZmJlMDYwOWMyNTU4ZjFiZmUwNWEwMjBmZDk5N2EwMjNhMzc0NWI1MzA0NzhjNTliIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURRdDJGcm9HKzYyUXhtaXFITFRKTDhVQzFRL1luNEZFM1RITU5tUFcwU01nSWdGUm1SS2ZPMU1PdHYzektsSFpsdUI0UWlqN2VEWWluc1N1WXFZU1NnMzI4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhwNVowRjNTVUpCWjBsVlZVZEJkMUZRVTA1eFdpOVdSV1JUT1dwR2FqQTRWMlJDWlhWcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRKTlJFVjNUMFJCTVZkb1kwNU5ha2w0VFZSRk1rMUVSWGhQUkVFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY1YVhsR1IxTTVZbnBzVVdOUFVFZENhWGQwYVdwNlMxVnllazV1TDBSSE5tTlJRVGNLWmtwSE1qQnJTbXR5ZFdZM1ZFeG1OQzlDUmxZeVQycFBiVTU2YTJweU9TczJjek12Ums0M2J6UXhSMnBwY2pkblZqWlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtVms1RkNtOXljVEYyWjNoTldIaDBiMUpxTUU1NVNISXdVSGMwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDNUbGRTYUU5VVFUUlpNa1pxVDBkV2FWbHRTVEZQVkU1cFdsZFZOVmw2U21wTmFsa3hDbGx0V20xTmFrVjZUWHBqTWs1NldtcE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFZ3pObTFSYzBGQlFWRkVRVVZuZDFKblNXZ0tRVTF0V1c4MWFVdFhkRzF0TUZkRmRDdGliM1JOYlVVMVRISjFiemxWZDFZdmRUSm5SbGxTUjBzeGNGSkJhVVZCYldKWVNWTmtPVloxYjNvdlJXRlROd3BwYmtoRU1saFdRVEp5WkZaelMyTlplbnB1YlhseVduQlBNM2QzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZSUVhkYVowbDRRVWxPVjFoR1kwTXJWa1JxQ2tnelkzRTBja0l3WkZGMlUycHVOMmwwV1RVdlowUklRMUZCWlRKcGJsaDRjRzVRUjNoVlZHRnJkR3g0UVdOcmQxaFpMMXBuWjBsNFFVazVVM1ZGZFd3S1JsRlpjSFk1ZWpJM1FteFpPRUl4UlRkSlRXRkNNMWRQU25VelQyaDViRWRZWTNFMk1WZFpSVVpvWkhwMGVqbEpWRTF6Y0VsRE1IZFVaejA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1668560894,
          "logIndex": 7168766,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "05da908cac8ebbb593bee9c2c265bff21337676c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3475481473",
      "sha": "05da908cac8ebbb593bee9c2c265bff21337676c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

