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
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:2c1203c7f92a00a983ab281d75d6161a9fcf8e69a6f38f6fa6bee8b5d295cb6f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2c1203c7f92a00a983ab281d75d6161a9fcf8e69a6f38f6fa6bee8b5d295cb6f) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:0377d31ab610c891dbd7904e8ac89899466e0298d6ec6f10d399f01e81fd2470`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0377d31ab610c891dbd7904e8ac89899466e0298d6ec6f10d399f01e81fd2470) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:0377d31ab610c891dbd7904e8ac89899466e0298d6ec6f10d399f01e81fd2470"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "57c95338b7136d877527648ea6022d2398641919",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCv4wT3Ez1qAmb5vlN9jnFXEDSzw+WrLo3Pm99nhK82rQIhAK/541EtVrnVSzefkEwSxQhOAPHf3ts1SaO4TcYiDsgg",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiZWNkY2ZkZjFjMjQ0OGY5YTRhZjhiYWY2YTEzZGQ4M2I4YWY0MmRjZWY5NWQ5NGQxMTA2ZGNhN2RiMTEyMDc4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQnNJdjRDRHdTci9xTy9qZ0wrQnUrbHUzbmgvaVNUSlA4R1hZdTJQSU1yc0FpQkM1UUdYVzdRN2V1dlhXeCtxWWtzZTlVMHM2TFRMY3NmV2FPVVVZbFlaOVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVldVZExVbWM1WW1aWlR6RjNhVE4zTW5KUWVqZFJabVJ4TlZGbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRGTlJFRXdUV3BOZUZkb1kwNU5ha2w0VFZSQk1VMUVRVEZOYWsxNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYzTkZJdlUzaElVMGQxYUZWM05reFBWMk41TVhrMlEzcHNaekFyTkdoaE4wNUNkWEFLTHpOaGVITTVjMGhZVlhBNGVEVldlbmRVZHpad2JIWjZZVEJ4WjNvMWVUTldiVkJJZVdGME9XRk5SVWxJV0VvemRFdFBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4VDFFMENrMVJhMHgyV0haa1VFVTNlRU40TTJkNGVtRlRVRFJqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVlROWmVtc3hUWHBOTkZscVkzaE5lbHByVDBSak0wNVVTVE5PYWxFMFdsZEZNazFFU1hsYVJFbDZDazlVWnpKT1JFVTFUVlJyZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU1JsQlViMVJCUVVGRlFYZENTRTFGVlVOSlFtODVaMjFVVEdkSVFtZ0tkMGt4UWtWbllWbzBUVmh3TlRFclNGcHlkbFJMU1RreGFGVjNTRTFzWjIxQmFVVkJla1I0TlN0YWRtSmtNelJYV2pSbVdrOTZkM2hTUjNoWFNUVmtWQXBEU2xSVlpVcFFjazF4WVRReFVUQjNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsNFFVNVVjM0J4VkRscGFUUlRhMGRzZWpSVlpXdzNNMGhwQ2tZNVV5dEVLMGQwVWxSemJFNW5aRVJrYlN0SVdYSmlWM0UySzJ4cFl6Vk1OVXN3U0dGek9XWm9aMGwzUms5WGVHVlBRM0V5ZVZJeUt6SlVSV2hSUW1zS01uZDNORU1yVTBsMmNUQlBZa0ZoVFhKWk5pOVhjVFZUUWs5R2IxbE1TRTlzTVdKRU9HOVFaMVk1T0ZRS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667608984,
          "logIndex": 6528255,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "57c95338b7136d877527648ea6022d2398641919",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3398011964",
      "sha": "57c95338b7136d877527648ea6022d2398641919"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

