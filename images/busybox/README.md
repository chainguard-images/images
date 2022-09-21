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
| `1.35.0-r25` `latest` | `sha256:c0e5acaa37d75594970c722938c9e28d42a886a30b6bf20bdeaffc746683e52d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c0e5acaa37d75594970c722938c9e28d42a886a30b6bf20bdeaffc746683e52d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:1c6c1507007c25c6e57df783af556a91befcee822863e77d628452cd92ce6e35`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1c6c1507007c25c6e57df783af556a91befcee822863e77d628452cd92ce6e35) | `amd64` |



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
        "docker-manifest-digest": "sha256:c0e5acaa37d75594970c722938c9e28d42a886a30b6bf20bdeaffc746683e52d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "366fd18897107bdbbf54f2b55b9b4b173bae3f87",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQChseQC05FOOvdVMrnNhIdbINESx33XsypyDm5zTIIQmgIhALQ5AAnMF7yhrZ1B0s3KIbPxIoknidsjdhn+CGDVNe/0",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzMzM2N2U2MDJjMzgxODI4N2I3NTQ1YzBmYjU2NTA4NDhiNTIyOGQzNjFlMDFlODI2YWY0YjY3YWI3NGY0MTQ3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUR2T2pHM1VXa2xOQ2NDMy9kRklxMWV3VEFFRzlaZGlld1d5MEFINjNNWE13SWdUdTRYcmtnVXBKUEswblJUY2hnRWE3K3ZUcDRkQUJMV3ZuV0dwSG9oUk1zPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlYyVk9kVVoyV0hkMVFVVXdlVkJ6V0dZd1pHUlZTbmswZDNCWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJFRXdUa1JWTkZkb1kwNU5ha2wzVDFSSmVFMUVRVEZPUkZVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZqYVZWYWRsWnVWMkZQY0ZoNmFucFNVbFJRWTJRNUswcE1aVXhIWlN0WmMzVkdiR0lLY0ZkaGFHaEpORUpKUkRRcmVWcFJjRFUxWjFrdmFWWmtWakZGVVZFek9YWmpXblZRZHpodmJtVlVUblU1WlhweE4wdFBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUzYm5nekNtdFhRWFpYVlZsWVFqTlVTbVIzY2xSQ1RIRkRTVFF3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVFRKT2JWcHJUVlJuTkU5VVkzaE5SR1JwV2tkS2FWcHFWVEJhYWtwcFRsUldhVTlYU1RCWmFrVXpDazB5U21oYVZFNXRUMFJqZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsT1pHZFZOWEJCUVVGRlFYZENTRTFGVlVOSlVVTnBjazl4TlVKMmVtRUtiM2hwYTBvdldtSjBVbkZaZDFkdlRtRjFNVWt5TW1SMmRWbDBjMlIxTUc5UFVVbG5RMnBVYm1KeFdsQXhObnBWZVVsQ1ptTXZhM2xPTkhWbmEwUXpiZ28yVm10T01rRlZValpLTlhseFZEQjNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsM1ZuTk5aMDlJTVVRd1ozTjFVRFppZFRaVlUydGlORUZIQ25wVlVVdFNjREZJVEM5SVYwMDVkMU5ZSzFoaGRFTm1ielpwTTJob1JUZHZaV1UzT0hadGNGaEJha1ZCYTJZeFlYRnJTemhEYzJScWNFczRlRzVQU1ZFS01FRTNiazVzVHpnclNXeG5aWEJXVnpsSlMwMHpUaTloVTNWUlRFSkxiVFpoY2pSRlJ6TkxiMnB1UWxFS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663721117,
          "logIndex": 3641025,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3094433300",
      "sha": "366fd18897107bdbbf54f2b55b9b4b173bae3f87"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

