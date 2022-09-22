# busybox

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml)

An image that contains busybox and musl, suitable for running any binaries that only have a dependency on musl.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/busybox:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.35.0-r25` `latest` | `sha256:579e691d8a89ae9f45c1936cf71132d9b27d7a52c6ffa2daf3270d4ce1d52c82`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:579e691d8a89ae9f45c1936cf71132d9b27d7a52c6ffa2daf3270d4ce1d52c82) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:5e199e40dcb11101670f1187f0faecc22ba92b2fb67c76b01f3498aa1f095c72`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e199e40dcb11101670f1187f0faecc22ba92b2fb67c76b01f3498aa1f095c72) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/busybox:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/busybox:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/busybox"
      },
      "image": {
        "docker-manifest-digest": "sha256:579e691d8a89ae9f45c1936cf71132d9b27d7a52c6ffa2daf3270d4ce1d52c82"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0851054b75d1622ed5dbe3e14d5ce0d8bdc52fc6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCXvpN4d0spuBnbkSl4P1nd141x36lDmXIjrarpal/C6wIgLmG0SUmRjgusZtH9XEECb6uyKB4/N5KvcjGHG36CMzA=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4NzdiMjU3MDE5Mjg3NmI5NjE0OWE5NmQzOWE2ZDZlZjBlYjczODBhYTQzZmI3MDdlMGU1MTM3MmY3OGIyNWJhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQmxBYVJ6YzRwaEV0YS9obGcwclNlTU1FZUlPUlRVZzNLNnRtY3lQb1NjTUFpRUE0OCtVVmdSNUpLeFRPWkVqY3dUSkFkNEFMZTE2c3U2M1hKRWNWZGc5a0NFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwTFowRjNTVUpCWjBsVlEyMHZVRmxFV25sQ1JIUXpaMUZ6Vm1GUVNrdGhTblpxTDFoRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFRXdUVlJSTWxkb1kwNU5ha2wzVDFSSmVVMUVRVEZOVkZFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZvYVUxNlQwcFZZakV4ZHk5WFVsVmpTR0oxUTBWSFlsTTBkWFphUkhwYU5ISXlNVWdLU205NGNqSkRUbEV5VFZScVNrZ3lhV3h2V2xoVFJtVk9Wemx2Tkd4dk1taFFXREJqZVM5VFRHVm5hbFo1WWxVeWEwdFBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYyTVcxbENsYzROalpVWkVsRVFYWk9hbXhEV25SMFVUSmlXRGxaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFUVRST1ZFVjNUbFJTYVU1NlZtdE5WRmw1VFcxV2EwNVhVbWxhVkU1c1RWUlNhMDVYVG14TlIxRTBDbGx0VW1wT1ZFcHRXWHBaZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVUZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsT2FYQk1jRXRCUVVGRlFYZENSMDFGVVVOSlJUWkRVamRDT0Zwa2NHVUtaMUZqVFdoVmJYWnVVMHh0V1Uwek5YZEVMMGsxZW5aeE9WUTRRVGM0VVhSQmFVSXZjbkpUTjJzNVpWUnpabk5MVEU5TFJGaHlUVWhDY1d3MUswbFNSUXBuTkZkelMweFRObUl3V0RaSFJFRkxRbWRuY1docmFrOVFVVkZFUVhkT2NFRkVRbTFCYWtWQmEzQTJWMnhCWjNCVFNXb3pVVTVoTldWR1ZtMWFOVTl5Q20xeU5VaEVhbmcxYVRoa2VsQlRhMWt4VVhVNGR6Sk9SR3BJYjNwS1F6TlBjRWRNVTBkTlNIbEJha1ZCYmpncmRUSjVhWFpyYjNKemRqRjJNalZZYTBvS1NHaENLekJuS3pCdmVEUnVlVEpRTHpKNmVHUlBSM0ZzV25aeksydGxWbGRRYVhGTFlteGhLMjFLWW5vS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663807325,
          "logIndex": 3711234,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102081246",
      "sha": "0851054b75d1622ed5dbe3e14d5ce0d8bdc52fc6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

