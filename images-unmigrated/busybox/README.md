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
| `migration-20221118` | `sha256:39dea1a94868c1a11fc74dc5a2a1328af01395d366d31bda37e61a733471ba52`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:39dea1a94868c1a11fc74dc5a2a1328af01395d366d31bda37e61a733471ba52) | `amd64` |
| `migration-20221119` | `sha256:07a495a46b6704450af118a41cbc36a4320422fd7535b0cc99348bb6c2abfeb7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:07a495a46b6704450af118a41cbc36a4320422fd7535b0cc99348bb6c2abfeb7) | `amd64` |
| `migration-20221120` | `sha256:2a7d898f40e8b2f55463e5f2bdcb709e33bbe1ce430095c8a617514357dd33c4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2a7d898f40e8b2f55463e5f2bdcb709e33bbe1ce430095c8a617514357dd33c4) | `amd64` |
| `migration-20221121` | `sha256:9003567c9b7089cfc6e88f2e563a8e84292110ffac4de90ef13f3a07798fc454`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9003567c9b7089cfc6e88f2e563a8e84292110ffac4de90ef13f3a07798fc454) | `amd64` |
| `1.35.0-r29` `latest` | `sha256:ff007da950686c39c5de1cbb7bd92312224a45d3ae30a5b4d50118b12a27f2fa`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ff007da950686c39c5de1cbb7bd92312224a45d3ae30a5b4d50118b12a27f2fa) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r27` | `sha256:6e15c273db2649e47463d6672da8075fb458d403d5f0bfb17c2bcfc6f6306676`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6e15c273db2649e47463d6672da8075fb458d403d5f0bfb17c2bcfc6f6306676) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r3-glibc` | `sha256:3e96c6676ccf287c2bee102fbffe2a26c51dfdad72f960342ca2b9182f626cae`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3e96c6676ccf287c2bee102fbffe2a26c51dfdad72f960342ca2b9182f626cae) | `amd64` |
| `1.35.0-r28` | `sha256:a76db118b1ea701cc995e8403dff6fcfc93a1970c909f75114b6ddd2593f04df`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76db118b1ea701cc995e8403dff6fcfc93a1970c909f75114b6ddd2593f04df) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration` `migration-1` `migration-1.35` `migration-1.35.0` `migration-1.35.0-r3` `migration-20221123` | `sha256:ff03e7209d01ae5826b8f82a0ae9446ad7f537c1abe55f9b66acd8c5d4a41483`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ff03e7209d01ae5826b8f82a0ae9446ad7f537c1abe55f9b66acd8c5d4a41483) | `amd64` |
| `migration-20221122` | `sha256:4202e8da4c9436aa6e8f2dc96e75b8444a70f37e02e118500fd7bbfecc921a12`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4202e8da4c9436aa6e8f2dc96e75b8444a70f37e02e118500fd7bbfecc921a12) | `amd64` |



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
        "docker-manifest-digest": "sha256:ff007da950686c39c5de1cbb7bd92312224a45d3ae30a5b4d50118b12a27f2fa"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b319d079e945d2939b8f8368b1f9f2b1555efafa",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDJJc/kpMII3VTiWvD9hTj+swkVLvCZzCApHPTC9B+EtgIhANfUa/yiNV5G2hj4U+OraD2zh/auKFEOzZ0UFqDnB1pK",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0Y2ZhNGQxNjQ0ZjVhMGMxODBlODc5YTQ5ZTM2YTJjNDRkNWY4YTQ1OTY5MjZlOGRjOGRkNzhkNmQ1OTA1MjJjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQTFMTk0wdCtpNFJjTXNIWkdZYWtRYnVaTTk3a3dxRnI5UjYxdGk0YU1YZkFpQkR6OXZCYWNqRFBRRG4zVVY5ZzFxQS9tSjUrMEpKeHRxNDB6M1ZCR01icUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwUFowRjNTVUpCWjBsVlpqZ3lWa050Y1hNNVJWaDVRamxvT1ZKRE5uaExhRGRUU1dGQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVU1RCTlJFRjNUV3BWTlZkb1kwNU5ha2w0VFZSSk1FMUVRWGhOYWxVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3ZUdsWU9VWlFlV3hTVld0TGEzZ3pTa3MxYUM5ak5sZEdWRnBhUjNFMGJtdHlTMWtLWlVkc1ExUmpaaXRsYkZaeVRsazRNSE4yTmpoSE56TjVUMWxTUVRobmVrNXZXbFJDY0RoS1UwRmxjbXhGUjBwemIzRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ2UkVKMkNqUmFTeXR3UW5sT1FXSktUa2x0TUhKMEsyOXRSWEpaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIU1hwTlZHeHJUVVJqTlZwVWF6Qk9WMUY1VDFSTk5WbHFhRzFQUkUweVQwZEplRnBxYkcxTmJVbDRDazVVVlRGYVYxcG9XbTFGZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsVGJUaGtkekZCUVVGRlFYZENTRTFGVlVOSlIwVmtlREZOYW5CaWRXVUtjRWRRUWswM2RGbE9Samh4YnpWUFNIWnZOekJPVGpSU1dtcHpNMVZVTDNGQmFVVkJlV2hZYldsT1pDOVVOMmcyTDBFd05uVTVhVUUzZEUxRVQzbFNjd3B5VWs1aWJrVkZlbHBpVEhoVVV6aDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRlJRWGRhWjBsNFFVNXNZamxsSzA5NUwzaExhR2RMT0V3NVJVNU9jM1V6Q2t3eFZFRnVSR2xRYlVGYWFGRldXVGhzV1RoUWJIVkRPR3BVVVM4NGRrdDFlVkp2ZUZBMGRFWmpVVWw0UVVveVluQmFUMHN5VUdaemQyeHNZbGRPY0dnS2JWcGxhVlZsYjJJeldFazBZVzFCTW5GdlFXcFFRVzFPYzBaNldtMTJiVXRoTUVWaFRGVk1OMUJ6TDFaR1p6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1669248205,
          "logIndex": 7721389,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "b319d079e945d2939b8f8368b1f9f2b1555efafa",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3536565203",
      "sha": "b319d079e945d2939b8f8368b1f9f2b1555efafa"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

