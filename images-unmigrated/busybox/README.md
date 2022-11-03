# busybox

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml)

Container image with only busybox and libc (available in both musl and glibc variants). Suitable for running any binaries that only have a dependency on glibc/musl.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/busybox:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.35.0-r27` `latest` | `sha256:35e7dbb0f7d0f58d1574b1aa53b066122b26fca2bc75645f8c94e1ccbbc738db`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:35e7dbb0f7d0f58d1574b1aa53b066122b26fca2bc75645f8c94e1ccbbc738db) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:803d8955895d32e0a66a61a7e5419c093eaea5a16b887a99f8502bb465455dee`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:803d8955895d32e0a66a61a7e5419c093eaea5a16b887a99f8502bb465455dee) | `amd64` |



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
        "docker-manifest-digest": "sha256:35e7dbb0f7d0f58d1574b1aa53b066122b26fca2bc75645f8c94e1ccbbc738db"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9e1f179a2e422415cbeae234b4d2c827c537d05e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAFQmlGZ5KsoPtaKnJgcm1eiBGAeZv/vJRHgrvP6CGt5AiANyGT5+kGe3rfPAuSijALjmrpLmS1lEbcgOAP9/o4i+g==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZmYxMzFlZjhhZmFiOGUxMmRkNjU4OGM1ZjFmZmI5NWM3ZTRiOWUyOGVlMmUwYjY3ZDIxZTE5MDQ3ZjJjZjFhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQkh1YlBHT01kUmczd08rTVRIODcxZjZzY0tkVTdDQjBtZGxnZjRuNGVQQkFpRUFvM3NVVXJ5TkpXUlliQTVWOUJWeGZUMitoWEs4QjN5MGx2eFhBejdEcDNBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwUFowRjNTVUpCWjBsVlNtaDRiR05MZVVwbWNrbDNlR3RIZUdacGVqbEhORkJLZHpJMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlJFRXdUV3BKTWxkb1kwNU5ha2w0VFZSQmVrMUVRVEZOYWtreVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZNU0ZsTE0xQmxlVFZwYkhoWk1VbEliVzVGVEVwTFJYbFphV3RzY2l0cGEwTkJMM1VLTm5WRFpEa3hWM0ZpYkcxcWVUZDRVWFpSUkVsV056UnZibkp3ZEhKRlNtbDZXWEpaTUVWWGJXaGlVbXhzWjBaalozRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1YzJ4UUNrWlpZMmRsYm1GdU5EQjFZaXRMUTJ0TFp6UnRiSEZWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFYkd4TlYxbDRUbnBzYUUxdFZUQk5ha2t3VFZSV2FsbHRWbWhhVkVsNlRrZEpNRnBFU21wUFJFa3pDbGw2VlhwT01sRjNUbGRWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsUk5qaElSVVZCUVVGRlFYZENTRTFGVlVOSlNDOHlZMDV2Ym05VE56RUtObVJVVlVWUU1HVmliSEF4UW5CTFpHcGlabkIwWm5OUmVqUndSa0puTDB0QmFVVkJNMUJKZERBeFlsTnNOM3BrYWxVcldHTldhMEl6VWk5R1FVRXdXZ3BNUzJ4TWVFTldlWGhGTUdsamF6QjNRMmRaU1V0dldrbDZhakJGUVhkTlJGcDNRWGRhUVVsM1JsWk9jSGsxZFRablJrRnBkWGxLUW5CS1dFaFlWWFZEQ2tOclZEQkxXSFJPTTA0NGVXVXlhRUZZYkZWaU9GcE1aREptYXpWUmNVMUxheXRQUTBOS2RVSkJha0V5WkUxVVQzcEZTRk5RTlhaaWFEQTVUMjkwVjBzS0wzWkZWRXRJVTFCclYwRnZSV1JEWjFWU01FOHZibXhvUVZsd1lXMVllSEl3ZERSRk4xQnRLM0owYXowS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667436172,
          "logIndex": 6391747,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "9e1f179a2e422415cbeae234b4d2c827c537d05e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3382183334",
      "sha": "9e1f179a2e422415cbeae234b4d2c827c537d05e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

