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
| `1.35.0-r27` `latest` | `sha256:a0dc1bcc77e13ca0efd74a151b4d774be1ac48a340566d3b07a1a0cf8379ef7d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a0dc1bcc77e13ca0efd74a151b4d774be1ac48a340566d3b07a1a0cf8379ef7d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:349cd4abdb1dc2771b03188ee07ce1ad159ce848e77203c627fc22cddf49c91c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:349cd4abdb1dc2771b03188ee07ce1ad159ce848e77203c627fc22cddf49c91c) | `amd64` |



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
        "docker-manifest-digest": "sha256:a0dc1bcc77e13ca0efd74a151b4d774be1ac48a340566d3b07a1a0cf8379ef7d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2495cec410cf7642e38f6fb238511ed8cca7945b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBT3PSc7EUENgJm6yeS96OZzfBIgbzmFyq2QbHuE5kZoAiEA/j98ppNajhIpdsqXawtdHhTqAo5eQtHwWECadd0CRzc=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1ODVlY2I0ZTFmM2VjODhjY2U5ZGI3NDY0OTA4NjFiZTYxZmFlMmYyY2MzZDQ2MDE5YjhlMWNlYzY4ZGQ0ZTE1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQ4ZXNYZjU4TjkzV1BxRTBOZmpjeVJBYndrSUoydGpNY3JIaExzTDQ0NmlBSWdlaHNjb0JpSXF2Zkx4dTdZM0JQL1ZaQUNwdDVEOFhuUlR1clkyRGh0YnJFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwVFowRjNTVUpCWjBsVlJUZHhhVWw0V2xSa2QwOTBPVVp2YUVwWlFXWnRZbGhqYzBGVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlJFRjZUMVJSZDFkb1kwNU5ha2w0VFZSQk5VMUVRVEJQVkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3WjAxTE5HOVNkVzFQWkRoek0wUllTbmxhV2xab2NuVm9OSGxHYWpoQ2MweGtaMWNLT0dWd2JUaDRTRkJ0VlUwdlMycEtWVkZCYVRCRk1GZzRUQzlqUkVWMk1FeEpZMGx3TjNaMlMwTlpZVFpCY0hkeVowdFBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5YlRWWENpdEtjbWRhUmxwQ1lreEVVblpNYXpkRGREZHllRGhGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFU1RCUFZGWnFXbGROTUUxVVFtcGFhbU15VGtSS2JFMTZhRzFPYlZwcFRXcE5ORTVVUlhoYVYxRTBDbGt5VG1oT2Vtc3dUbGRKZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU1dqRkJPVTlCUVVGRlFYZENTVTFGV1VOSlVVTnpiVXM0WW1sNUwwZ0tVMEZUZEhWMk5ITmFZVlJFV201MWNVTk5ZbUkyWnpsUmVqQmtkMFJFYkN0WVFVbG9RVTQwUldoak9VaG5iSHB2VFZocU5rWjVSVFZWZDB4RlVIcElhQXBpWVhacWVVeFlNbGxGVFV4a1lXWkJUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlhMEZOUjFsRFRWRkRUM1JxZDJjMmFreEJUMVp4VTBGaVJuaFdSVkpXQ2taa05XZExOVVVyV25WTVR6VnVNamc1ZG1aU2RDOUJNV3ByUlVNdlZYQnRUMXBwUTFaMlNXNUNVRUZEVFZGRVltSkJaVXBpYTI1cVYzZGxZVU00U0RrS1NEUTJNSEZHTVdVd1YzVjVlV0pUZFRNM01YSktiRUoyYlVsNGVYZDBVa3RETmxoMGNYWk1WbFZEWTFnMFNrMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667954408,
          "logIndex": 6755425,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "2495cec410cf7642e38f6fb238511ed8cca7945b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3424383122",
      "sha": "2495cec410cf7642e38f6fb238511ed8cca7945b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

