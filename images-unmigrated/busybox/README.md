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
| `1.35.0-r27` `latest` | `sha256:446894c938d287f18c5d72d589eccd3a9fd86a2e7ebb7af1e428de27c2416168`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:446894c938d287f18c5d72d589eccd3a9fd86a2e7ebb7af1e428de27c2416168) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:9690d9a00af0021926e60f408d4ca3095dc3331ed921d31334229665b4ac8946`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9690d9a00af0021926e60f408d4ca3095dc3331ed921d31334229665b4ac8946) | `amd64` |



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
        "docker-manifest-digest": "sha256:446894c938d287f18c5d72d589eccd3a9fd86a2e7ebb7af1e428de27c2416168"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1e7304939584cdde06d754c889056ff0230c37f7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC/TYWzQxalrhp/UHXd0fbSSIM6HljoQ4i5Tjd+iaQXgQIhAISaWrQPTtOm9aPcXyumSN4F2+WeFUKymR9UefENAllL",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZDhhOGRjYzVlYmZlZjk5NDQ4YjI1ODRjYmUzZWIxNGExY2QwYWJlOGYyMDE5Y2Y2NDRlYmI5MzJlOTZhMmI4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURGOCs0K25zVzEvbGZuMkpodXFyR3YzVkNTYVhjLytpYkFQekMrbStMVFlRSWhBUGR0cWcyUW9STElFTmhsZk1zTytBWXJUeWM2NURxL2JDNzlHenRBL3FJdyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVlJFTmlSVFkzUXpRNVdrWkJiVkpNVFRVMGNrbHllSFZrTnpObmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRWTlJFRXdUbFJCZVZkb1kwNU5ha2w0VFVSQk5VMUVRVEZPVkVGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaT1RKSlJGQnNXVGxzTjBoWFQybHFNV1JaTUUxUU9FMDJiRVU0T0VGVE5DOWtVbm9LYUhFMlpIRkhNblZYYW5wM1ZrcFplVzl1ZDFoamFGSnpRa3hNTm5OSVQyY3pkVEZLWTBvNGJHY3JaRU5LTTJjMFptRlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZsVmxWU0Nrc3laWGhLUW5oTVNrNVJMMmR5Vm1wcGVIQnRSVlpOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFUm14T2VrMTNUa1JyZWs5VVZUUk9SMDVyV2tkVmQwNXRVVE5PVkZKcVQwUm5OVTFFVlRKYWJWbDNDazFxVFhkWmVrMHpXbXBqZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUE5rMDVWRU5CUVVGRlFYZENTVTFGV1VOSlVVTjFTekV2VW1NelJWY0tRVUZsZGtsQldXSkNPVm9yVGxKM1ZHZHFjMGhPTkdWUFVIWlFWRlZFYVRkUVFVbG9RVkFyTW5aMlFVVnVlVXhtYXlzeVJpdEJlWGhJV0ZCdlMwcHpUd3BVVTBWc1pVcE9WbGRaV204M2IxSjNUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRWRkVTa1UxZDNkNmQyTlFTVGc0UVZaNFRreEtWakJYQ2xaR2NYSkJkMFkwUkdrMFEwNXllRVV5ZGxjNFp6YzFjazluV1ZOS2MwMVVOWEZVT0cxVU5tNVpWMmREVFVoTGNuQm5SM296ZVhGWE9XSlRRbEJaY2lzS2VVMW9VVVkwUkVWU1ZrUTNUMHhtY2xCd2J6QnpZV3g1ZUVOSlMwVTFLek5WVVVkSVVHWm5VVzB3U0RWMlp6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665276341,
          "logIndex": 4723723,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "1e7304939584cdde06d754c889056ff0230c37f7",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3212350585",
      "sha": "1e7304939584cdde06d754c889056ff0230c37f7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

