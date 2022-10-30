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
| `1.35.0-r3-glibc` | `sha256:4558b9e600e8c33caeae993f6b93f94b4cdba997b4448d1d6084677d39e03da9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4558b9e600e8c33caeae993f6b93f94b4cdba997b4448d1d6084677d39e03da9) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:f937596449abe973228a2e2c60256f3ef593190e60a54f3a317bda9129207db1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f937596449abe973228a2e2c60256f3ef593190e60a54f3a317bda9129207db1) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:f937596449abe973228a2e2c60256f3ef593190e60a54f3a317bda9129207db1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f5fff27a4a93646e8cda0e437278be5db1c9710f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC5HX8uIAHNnC7PyvOruUOBJG5zGrH7D0UaKMjq9uj48QIhANi2ESnMgHdPt/ZfC6j5ya/P+k5KyCj0+iTNqaibvQ9G",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMTgzYWVlYzE0ZWVmNDNmOTA3MGZjMDlkMzE4MmFiMjgyYmZjMDc1NWEzZDViNmI2ZDRlZTRjOTNjMGViNTY1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQVRhRDJ1dTdEck5FMmZMMkJmRWlqVGIyb0dncHJ2SHdWT0IwOHJnUWRFVEFpQnVWYmlKR3BqZWJtNUloWXAxcTVjdllhREFWWjlxVGtmNm5ScGtJRTEvbkE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwUFowRjNTVUpCWjBsVlJHTmpiRWxVY3pSVEsyVnZURFZtUkhSbFVWZHJTV1EzWTNwemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhkTlJFRXdUbnBWZUZkb1kwNU5ha2w0VFVSTmQwMUVRVEZPZWxWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZyUWtwQlJrcFdTaTh3Y1VsdFVWSkpaRmhEV2toeGJIaHpkRzlMYm1OUFluQXdXRlVLUW5Gb1RsRXZOMEpVT0RJNVQxVXhPSGhSSzFrMVNYUjVlVzVIY21vNGVHaERZWEV3ZVZWS01YUmtiQzlDZFdKR1puRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZwZURsTkNrVlRSRlZZV2xkMVprbE5WMWd5YjFoTVV6RkZaekpCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIV1RGYWJWcHRUV3BrYUU1SFJUVk5lbGt3VG0xVk5Ga3lVbWhOUjFVd1RYcGplVTU2YUdsYVZGWnJDbGxxUm1wUFZHTjRUVWRaZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUmJWY3ZWbEpCUVVGRlFYZENTRTFGVlVOSlJuazFaWGd4VURsNE9ISUtVMnBKTTJzd2EwUkhkWGRGT1hWa2RrOUdRWFF2YkdJMmFFeElheXRJVG5OQmFVVkJkbVJXVlRWNmJFSmxhSFJ6VWtkVGRVaEZha0pNU0RVclJqSjZaZ3BpY2taUFpIcFZlR2x2U0VGU1oxVjNRMmRaU1V0dldrbDZhakJGUVhkTlJGcDNRWGRhUVVsM1dqQlFURFptYnpjeWJIcDZkVzUzYkU1Tkt5OXVSbFZQQ2pCdWQyWTRXVlozVGl0QlVGZG9SMUZOU1VWVlVrOUNia1Z6VFVGbUt6bFJibWxtTUVSdlNYbEJha0l3VlRBelZVOVJhblpvY1RKSmNXRTNUa2xVVTFjS2RXbFpiRFYwY0hWcE9FeE9kMDg0TlVvM1pGWkNlRzExV0V0aVpEQjJXWEE1YkRsRFRFcHFlRk5PTUQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667090911,
          "logIndex": 6131375,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "f5fff27a4a93646e8cda0e437278be5db1c9710f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3353549373",
      "sha": "f5fff27a4a93646e8cda0e437278be5db1c9710f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

