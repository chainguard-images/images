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
| `1.35.0-r27` `latest` | `sha256:e3bd3f428a6171b4a1268b21f85159aa1723fd589c04016884b626b0ec4d1166`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e3bd3f428a6171b4a1268b21f85159aa1723fd589c04016884b626b0ec4d1166) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:a1f60b662b2d08724878d078e585ab290d5f073524f5812a81386643ff2f5913`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a1f60b662b2d08724878d078e585ab290d5f073524f5812a81386643ff2f5913) | `amd64` |



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
        "docker-manifest-digest": "sha256:e3bd3f428a6171b4a1268b21f85159aa1723fd589c04016884b626b0ec4d1166"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "10af7034ede96e77cafd778f935a3a99303903b9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCj9arxhm+709ng4wzT3Xnynw2WfX7hj5awY9r27pb3hAIgM41DL0vsWZ+LzcdKLAsPTkamdRicQn1mlyQYuC9r4DE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5YmNhMjMzNGQ4NWJhY2IzYjE2Y2ExOWMyZjkwYzFmNTMwM2YzNmFkMzQ4NTEzMzc0M2MxNzI1ZGU2ZDBmYjkzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQzRZeFh1Yy93dlBaWHNGRjFaY1F1Mk52VndSTlpYc3AzdXA3U0pXR25NR0FpRUFnelh0dUZTcTh2TlVPdms4Q1c3Yzc1MXAySm1wbS93WEU2aFJYTlUxVXpRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwUFowRjNTVUpCWjBsVlNXMWtaV2xaZUZnMFVrRnJkWGhYVGtaRmMweFZRblZ5U2pGWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRCTlJFRjZUbXBGTVZkb1kwNU5ha2w0VFZSRk1FMUVRVEJPYWtVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZLVEdKNFptdHBTR05OVEV0VldDdG9jMUJWYldaT1IxbEplRFpZUkVzNFMzZExZVWtLTm1oelZWVkpRVE5PZW1sdmQzZGxaM1ZMZDBNM09XdFBSMDFOY0Uxc1pHSlBiM1o1UkVJeWEwRTVaMUYwV2psTVRHRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU1ZWpkRUNuVnhiVVJNYlRCb1dITk1lU3RYY0RKb1Z6QXlaWGMwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFUlhkWlYxa3pUVVJOTUZwWFVteFBWRnBzVG5wa2FsbFhXbXRPZW1NMFdtcHJlazVYUlhwWlZHczFDazE2UVhwUFZFRjZXV3ByZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU2VtdE1iMlZCUVVGRlFYZENTRTFGVlVOSlVVTmxTR1pTWkVkMVEySUtPWGhHWXpVeFZWWXJTaXRVUTI5YVlVMTNXR05DVG01VEwxRlZibWc0VTBzNGQwbG5RekpDZFdOT01IRndOMjgzSzFkMWRXZDJiMkpMVUZsbGMzaHhlUXB6YlZGeFpHWnBaRGhwTWxKUlkyOTNRMmRaU1V0dldrbDZhakJGUVhkTlJHRlJRWGRhWjBsNFFVOHZRV3BQYUVwaVpYWkxiMFZEWjJFdkwzaFlSbkkwQ21NemVIVjRVVEJLY1VkUFRXcDNOVEZSWlVWaE9YUTNSVkJMV25aMWRsVjRUWEJ1YWtncmVXbHZkMGw0UVZCaFdrMHpZVTF2ZDIxV1FpOU1jMjQ0YkhBS2JYZHRaazkyTlZoNmNHWmtSVWRZTm1kVVNFSm5VV0V5TmxnM2RtRjJhVGswWjBsdmMzTTRVRGc1Ym5oWFFUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1668386199,
          "logIndex": 7020908,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "10af7034ede96e77cafd778f935a3a99303903b9",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3457635837",
      "sha": "10af7034ede96e77cafd778f935a3a99303903b9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

