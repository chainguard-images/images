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
| `1.35.0-r27` `latest` | `sha256:05d1610909a7f6e095d4bbc5c742fd9ab335fab6aa6582c03942ee7517ef954e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:05d1610909a7f6e095d4bbc5c742fd9ab335fab6aa6582c03942ee7517ef954e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:e66fee5fe7754b22d18e3d025ba95186f0fc6c04a91580b66be52f51327635cb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e66fee5fe7754b22d18e3d025ba95186f0fc6c04a91580b66be52f51327635cb) | `amd64` |



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
        "docker-manifest-digest": "sha256:05d1610909a7f6e095d4bbc5c742fd9ab335fab6aa6582c03942ee7517ef954e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "b12a8c9987371b39e5a1e99de3c7a18e9066a8a1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDXGNzrHvSlurrz90LTuelZnYUZ25qSalPVfWflvefnwQIhAJQW7CNTs+i4eWjN1fkFdeUEHkg683fDJGNLJd5dUjc3",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyMDM1MjBlZmE3NDg5YjIyZjBiZDk4YjFhMDY4MzkyMDI2NGMwN2U4NjhlNDY2ZmRlNjI2NzJmN2E1ZmVmZjQyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ2dzSWRlYUtxbTl0UU94QVdERkZJRmpxdDhWbjU2MnRrNjVYM1BSbmFPYkFpQUQ2MEQ5N0hoMGx6TDFOY0haRE1NK2FvS1FaV1o1VmMvdFEzeGc5bUM4ZUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrclowRjNTVUpCWjBsVlRrMUVUR1V4ZEdKeFNuZG5ZekZOVUhwSlRFbzVhR1ZTZG5SM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTmFrRjRUWHBGTWxkb1kwNU5ha2w0VFVSSmQwMXFRWGxOZWtVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZGY1M5S2FUWjBSV1ExVm01NVR6QXJOemd6V0hwWldVZFRNV0pZUkZaQlkycHBNbklLWmxKTlptRjFiMUZOTTFCc1dIcHVSME5ZVldsd2FYTlljR040Y1ZJNVZuUTFRWEZJUm0xQmFVdFRRbTQwZVUxWWNqWlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZZGtaeUNqUm5UM1kyZVhSdU0xSldWR1ZhUzJNMWVtRk9TM1ZCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWtsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVKSVFqRmpNbWQzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldXcEZlVmxVYUdwUFZHczBUbnBOTTAxWFNYcFBWMVV4V1ZSR2JFOVViR3RhVkU1cVRqSkZlRTlIVlRWTlJGa3lDbGxVYUdoTlZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYmtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKc2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1YVdSWVRqVlpiVGswVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5MMk5JVmxrMFFVRkJVVVJCUldOM1VsRkphRUZQUzFOTmFrSjBhazlaYkRkbVpFZ0tLelZsUlhaUE5GZFdWbXMyYm1aNWJ6bEtkMjVHY2pGb1VUaE9lVUZwUVVkUVYxZHhhM3BHU2tGMGJsSnVVbVJFZHl0Q09WbFVOMU4yV21aQk1tNXljQW8zYTJSemVHRkdaM0pFUVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV2UVVSQ2JFRnFSVUYyT0RKRlNGWnpURzF1YUVsa1VXOVFNRFpvWTNoa1YwSXJUa2c0Q21Oa1VHcHNkbE5ZVkhGWlYwaDJOMGRWVlRWUVNXOXBWM05QVFdseEx5OVdZMlpST0VGcVFWVkNRemhPTkhoSmJWVk9SMHR1WkVoalIxbHdPVkZ0Wld3S1RGaE1ZMlJxVVVaUlNHbFRhRmxCU2tGbWIzTlNiblpWYVVsRFZrNU9TMXBUZVZaelVtTlJQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1666296816,
          "logIndex": 5516518,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "b12a8c9987371b39e5a1e99de3c7a18e9066a8a1",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3292624053",
      "sha": "b12a8c9987371b39e5a1e99de3c7a18e9066a8a1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

