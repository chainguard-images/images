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
| `1.35.0-r27` `latest` | `sha256:eafbe7cd4f0bda6d0cb0226c902e96a74ee2d409ddb65a5a1fec1469ca3e04d1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:eafbe7cd4f0bda6d0cb0226c902e96a74ee2d409ddb65a5a1fec1469ca3e04d1) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:3ac99b2585336571142491351ebd0527eb7930cfa8edbb1c7b8e1fe27afeda7f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3ac99b2585336571142491351ebd0527eb7930cfa8edbb1c7b8e1fe27afeda7f) | `amd64` |



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
        "docker-manifest-digest": "sha256:eafbe7cd4f0bda6d0cb0226c902e96a74ee2d409ddb65a5a1fec1469ca3e04d1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1e2dfa71b36ff16ebb11cdcf2c89930b7b4bce19",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAJDSrD/Fk1bCI8vkN+BTRCizidPwmqPUiWdxHPIEr5oAiEAg/Uh06XWtk2I4A0SX2oGpnZn95D7YTuUvF538lkMq3Q=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwOTlmNGMxMzk3NjZkNmJlMDM3YTAyYjljY2JhYzc2ZmZmZTk0MDg3YzlkZTQxNGE0NzZmY2E4MDk1Y2YzZGFkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRU1SQmcybWE1MTIvU2R4RjZRTDZxb3kyVFJjSy8xWTV4Y3Q4WUVyanFvUEFpRUFzT25TYW9IaHh1OWRPdUlQRXhoQmZIeVJ6OWtCS3Rka1VkSVhzZVJHVExNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwTFowRjNTVUpCWjBsVlYwSnJjVTVqZDNKeFVIZHpPVUozU0VneGNtZENhbU15UnpWQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFRjZUMFJCTWxkb1kwNU5ha2w0VFZSQk0wMUVRVEJQUkVFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZIZG1wVmJWSmFWMjF1TWtsR1VUSlNVa2w1WVZOMFlXbDJiR2x0VXpKM01WaFZXVTRLYUZSTE5rWllhMGRRY0ZZelVHeHlPWE4wUjNFcmNURjBaMlZ1T0hwMk9XUndPRU0yWVZsT1dYUk1WQzkxYUZST1REWlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZrVGtkNUNrOTJjMm92ZEdaWFdVcENLMVZ1YkVsUlJXOU5MMEp6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFUm14TmJWSnRXVlJqZUZscVRUSmFiVmw0VG0xV2FWbHFSWGhaTWxKcVdtcEthazlFYXpWTmVrSnBDazR5U1RCWmJVNXNUVlJyZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVVJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU1VHaGxaMFZCUVVGRlFYZENSMDFGVVVOSlJYRXJRamRvWkhOQ1RYZ0tOMUJWYVdoNFpXZHFRMWhJTkhNNFNYQllWa1JzVTBoV1MwNXZWeTloVTJSQmFVSm1hMHhaUkRsR1VUZGFWR05aV1dSMFEwTTVSVEJhVlU5SFJHODVkQXBwTTFNeFpETk9aMFJUYTJ4a1JFRkxRbWRuY1docmFrOVFVVkZFUVhkT2NFRkVRbTFCYWtWQkwyeHhNazlNTTJKb1kwNVFUbTVzTlcxeGVETmxXbGhGQ2tNekt6RktNbHBoVDNkbGFtdGtiM00yWWt4c05rSTJjamhuV1dwdVNXaDVlVFpJZUZSNmIzRkJha1ZCT0Rsa1VqUnZlRlF3TlZCc2JWRkJSREZsUm5vS1FXUTRZelp1U0U1NWFHVnlOR3RoVkZWeVRqaEtVazFSYkdaelFWTkZXWGcwYWtSaFRscHNhRWRtUkRBS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667781518,
          "logIndex": 6648819,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "1e2dfa71b36ff16ebb11cdcf2c89930b7b4bce19",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3406706892",
      "sha": "1e2dfa71b36ff16ebb11cdcf2c89930b7b4bce19"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

