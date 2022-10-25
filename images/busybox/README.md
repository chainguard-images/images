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
| `1.35.0-r27` `latest` | `sha256:8cf08ba4d2c12f40495a565b2e586021a2e9945181af215356436b1b01e3989b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8cf08ba4d2c12f40495a565b2e586021a2e9945181af215356436b1b01e3989b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:21e1b9ab1be8a07fdc889b5af0b4e637f216e37afe7e918e0f74d45d93995df1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:21e1b9ab1be8a07fdc889b5af0b4e637f216e37afe7e918e0f74d45d93995df1) | `amd64` |



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
        "docker-manifest-digest": "sha256:8cf08ba4d2c12f40495a565b2e586021a2e9945181af215356436b1b01e3989b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "71bbd15cb113c8f60e616f6a3ac9e805321350bc",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIANs7sE++tHz9jG6RCjtHlbR/ZSyGCdTlD6Swfsj9ONFAiEA6NIAiiPUge+BXAcQJ17+c9G9ZtcDeJGhZHQL81nMz+w=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5Y2FjYWYxNzMwOTdjYjIwYWQyMWQwZDU2ODhkYTJhZDcwZTc3YjQ0Zjc0MDk4MDYwM2Q4YThkMTViMzM5NjU2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUM5Z1hBd3lzZ1FQTk9EMW5hZFV3a0NGa2VZR0VpRnk2dXFneTExbXd1L3VRSWhBTDRPQ0tZVUVOdFpTTUZ3a2E1SWE5UzF6Nnd3bTVJUUd2S3d4eVEyazgwQiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwUFowRjNTVUpCWjBsVlJsSlBPVFJ0YjFSTlZFZFNSWE5rY1RFMlZHRk5PVk5uTlZFMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RGTlJFRXhUbFJKZWxkb1kwNU5ha2w0VFVSSk1VMUVSWGRPVkVsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTTkZSTmJXSk9VMjVZU2pJMlFtNDNiMFk0Y1VaeWN6ZHhWMmhSWWpOdldGcHJjbW9LUTBaNk9YcHNNMnhEVVhsVlMzY3dORlF4YWtVMmVVaENXRVJ5YkRaV2NXWmtXVXRPVUVkR2VsVjFhWE56U1hOSWFVdFBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHU1U5SENuVjFhREpWS3pCNE1FaEtUalJwVkcxQ2N6SkVlVGgzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFWTNoWmJVcHJUVlJXYWxscVJYaE5NazAwV21wWmQxcFVXWGhPYlZreVdWUk9hRmw2Ykd4UFJFRXhDazE2U1hoTmVsVjNXVzFOZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUlRXOTNOamRCUVVGRlFYZENTRTFGVlVOSlIxSTNkRmxqV0dZMFMwWUtlRlJ2Y25KYWIyRm1UemRyYm05M1NUSlVZM2N3V1d3eVVUUkllVGw1UTNCQmFVVkJOelZIWjNSSlJsbFBlRGxUWTNCd2VIZFZha2c1YTJGT1NHWlNhZ3BsUTFWSGJteHVLMnA0VW5BMVVXZDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRlJRWGRhWjBsNFFVdG5hRWx0TlZaSmEwTkRaa0o0UldoalZWUm5NRUl4Q2k5ME5WWldVbWhqT0dGSlNuQkhjblVyV1N0dlZWbHJTalJyYUdWblR6WkpjVXhwYlRKbWFWaE9VVWw0UVV0T1FtRllkazh5TVdGNFJ6WmhjREZHYlRZS2JtOWFURmRSV1dwTVVIRjBibmxHTTJFMWJVNUtWamRCWlhaTGJEQkxZM2N5TW5oQlNVdzBWa1pPVlRsMlp6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666659344,
          "logIndex": 5801763,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "71bbd15cb113c8f60e616f6a3ac9e805321350bc",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317354908",
      "sha": "71bbd15cb113c8f60e616f6a3ac9e805321350bc"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

