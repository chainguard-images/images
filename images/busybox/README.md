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
| `1.35.0-r27` `latest` | `sha256:368bf17c9c277a8a6a2d5cfa47ae6a10b6a60b8b52c47126d4b384e11d079038`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:368bf17c9c277a8a6a2d5cfa47ae6a10b6a60b8b52c47126d4b384e11d079038) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:17453eefa89b5816d132a9a26acea44b1638c7447bd26b65cbdedb15255fbc1e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:17453eefa89b5816d132a9a26acea44b1638c7447bd26b65cbdedb15255fbc1e) | `amd64` |



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
        "docker-manifest-digest": "sha256:368bf17c9c277a8a6a2d5cfa47ae6a10b6a60b8b52c47126d4b384e11d079038"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c235168c4f3d9b534e0809718f3d4442e49e353e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFB5pf4aA/yQPkzPRINxoahCzkGXR5f5FPVks1ueOvkEAiBfz85iOu8dR+mf3m9sx/u+j4Ift2bRgQ4NqByKSTocDw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjYjkwNjVjZTRlYTI3Y2Y5NTE5YzA4ZTljYzgxYjAxOGI0ODA0ZGE4NmJlOWJjNzJmZDczMGUwMTdiZjk4MjYyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURHWk1GTnJBWlg5VmRrbElzMGVBbzBVZE5zSkNzOWN4czhyOFcyVGx4ZG1nSWhBUEUwN2VrSzlRUWkraTNXY2ZlSmJ0YUFvcHdGcEZVb1VucWc0TnErUU5SYSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVlEwSnhNbFJNYzBsTGJteG5VM1JMTkhoNFoyRmtOekZvTUhsRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRKTlJFRXdUVVJCTTFkb1kwNU5ha2w0VFZSQk1rMUVRVEZOUkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3WTFWWFNXaEhWek54UzBwblNrRlJlWEpuWVdGUGVFTjRSRk5oTUc1WVFVVnVjR29LY0dwWmRHcHVValVyVFc1M1pVaGhiaXR3YmsxaUwxUlpRMlJYWjJNMWMxbG1aM0IwZURGcFVYQkJiV1ZVUW5sS1VtRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXTUdSM0NtMXVaVFZsVm10T1NtbFJRek5UVm1vNVdFNXpTMFJKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVFhsTmVsVjRUbXBvYWs1SFdYcGFSR3hwVGxSTk1GcFVRVFJOUkdzelRWUm9iVTB5VVRCT1JGRjVDbHBVVVRWYVZFMHhUVEpWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVVJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU1MxbFhXU3RCUVVGRlFYZENSMDFGVVVOSlIyZFhOVUpLWVRGTk1UQUtTekZUUVUxbE5WVXpaeTlTVFRsb1luQjJOelZJZW5wd1EyWkpUbEJqYzJaQmFVSnBibFF6VFVocGVFcERTMGxUUVVwcFlscERZak16YUdvdmQxTjVkUXB0T1RWMFoybDNjMVp3WjBaVGFrRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtKT0x6bEJLemRGY1VOSlNtdDNjM1ZtTkhObVUwRk5NVXh2Q2xGVVpqVkJXa2gxVEdOak9IcDBPVzFDZVZoa04yZFJRVGRNZEVacEwycHdjbGRXWnpSbmMwTk5VVVJwYVVKaFdFNDJOSFZuU1c5blNrVXZVREkzVm00S1RTdFNMM0ZvTVc1VWNHaEdWRXQzTXpCTVFVdGFUakpJYjNvMVpEVlBSVWwzTTBJM1kwZHFaV3R2Y3owS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667695234,
          "logIndex": 6588898,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "c235168c4f3d9b534e0809718f3d4442e49e353e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3402292054",
      "sha": "c235168c4f3d9b534e0809718f3d4442e49e353e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

