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
| `1.35.0-r27` | `sha256:6e15c273db2649e47463d6672da8075fb458d403d5f0bfb17c2bcfc6f6306676`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6e15c273db2649e47463d6672da8075fb458d403d5f0bfb17c2bcfc6f6306676) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r3-glibc` | `sha256:1b35925f8b2b176c94d1d54f5b59b6ac98d7f69b37b5efa6b10586813e5e2659`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1b35925f8b2b176c94d1d54f5b59b6ac98d7f69b37b5efa6b10586813e5e2659) | `amd64` |
| `1.35.0-r28` `latest` | `sha256:2ac65744b8a664d2edff5f40b6822dc80b478c234e1c92f2b928599f0caf4e6e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2ac65744b8a664d2edff5f40b6822dc80b478c234e1c92f2b928599f0caf4e6e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:2ac65744b8a664d2edff5f40b6822dc80b478c234e1c92f2b928599f0caf4e6e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "005742e26e0dc2fdf47c84782ebaf449ca0539c9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICwsLoXu3fOktk7j0YGv2ma41FePCXS91QTCUarfEQ3HAiBlmblH7fVJ5nfKHYjn8HWaQ/fQSMucOh1fF310MJCFeg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0NGZhODVlZDE5ZWEzMzU4NDJjNGNjMWY1MzgzMzQ2NWI5NmQwNTEyYzFmOTQ1NmJkOGFlY2JkZDJjYzU4MjlmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSE9nUE9odElaa3FkekJMS08xZGkvSDk1R2t1cEZSVlB5KytJS3lVeW9TQUFpRUF5bVIxWGlaUWxUWDlOZzd1Z1NXRTJQcTc4ZHNsT0hNNi9peDNBNFVyV0FzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlFuVnhla05YVjJoS1VHTjBha0ZwUkZKYVVVNVVjWGhXYldWemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRSTlJFRXdUVlJSZWxkb1kwNU5ha2w0VFZSRk5FMUVRVEZOVkZGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVVyV1hVeFVrdElaR0Z6SzI4d2FXeFhWa0Z6ZEdSSmMwOUVkREJyZVZwbVNVWndXWEFLUm00MmNucDZXRWhUUlVWNVZEQTBaR0Z2ZVRCbGVrMVBUWFJ2YUhkT1pVUkphbU5zWmxaSFlXaGlWR00xU21sdGVIRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwTWpKMUNrSmFNalZDVFZaQ01HSmpWekpKWlc5dVIwdElWVXQzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFUVhkT1ZHTXdUVzFWZVU1dFZYZGFSMDE1V20xU2JVNUVaR3BQUkZFelQwUktiRmx0Um0xT1JGRTFDbGt5UlhkT1ZFMDFXWHByZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsVFNVeDVkSGhCUVVGRlFYZENTRTFGVlVOSlVVTXZURk5rTkdoMFNXb0tiazVHTldaamJtNDJlRFF6Y2tVME5pdDNaRTFMVnpRMVExUXJSVTV0TkUxclVVbG5ZMlZRTTJJMFFXNVRMMUpGVGtGUFdERjJOM05WZHpZMU1YSlBhQW9yV1hSTWExUXZNRGsxT1VveE5FVjNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsNFFVdEllRFJZVEVSVmVXRlZZVnA2Ympka1puWk5NbGRwQ21FNFpVMWlVbUpKYnl0WU9XMXBaMEZoUm5oblZrOURPWEF4U0VOUmNVSkNOall2WlVNelRUbHBVVWwzV1RGRU1YSjBNbWRyV1ZKVWJXSkphUzlPUmxFS1ZtbFhNV2xHZUhoQ1JXUTFlaTlZVkdZeFNXdFhTMmRxUVhkSE1qTnhORlpIU25oUFdtVkJaMWRwTkdjS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668732136,
          "logIndex": 7309245,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "005742e26e0dc2fdf47c84782ebaf449ca0539c9",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3493200892",
      "sha": "005742e26e0dc2fdf47c84782ebaf449ca0539c9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

