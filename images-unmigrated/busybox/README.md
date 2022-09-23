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
| `1.35.0-r25` `latest` | `sha256:ddcfd4dd927679043af6b061a39ed63287a66c82941e5b224501c2bbfe46a8f2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ddcfd4dd927679043af6b061a39ed63287a66c82941e5b224501c2bbfe46a8f2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:ddcfd4dd927679043af6b061a39ed63287a66c82941e5b224501c2bbfe46a8f2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "91713908b9099aed7cc0e4d199b4bb2484dc53ec",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD+zyyWyNST0/piXisX5YedXyFMS/ZM0etl2WVhq5neqgIgH0x3fdtE5+CLSTLz0yy8hO9VarIE6ye4hlvVeEMNjrI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmYWYxZjI4NDQyOGI3OTRlYTkyNWE2ZGM1NThjYjM2MzVhZWYzNWM0ZGM3OWE4ODcwMDcwODQzMWJjMjE1NzU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQlhCaExxTnViUVV1YlRhVU5xYVpZazZnOUtPR2lqcGtoTlN2OXNSWGc1cUFpQlhPZDhzUnhrWkxhWjVLVGIyNkFuKy9RZmJGbGpHaDg1alVjNUo0L0JQOVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwTFowRjNTVUpCWjBsVlFtcEdTekJKVlc1dWNUVmFlVUV6UTA5d2RWWm1iMnhpVEhacmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFRXdUMVJGTVZkb1kwNU5ha2wzVDFSSmVrMUVRVEZQVkVVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZJUVZsQ1ZXNTVOMDloVlVjeFFXeHlNbnBVWjNCbWIxcDZSSE5PYldOdGIwdGtRV1FLUlVjNVpsWm1kbVV3YlVWNWVESnRNV2RNTkhWbFNURXJlaTlWSzFSdFdVWkZUMlJUTDJOd1ZXbGxhbWw2Y2toV1NtRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZwUVhGeENrRkhjbkJ5UkVRNWVEWnJiblJuTmpaTloybFRlbEp2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFYTNoT2VrVjZUMVJCTkZscWEzZFBWR3hvV2xkUk0xa3lUWGRhVkZKclRWUnJOVmxxVW1sWmFra3dDazlFVW10WmVsVjZXbGROZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVUZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsT2JqQmxMM3BCUVVGRlFYZENSMDFGVVVOSlNFWm9jVkE1VW5WNVprb0tOUzlUUlU5dlNEVlVlRFJsVmpGeVZFUlJXVVpIUWxSNk0yaFFSRkpXV0V0QmFVRkRaMmhEVTA5NWJXZ3dURWxSV2xaeFpsRlFibVZaVjJoWVpuRnFSQXBLVFRsU1FqUk5ZWE5OYjFKdWFrRkxRbWRuY1docmFrOVFVVkZFUVhkT2NFRkVRbTFCYWtWQmNsSXJTblV3YWxaQ1NUZFJXa2h1Y200dk5FTTNjMEpqQ2xaMUsybHpTbkYwU2k5UFFXeFFZazltTDFZeGVURmhjeTl1YkVSdVpERjNWMk0yUkdWNlFWZEJha1ZCYlRsMWNEUTBWMHhEVjFBeE9YbERTVWhsYTBNS2QwRnlRbGhFY0ZCMGVuUjZjRWxaV1RST1V6SkhhRFJRZFZKbVMwSXZSRkl2UnpjeGFtOVJNMmRyUmlzS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663894194,
          "logIndex": 3778804,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3109715781",
      "sha": "91713908b9099aed7cc0e4d199b4bb2484dc53ec"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

