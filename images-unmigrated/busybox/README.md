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
| `1.35.0-r27` `latest` | `sha256:d74640ebe6c8e52767c0ff1f7e71c144df874863f73e867aabfc4ae75d0ed3af`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d74640ebe6c8e52767c0ff1f7e71c144df874863f73e867aabfc4ae75d0ed3af) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:d331ded3cfef14298e63ef7e582bbd447ed4f02ac1804a78d813685a6232315e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d331ded3cfef14298e63ef7e582bbd447ed4f02ac1804a78d813685a6232315e) | `amd64` |



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
        "docker-manifest-digest": "sha256:d74640ebe6c8e52767c0ff1f7e71c144df874863f73e867aabfc4ae75d0ed3af"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ec994259924e576763c49af43ba96040f7e91215",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEyYqzDeAMXDaknW81NR8P2bgQX5ukBzLOFEulND3/zGAiB6T0wRAzzDRcYNtibTfpZme8e9mvQY88F759CA4vytYA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZjJhMzU0NWYzNmI5MDgwY2VmNzVhZGEyNjlmOGIyYzliNmI3NzE0MzYxYjA5OTBjZWQ4NTY0NmVjZGQ1OTJhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNwcnp1dnRlcGhoby8wOG1va2JrOXp3TkFyMjZJeTU3eTc4a0hKUkZneXV3SWhBTmhhR2tBdGRtZzZlTnptTndkdUtGNEkycVV4ditGb2xsa3JyZnVSUzM5RyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlNrMVFZVlI0ZDJGWlUwZE1iMjB5TjFveU4ycHRNak4yZG5oM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhwTlJFRjZUbnBCTVZkb1kwNU5ha2w0VFZSRmVrMUVRVEJPZWtFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxTW1walJHSjNjbnBHZFN0SGRtSXphRE5OZUhwWk9FdFphV3BzTHk5SlZuZEtSbWNLUVRKb1MzQmxkelZDV1c5VFdIbFplVzV1WlRjMUsxcHhVSFEwZHpOdkwzcDBaamMyWjFZeWJrcGpRMlJ2VjJoVEsyRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZoWVRWM0NsVXZVbGxwUzJFeWFuVlJlRWg2UkVKQmIxWndjVFZ2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVm1wUFZHc3dUV3BWTlU5VVNUQmFWRlV6VG1wak1rMHlUVEJQVjBadFRrUk9hVmxVYXpKTlJGRjNDbHBxWkd4UFZFVjVUVlJWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU2RXRjVSMWhCUVVGRlFYZENTRTFGVlVOSlVVUjBZa1puU1ZaUE4wRUtUVTlZVlVvd1NuRlVRVlZNTUZkMmVDdHVTRU5VTmt4RlpXMURPR1pGZGt0MlVVbG5aR3B3WWtaNlUwOWFabGRhZFhWeWEyVklhSG95YVRBM00xTlVUZ3BQZG0xeE5UbExkVTFZWkRGM2JqaDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsNFFVMXNWalYzTVhGT2RpOHpja0pxYzNKU09XeHhRMlZuQ205TlIwVktZemcwVVRGWE5VTXpVR0ZEYlVKSk5FdHZXRkZLTkZob2RGTlljVGhsWkVaRVJrTXpaMGwzWVNzeFZGaFBSVTlsV1c5M1prbFpUMUJVZURZS1UyWklla0phUWtoNk1ETkdhakZ2UjNCWVF6Tk1LMVJYVlRKdGExaEJkSEF4TkhwUU1tSm5aa2xUTDNrS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668299855,
          "logIndex": 6961975,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "ec994259924e576763c49af43ba96040f7e91215",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3453169201",
      "sha": "ec994259924e576763c49af43ba96040f7e91215"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

