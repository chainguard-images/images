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
| `1.35.0-r27` `latest` | `sha256:5f0086dd53244872435e29fbfc860912ae977c63852ca0e8a6e72446f8faf174`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5f0086dd53244872435e29fbfc860912ae977c63852ca0e8a6e72446f8faf174) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:32efb6b86f3a31c252eb0c65aed9d21abf8d363f1368954e2457d5b9482bedfa`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:32efb6b86f3a31c252eb0c65aed9d21abf8d363f1368954e2457d5b9482bedfa) | `amd64` |



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
        "docker-manifest-digest": "sha256:5f0086dd53244872435e29fbfc860912ae977c63852ca0e8a6e72446f8faf174"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "62ed7eae45afb4cca09e26ba0012d8465da090d7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIGSvAmkQWCu8QjuojvDt3VagKvW6BtMF+xoBpP+myArmAiAA92CGedHlqvs5qr5e0YtKDztsuDpe9gKFhUAGJLHfAg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyYjhlZTRiZmIxYWZjZDM4NzE4M2Y0YjMxZTc2ZTM2MzU0MzQwM2Y3ZmY1YmZiNmI1NWU1YWE0NjYwNzJhYjAyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNUQVI4MnB5SjNKblZlTGVQeHp6UGpEVkVRSlVSNnVOcHNOc2pIT0Z5TkhnSWdWKzhZMEZnajNRNEVQS1JiWWxJWXlVZUw0RjBmRytxNW1IbC9WL1JRWThBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVldHNXhUWEZHWldORE9XVnhibUUwUWxoaWFHMXlRamxWTWpSWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RSTlJFRXdUbFJWTVZkb1kwNU5ha2w0VFVSSk5FMUVRVEZPVkZVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ5Vld4MVNsUnlVek55VTFJeVNFNW1kWEl2Y25STWRHVkROV1ozWTBSdmJYTm9SbWdLU2xCSll6VllNa2RZUmxsWFJWcDFZbWRRV1RNd2VtSkhXRk0zVGpNMVFuTkJjWFZSWTNJd05uWnlWak5QYkc5NmNXRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZZVN0akNraE9aWFZZY1hkdWN6QlBkMjlHTW1WVGVESk1NRVZOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFV1hsYVYxRXpXbGRHYkU1RVZtaGFiVWt3V1RKT2FFMUViR3hOYWxwcFdWUkJkMDFVU210UFJGRXlDazVYVW1oTlJHdDNXa1JqZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVUZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUlkwUllaMVJCUVVGRlFYZENSMDFGVVVOSlExQjVWVUZLZW5wb1Rrb0tWMUJGTVhkYUsweGxRMnRJU1V4YVQzTmFOM1JSVW5saU1rb3ZSazFtZEZSQmFVRXJNVTlEWmtOWGJrOVlLMGxyVjA5eVJVcHNUV3BaZEd4WGNXTm5lUXAwZFUxWkwwMU9VbmhSYWtkeGVrRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtKMVpXZE5jbU5SU2xJdlZIVm1TVlZTV25VMlN6bDNTVzU2Q21GclprUmxXbnBXYWk5UFpsTkJiV2xuU0RCMlJIRTRVVXBJVUhkRWFYUkpaMnc0ZW10T2MwTk5VVVJsTjBKRE5YWm1URzFyZUZoNFZYaHVhMGx6VTB3S2JtZDRUamx5VVV4T1VtZDRVMU5sY2xCMFlYcE5TRE12SzNWalZIRkplR1pIYjJaek9FdDNWV041TkQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666917996,
          "logIndex": 6013039,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "62ed7eae45afb4cca09e26ba0012d8465da090d7",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3341952000",
      "sha": "62ed7eae45afb4cca09e26ba0012d8465da090d7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

