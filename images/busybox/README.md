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
| `1.35.0-r27` `latest` | `sha256:95ebe3f5db3d3c6262d6d7c074be4180cc03984b0a031caf56e50a1f9ddc6769`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:95ebe3f5db3d3c6262d6d7c074be4180cc03984b0a031caf56e50a1f9ddc6769) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:b292da8cf1c51119a3dc907bc96b9fb23a1e70455d350f40c4b5ad9e9754a122`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b292da8cf1c51119a3dc907bc96b9fb23a1e70455d350f40c4b5ad9e9754a122) | `amd64` |



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
        "docker-manifest-digest": "sha256:95ebe3f5db3d3c6262d6d7c074be4180cc03984b0a031caf56e50a1f9ddc6769"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "56612680029be02b5b798a81c6109dbc63bc1d1b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIG+9dHusx+8GpkOwJsIZXoadHZ21dV8VofEpgEVh4U0wAiEAsLWsN66NBPB0d5YisV3IfEJCRbi9Qn5KahTuBpdoutM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4ZThkODk4ZGQ0N2QzNTRiMWU0NWQ2ZjlhOTY4Yzg4ZjVmMWU1YWM2MmUxZjg0YzBhNmNjYzkzZmY0ZDJlZTJmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQU9sVGFDY3hPaS9rZ1NuNEEwazFiSE5odDRNVVdNQmZ4eHRhemdacEtObEFpQlpyRHBMdnc1K29RSkpGVDZvOE10Z0RJZnE4R0NjN2JWRTVaaFJXWGtiYkE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwVFowRjNTVUpCWjBsVlUwRjZTV0YzTDIxTE9XeG1UbEZQU0d0b1lsZDNRV1F2YldSSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhkTlJFRjZUMVJSZDFkb1kwNU5ha2w0VFZSRmQwMUVRVEJQVkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZQTlVWMlUwZ3pRM2Q0TmxvcmMwOVhjWGx0ZG1NNFdESnNaMDVKYmxReWJERkRPRzhLWmpkNVVFWkRkRFJWYzNKUlIwZzFZVmRTV1hSRlVFRkdNMEp2TlRZM1JGUmFWM0pHWnpOaVpXTllabTV3Y0ZWNlREWlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyTjBsTENrTnpVbEl6V1U4ek5IZ3djbTFWWWtwMU1GUmlhWEZ2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVlRKT2FrVjVUbXBuZDAxRVNUVlpiVlYzVFcxSk1WbHFZelZQUjBVMFRWZE5NazFVUVRWYVIwcHFDazVxVG1sWmVrWnJUVmRKZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU1pTdHRjMGxCUVVGRlFYZENTVTFGV1VOSlVVUlJjRTA0V0VvMk1YQUtlV2cwUVdoMmJWaG1OM0ZKV21ZeFdrNTRTbUozUlRKa2J6SllZVXhDSzBkSFFVbG9RVkJ0UXpsV2FIZzVObE00T1Raakt5dEljMmRKU0hGelJFOXlaQXAzYlVKdVEwNXRRbUZPTVc1WlRFOTVUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlhMEZOUjFsRFRWRkViek5TYTFaNGJISk9XbkpGVjJGNVpsQnphSGh0Q21Zdk1rZHZOMGM1YVhWRlZHNUVZM2h1YTNwdFYxZGpZVUl3WlVod1p6TllMemQ1VkVSVFQyWnpjazFEVFZGRFJUSjJaRzV3VVV4M1VrWmxkVEJqZDFVS2JGb3dNMnBpYzI5RVlrNTVibTRyU1V4UFQxcGFTR0ZGTURWTlUyOHdPR0ZDSzBNNFRuRXJRMk5uYWt3MFYyYzlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1668040803,
          "logIndex": 6804373,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "56612680029be02b5b798a81c6109dbc63bc1d1b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3433010488",
      "sha": "56612680029be02b5b798a81c6109dbc63bc1d1b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

