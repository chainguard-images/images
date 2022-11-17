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
| `1.35.0-r28` `latest` | `sha256:606d1f9fdaaec4bddd4680f9dac9b3c4c874b5e7db5ad6b01764f449491b6a3b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:606d1f9fdaaec4bddd4680f9dac9b3c4c874b5e7db5ad6b01764f449491b6a3b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r27` | `sha256:6e15c273db2649e47463d6672da8075fb458d403d5f0bfb17c2bcfc6f6306676`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6e15c273db2649e47463d6672da8075fb458d403d5f0bfb17c2bcfc6f6306676) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r3-glibc` | `sha256:18186ea16748449de15855e5ac327eb69ecbfcf6a5b3df3b4f5c525809148a27`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:18186ea16748449de15855e5ac327eb69ecbfcf6a5b3df3b4f5c525809148a27) | `amd64` |



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
        "docker-manifest-digest": "sha256:606d1f9fdaaec4bddd4680f9dac9b3c4c874b5e7db5ad6b01764f449491b6a3b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "aa68a19019980e72f1eaa975852023969e4a38e9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD3bV0s2P8CnipthOZH32yQYEqlObafgFTB6mh6TDypFAIgLqhFaTrvrnHaip2DvcSFeqDghEinI4U+XLhu0R6uwMs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlYjRmYTZkMWYzOTM3N2ViNTUyZGFkOWU4YmJhOTVkZmE1ZDdmZmYzOWQxMWM4ZTFlNDg5N2Q4ZTJkMjJkZjRlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNrQ0RuN3pyZWoyaTBjakcwNjZKWlJ2NHdDVlZpaFZxZlNiOUpCSExIdkxnSWhBTE5HZ21vQ2o3Ukk3YnZxZW9ac0h3RXIvOHFSQlJOeU9nNkZQQkxKL0NWZiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlRrNUVObGhDZFRaeU9GaFNXWFp6TlN0cWRrSjJZVGROVXpGM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlROTlJFRjZUbXBWTUZkb1kwNU5ha2w0VFZSRk0wMUVRVEJPYWxVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMU0dwbE5WWmpPRTAyV25SUWJVVmpiV1psZVdSTFRsWnRUR1p4YlZKNWNsWjVkMVVLVVdGWlVFUk5WVlpyUmtoQk9GTmtPVE5LWlVGemFWQkZOVlJpYzJabWNGUm5aRXBoY0N0SlNUWjJjalI1V2psR2JEWlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5ZEVod0NrUjNhbGRJZEcwd01qVTNOMmh1WVZCT1NrSkZWMVJ6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIUm1oT2FtaG9UVlJyZDAxVWF6VlBSRUpzVG5wS2JVMVhWbWhaVkdzelRsUm5NVTFxUVhsTmVtc3lDazlYVlRCWlZFMDBXbFJyZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsVFJFSkhZVE5CUVVGRlFYZENTRTFGVlVOSlIxRllWRWR0Y2pCcGF6UUtUV1ZZV1VnMWVrSmxhbTFuV1RkTmJHMVRPR1o0YVRKaFVXcEtSMEZSUXpkQmFVVkJjbGh6U1c1bmRXcHplRFUxV1U5MFJXaG1ibTU2ZWl0UlkxZHhjd3B4UVZoelVqUTNZakpZYlV0dlNYTjNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsM1JIaHFRVTgxYzBaalZWaDJNM0o1YzB4MFVWTkhiM2xKQ2s1c2NVSlFiMlZvUzFSWWRtNTRiSGhWVjBjNVJDdFVSVkZqTW1kNmMySTNWbWRWUlhaVFVpdEJha1ZCTkRoVlMxSXhaVVZITDFsUk5YZ3JhM2hyYm5RS2JuaFFVVWhwYTIxUFF6RTFWM2RPTjBka2IzQjFlalZFUmtVNVVtNXBkV2xvVjNNMVlYbEtOWGsxZEdrS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668645435,
          "logIndex": 7239255,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "aa68a19019980e72f1eaa975852023969e4a38e9",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484316242",
      "sha": "aa68a19019980e72f1eaa975852023969e4a38e9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

