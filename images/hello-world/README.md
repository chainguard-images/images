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
| `latest` | `sha256:356440b64c9a4fe9e2216d902e1588c6d0fb3250b84121d9366b33f4a668617a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:356440b64c9a4fe9e2216d902e1588c6d0fb3250b84121d9366b33f4a668617a) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:356440b64c9a4fe9e2216d902e1588c6d0fb3250b84121d9366b33f4a668617a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e39de999038a03717d7c79465fe3afdb689d0dcb",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBHORW0GJ8o4Og4gWdRM6X6onbT+BISiCebPYeO54W9qAiBi/OucEUCwngfjItYWiORxeiWUZ4a3LbFds61rgUb3pA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjY2FjZWFiOTUzNjBkYjVhZDMwZDNhYjc2MjQ5MjA3ZDRiYTA1YTQ5M2Y1Y2FlZjdiMzllZWQ0ODUzYTZiNTViIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRG1FL2JIT3hDWENVdVp0N2JjdGRZSi9YQWZKMmpmL1RiVXNIYkcySlhHL0FpRUEvQ29SdCtKNmtDdkM4dW9mTHQ2Y0xVTjZ2M05CUW9WVStzUDNZa3djZ3JNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVldHOHdOR1JSVURFeWNEVTFWMXBMUnprM1EyRkdiVkZZTUhCRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlROTlJFVjNUbFJSZUZkb1kwNU5ha2w0VFZSRk0wMUVSWGhPVkZGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZIV1hkU2NVbG1VMkpITm5GelZUaGlZV1YwTTJrNE9VazBVa1F2Y1hGTVNqaENOMW9LWm05cGRXMTFRWEF4VEVGcU5FZHNVMkptY3poeVdVUlRRekJ4VDNCSVdGVTNaM1E0TDFCd09VWkJNSEJRYVdwblJIRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1VWpWWUNtdDNNekJJUjFOc2VWaHhPVmM0VkdkSlVVZEhNbGhGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHNUWHBzYTFwVWF6VlBWRUY2VDBkRmQwMTZZM2hPTWxFeldYcGpOVTVFV1RGYWJWVjZDbGxYV210WmFsazBUMWRSZDFwSFRtbE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFbE5aWGRhWTBGQlFWRkVRVVZuZDFKblNXZ0tRVkF4WVVWSE5HeGpVazAzVjBGRWJGVm1TRllyWmtWNFoxaDZLelZHVjFOME4yRlRSa1ZLVFRGclRHRkJhVVZCZEd4R01FbGtSakp1ZFhsdGRIcDZVd3BTV1M4MVJtUkNhRVo0VEZKSk9ETnNTRFEzWkVzM2VtcE1PRlYzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDRRVTFrWVRaTmNFNXpVbXBWQ25WRllXUjNOWEZQTmxWalJISXlibVpMVjFjd2VtSnpabUZoTW1sNGNEUklWWGxPUTFWUFIyWm5OVTQyUkZab1N6QXJVbHBRVVVsM1ZrcHdlbFZMT1VvS0syRnZXbUp1SzNwT00zZ3JiRll4YzJwRU1XRjVLekZzYTNKWU1qY3pOak5ZYVVrMllXeGhOMkpVWWtkek9HdHVObE5pVFRkU1dqY0tMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668647155,
          "logIndex": 7240801,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "e39de999038a03717d7c79465fe3afdb689d0dcb",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484446048",
      "sha": "e39de999038a03717d7c79465fe3afdb689d0dcb"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

