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
| `1.35.0-r27` `latest` | `sha256:bf317df9f81604e03ec93b27fe62fa2ebaa2d7a5d61372d009f923dfcba2d74f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bf317df9f81604e03ec93b27fe62fa2ebaa2d7a5d61372d009f923dfcba2d74f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:80a8bd58f870fbe8a3ba4804200ab2af0d3a9e69dbb221daaeb478f7344521e6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:80a8bd58f870fbe8a3ba4804200ab2af0d3a9e69dbb221daaeb478f7344521e6) | `amd64` |



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
        "docker-manifest-digest": "sha256:bf317df9f81604e03ec93b27fe62fa2ebaa2d7a5d61372d009f923dfcba2d74f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ebafeacb86d15b04a133bf4cc10ea83c873d7b05",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIB/69UZRZr2wNw5nTcAVTrh7dGZ4t28H+V2C809y4Ex/AiEAxHKdQPd4UmCVVz/gdOiv4K1qgo2rthIzph+jt2elz+c=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNjMzODJhMjU3OGJlNDM0YzE4NmQ1YzE1Mjk3NzM3Mjk4Mjc4YmMzYTRhMTdkYjM3YzY1MGY1MDE0ZDdiNjYwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNoeFhxTVd5MUs1cmtxQWhRRFlnRzk5VWFtOVFYb1duTmZVWi9PNktYaHh3SWhBS2NpdGhNWDdZL3dLZ29UU2FiVlJWRDFOUzllNndzTzJlWDF0SXpqOEZtYiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVlFsVnVTVGhoVVRWd0wzQkhkVmMzT0d0Q2NrODVlRTV2Ym5SM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhkTlJFRXhUV3BGTkZkb1kwNU5ha2w0VFVSRmQwMUVSWGROYWtVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZYVFhSSE16WnNaSGxxYVU0eWNEVmphbFUzWVU5U2RUaG1NbEJEVW1kdVVuUnhZbE1LWkZaRWMwRm1aV0l6VFhOcFppOUNNWE5SVkROQ1VHeFFiMVZWYVZrMlpscG5Ubm93V1RSSGJEVTJRbUo2TVZwaVZ6WlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV2Um5OUkNsRXJZMXBrV2prek0yb3Zka3hPZVVsa2FYQXlka3BOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVm1sWlYxcHNXVmRPYVU5RVdtdE5WRlpwVFVSU2FFMVVUWHBaYlZrd1dUSk5lRTFIVm1oUFJFNXFDazlFWTNwYVJHUnBUVVJWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVUZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUEwxbE9aRzVCUVVGRlFYZENSMDFGVVVOSlF5dHNZME13U1hoTWFsZ0tkMFk1YW1zclZIbEdXRkphYVdFMVUxUnBOVTlyU3poUmVIVnZRV2dyUjFSQmFVSlNUWE16ZWpGMWJXMTVjV0pQZVM5NVZubGpPRlZDZFV0VGNtdzNPUXBxTWpSaFRuZDZaME0xU0hwWFZFRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtFM1NUWnFVR1JyZGtKeFNrcElaRnBhZUVKU01HWnNSVTlvQ2pkalZFaG9USEZHVDFnM05XSnFNelk0SzJ4UFFrZEdiV1V2UWxOaWRGVlFSM0JOYTIxcldVTk5SV3BWSzNOaU1scFljMFZaWkZSRFZYUnVRMWd2WW1nS2NGZDBObFZQTVRCRE5tWmxNRXRvT1VOWGRHcHZiM0V3TmxBelZVNXRRbE5RWjBscU5IVkJkRzUzUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665363157,
          "logIndex": 4784138,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "ebafeacb86d15b04a133bf4cc10ea83c873d7b05",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3216193275",
      "sha": "ebafeacb86d15b04a133bf4cc10ea83c873d7b05"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

