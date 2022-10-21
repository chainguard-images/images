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
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:e66fee5fe7754b22d18e3d025ba95186f0fc6c04a91580b66be52f51327635cb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e66fee5fe7754b22d18e3d025ba95186f0fc6c04a91580b66be52f51327635cb) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:380a0997ca987ce078dc03c5902e62f7343d4fdd5f5b0d3eff5ee44876b40c6e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:380a0997ca987ce078dc03c5902e62f7343d4fdd5f5b0d3eff5ee44876b40c6e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:380a0997ca987ce078dc03c5902e62f7343d4fdd5f5b0d3eff5ee44876b40c6e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a4e900056c09490fa6210199a579e93c8961867d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDqqEjUEi1uoevXqEN7B0nXN8UJ4jeBwsEfn/qhk9fyjAiEAyM/j5kxjTivKmE+2w4oTRgW1yWaym9XEG45XZIcDeO0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxNjVjOGUxNjFkYWMzM2RhZDkxY2I4OTM5MGY5ZTU3ZjJiMTAwYjc2MmI2OTczMDJmMzcxZGYyMTI5OTIyOGNhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQzMk1pci95djdsOGZNMExqWUNrTmhHUzRNd0E5V2V5TkRFRWlnOTBDUEtRSWhBTld5T2xlQUF6WHBCTlhRZk9lSXA0cG04dDVkdGlZNDlHVlZZTi9DN0oxayIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlZWQmFUbU51ZG1zMlkzcDZlbFl2TldsblNuVkZha2hhY1VGQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hoTlJFRXdUbFJCTlZkb1kwNU5ha2w0VFVSSmVFMUVRVEZPVkVFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZyV1RWcE5FZ3JObVkyT0VSME5tUXpRbGhaVTJsYWNUTmhjVU13ZVZwV1JUaEVkSEFLWW5GUU4zQXJVREZuTlZCd1owRnlhVXRrWmtsd2JrSTNOMHB3YjNvemJHeG1OVWxSZW0xWGVrdFlTVUk0ZWtOVlNYRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZuZFhSbkNrRktlVUpZYVRBeFEwZzFTRGgxVFdFd01FdGlUbnBWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIUlRCYVZHdDNUVVJCTVU1dFRYZFBWRkUxVFVkYWFFNXFTWGhOUkVVMVQxZEZNVTU2Ykd4UFZFNXFDazlFYXpKTlZHY3lUakpSZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUU5FRkVLMEZCUVVGRlFYZENTRTFGVlVOSlVVTTFiRkU0ZUhjcmJuZ0tObTVOVlVkNFVWZGFhRXh3TW5CWk0wWnNTREZOVlhScVRIWkVjbEI1SzI5S1VVbG5VVUpKY2tkTVprNVlLM2QzZW5jMUszQm1NMko2VEV0V01WZElaZ3BTYUhsd2NqSnJkblZRWm5GcVVFbDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsNFFVeEpTRVUwTXpGSU5qRlNaME5TVDNKcGRFVllkWFZGQ2tsWFRHWlFNbU5RVEZOSFlXVTRMMFJwT0VKblRYRmhVblJvYW5Zd1dHSmFkbGxRVlRSNVVtWTBaMGwzV2tSVlJ6RjJaVWQyVlVodFdXWldia041Vm0wS2F6STNhV2RJVG5wWU5FZGhWVFZFV0hRelJrdzRZVTB3Y2tFd1UyOVNjRmhOZWt4TVNtZHpTa0V2TVRNS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666313131,
          "logIndex": 5528841,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "a4e900056c09490fa6210199a579e93c8961867d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3293954954",
      "sha": "a4e900056c09490fa6210199a579e93c8961867d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

