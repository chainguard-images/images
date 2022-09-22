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
| `1.35.0-r25` `latest` | `sha256:279c4f1276b223097b473968f6c5bb90e3bd15ee1a7a9f7d4a58a48231843e13`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:279c4f1276b223097b473968f6c5bb90e3bd15ee1a7a9f7d4a58a48231843e13) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:4d0edf825f8f6b0fc3a47cd6770bd435a8436097ca5e570dabfd605ed95979b6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4d0edf825f8f6b0fc3a47cd6770bd435a8436097ca5e570dabfd605ed95979b6) | `amd64` |



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
        "docker-manifest-digest": "sha256:279c4f1276b223097b473968f6c5bb90e3bd15ee1a7a9f7d4a58a48231843e13"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "18cd8ff83ff8b4bfe7faef28ae17cde0a9776156",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDWqpKYQDPOcLtcvWMg12pcaWBfsiWVFpCRjytqZfRkxAiAzaLUPXoq3E8EpGPdea+fRFMxOMP/1saC4paYboZvFVg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwOTZkM2Y5YjZhNTdkNzJmODE2ZGVkZmJkMDZiOTNjOGRiZDFkNTk5NjY1MWFiYjk2MGMwZDFjZDkwZGJiODcwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR3M0WTVFUDRjQm1Ka1dVL0owMmVUR1JRcTh6NmdveTJkMHBFVXJKR3habkFpRUE1UFhhMEQvSDgzaFFNa21wbkxyQjJRMTF4SFJocCtwU01DdEdvK3VrK2tNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwRFowRjNTVUpCWjBsVlRHNXNUbWxUYkhjMlkwUlFWMFEzWmtkU1YyTlNTMmswU2s1dmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlZFMTRUVVJSTVZkb1kwNU5ha2wzVDFSSmVVMVVUWGxOUkZFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZtYUZadWMxTlNOVlkyY1M5emJrdG5PRTVLTDJkU1ExbzBUV2hQZUhSYUszRnlSRFVLTUZGc2FHeEdSamhSUWxsb01XeFNSelV4WTNVeU9UUkRNbVppU2pCUmFXcEdNMUY2TUhSQ1JrUklkMkZZUWtWUlFuRlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZPYWtoNENtbG1NalZhTjFkRVoxSnlkVU5CTDJKME5Ha3JNVzlOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWtsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVKSVFqRmpNbWQzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRWUm9hbHBFYUcxYWFtZDZXbTFaTkZscVVtbGFiVlV6V20xR2JGcHFTVFJaVjFWNFRqSk9hMXBVUW1oUFZHTXpDazVxUlRGT2FrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYmtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKc2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1YVdSWVRqVlpiVGswVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVhkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpsQ1NITkJaVkZDTTBGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5NbFpUWTJ4UlFVRkJVVVJCUldkM1VtZEphRUZNUTI5eVFWaG9VV1V3VnpsblIyTUtURTVpUkdveVZUbFdSbGh1U2xsaVNFaE5kMkpNWldnMFpGTllRa0ZwUlVGdVJtVm9XV3N5ZVZKRFUzVlljbmwyZHpCcVZFazFXR3BQT0hnMk5rWlFPUXBMVURGRWFqWTRjV3hGUVhkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVVGQmQxcFJTWGRZYldkb2JrSkdiSGxpYkVKcVJDdFpRMjlYVkhCelVFbDBPRUZvQ2xSbmNURlNZelpwUVdwTGJFRk9XbTVsUmxkR2NGWlRPQzlJT1hKUFNsYzRTek12UkVGcVJVRm5SMEp0UVVsdU5tUjFRVGhYUkZoalJWWkhLM2xGT1VnS2VuQlNNRkJITjJwUk9VTm5lV0pQTW1GWmNtWnZhMDR2ZWsxVVREWnhXbWxxYjBOTkwyY3JWd290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1663852273,
          "logIndex": 3746117,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3105727086",
      "sha": "18cd8ff83ff8b4bfe7faef28ae17cde0a9776156"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

