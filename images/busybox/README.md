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
| `1.35.0-r27` `latest` | `sha256:b6fcdc3f7739e804681a3f25d081d5d4b55575379e7297702d42b23f13659c1c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b6fcdc3f7739e804681a3f25d081d5d4b55575379e7297702d42b23f13659c1c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:02ae2760c0477811aeeb55b9ecd43fe6a9335518bb7860ad4f37b85e73c5ca30`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:02ae2760c0477811aeeb55b9ecd43fe6a9335518bb7860ad4f37b85e73c5ca30) | `amd64` |



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
        "docker-manifest-digest": "sha256:b6fcdc3f7739e804681a3f25d081d5d4b55575379e7297702d42b23f13659c1c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4da7206a87d2b3c13d342e6ea75d83d4c1c1c15c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIC3Cq5aiqhHZxG9bhyjxTQK2Q3TgjMorC7VoznDIsHi6AiB1gq8HZNKgS2Z/a8nlFS5dBizVv/vOrJ2DbAtKrvHNuQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ODVmYWE0YzBiOGExN2MzNWJiNGJmODE4MWM0MGI0MTU1Y2FjZTAxZDg0N2YzN2I1OWRlMTY4YmIzZmJmN2UwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQjBHdWJXcFY0bVRueER6aVhSZlRlZUZxOHcrTWx6czBzTGxMMklXcnhra0FpRUFvR3hWZloySDlHMnpTRG9wZW01Z2hhWnpERHVuTmRMZXM1dTdISWFEVTZRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwUFowRjNTVUpCWjBsVldVVXhZa2hYZVVGaE1sVjRZMlpNTVRWbk9FaFhjR1ZLUkV4emQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlJFRjZUMFJCTWxkb1kwNU5ha2w0VFZSQk5FMUVRVEJQUkVFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2TWxSSlIyeDNZMFpvTkV4b2JqWlJOM1JsYVVaNlRXVkpZMEpEVGtKaU9VMW1XVm9LU1haUFpuRnRUa3d5TWtGS1pIUmlORlZaWVRGSlFqWjBTelZuZFhKVVFuZzJhalpYY0ZkNldsRkVRVWgzVFUxa2VUWlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZQU0V4cUNubFNNVVZYWm1ZMkwxaDBVMVpLV2twVFdsaFNiMXByZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVW10WlZHTjVUVVJhYUU5RVpHdE5iVWw2V1hwRmVscEVUVEJOYlZVeVdsZEZNMDVYVVRSTk1sRXdDbGw2Um1wTlYwMTRUbGROZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU1ZYSkZWSE5CUVVGRlFYZENTRTFGVlVOSlNHMU5iRXBtWjBGUmQwUUtRelEzV1RoblRFZHZORmRKVFc5NlUzVnNXazFITkRsdFR6a3ZWbFpaYTBoQmFVVkJlVVZvYnpZd1EyWnBSamd4TlVaSU1XNVdOMHhZZUZVNU5FOUliZ28xZFd4VGVFdEJOa2s1TlVWak4xRjNRMmRaU1V0dldrbDZhakJGUVhkTlJGcDNRWGRhUVVsM1EwUXJOa1pCUzJ0Q1ZrOTFVM3BJZUdGcFNpODVUMDkxQ21sUFJGRmxZalJKUlVKSmEyaFhMekpaVW1sdmRHNVZjblEwVjFVMlVTOUNUamwyU2s1UVRuWkJha0ZIYzFSTWREa3ZRMVZsTkVsblpUbDJPRkl6YURrS2VUZHdXVFpZTVhsbVRrOVpURmxuWTI5UVdtRnBVekZPYmt0TmEweFllV3hKWVhSS1VGRjVPRk5oT0QwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667867919,
          "logIndex": 6702920,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "4da7206a87d2b3c13d342e6ea75d83d4c1c1c15c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3415317168",
      "sha": "4da7206a87d2b3c13d342e6ea75d83d4c1c1c15c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

