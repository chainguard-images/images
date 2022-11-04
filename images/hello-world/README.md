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
| `latest` | `sha256:0e44aab752b030d87e528b0adba9be2e2200e32e368486fb4db2a7ac7f903d46`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0e44aab752b030d87e528b0adba9be2e2200e32e368486fb4db2a7ac7f903d46) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:0e44aab752b030d87e528b0adba9be2e2200e32e368486fb4db2a7ac7f903d46"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e445c4dbce4b82ceacac76011cae05f5bed335d5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIC/vQCd+nGozBtXZ6iqqGOOlanrKrclSchigJOntyQbYAiATPwFbViq4kmCfsME7c/aj2jLe329vKMzvVUcyFk+++g==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiMTg3MmNkNDA5MmZmZjE2OTcxM2RjZjA3MzRiYjE0YjA5N2ZkYTM5NmZkNjM0N2ZhZjA4YTU5Zjk3MTlmM2IzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ1ZYTFlNS3l4dGsxMWxBMzg0RW0zVnJVZ2M2aTFYWWQycDNCRTh3V3dha0FpRUE5R1VSRzNmdk5yNHZjOUZjTmFGRVBTcTJTU0tmendxeUdKZVFZNFljRGprPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwMVowRjNTVUpCWjBsVlRVcGFRV3RIVVc1a1drMHpWRVJ5TlZGcE5UTkNlV3ROUVN0amQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRCTlJFVjRUa1JWZDFkb1kwNU5ha2w0VFZSQk1FMUVSWGxPUkZWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZPY0ZwSmNWWlVNbGRQTkcxWFFrSmljMVJ4ZFdWS1JHdEpOMGxNWVVwS2RucENTSFVLT0VGSFdIaEhUWEUzTVRBelJXWmpjeXRKVXpWWE1FSjNXR1ZXYTFreVFtWm9jRXM1UWxwd2VUQTVkMVZxU0RWbFJYRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKVlRJekNrcFZUQzlCU1VwWWJEQnpVemd6ZVZNNFRqaHJZemhWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHNUa1JSTVZsNlVtdFpiVTVzVGtkSk5FMXRUbXhaVjA1b1dYcGpNazFFUlhoWk1rWnNDazFFVm0xT1YwcHNXa1JOZWs1WFVURk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFVkJNR000UVVGQlFWRkVRVVZqZDFKUlNXY0tSSEZ3VFhwUlFqQnJhWEYwVWtsT00yUkpPR0pPYkVRck16TldibkJXTkVoTE5HRlFUV3BVV0V4eFRVTkpVVU5ZT1dsbk9VaGhWRE5qZWpndlpIVTNVd3BaWmxST1lYY3dTM0IxV0hwVFZ6TlFlRmhuVmpWUk56Qnpla0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9ia0ZFUW10QmFrSmhWMFZCZEVWeFdHUkVTVU5TQ2paRWFsbEdRbTkwYURoS2NXNHhOazVCVmxSb2NYTnVaWFZFV1VGdE1uVnZNR1YxVkhrdmMwOVllWGN4YVhwRmRWSnFiME5OUkZSaFV6TjZOM0J2ZEdJS2VtMXpXa1ZRSzNGR2RrWnJaRXMwUmpZdlZtNU1OWFZEUTJvMmNtdFRNMHRSTm05blowUXlTekZ1YVRBeVFtb3pMelI2YjNGblBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667524497,
          "logIndex": 6458956,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "e445c4dbce4b82ceacac76011cae05f5bed335d5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3390496867",
      "sha": "e445c4dbce4b82ceacac76011cae05f5bed335d5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

