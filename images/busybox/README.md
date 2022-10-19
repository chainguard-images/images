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
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:42269c8d42d0959be07b338446338fe600e711b5d200840f10bef40b66d4c58b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:42269c8d42d0959be07b338446338fe600e711b5d200840f10bef40b66d4c58b) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:b8b3977ce9e88658ed48a8cfd4cf5028c94c267c3b6ee394da5292c70cf1dd76`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b8b3977ce9e88658ed48a8cfd4cf5028c94c267c3b6ee394da5292c70cf1dd76) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:b8b3977ce9e88658ed48a8cfd4cf5028c94c267c3b6ee394da5292c70cf1dd76"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4d743b724ef2551a80b11c31625222e4f283f3a6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCGPfKR9tI/AFLCiRt/pslgNzyJlPoEEtm/Zyn7AMPrtQIgQRBeIiyaP+7Y+xnS9fb0/vS/jVts7zB01WM4/Z56A2s=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4MTVjOTY3NGE2MjdkNmRmNWQ5NGEzZmYxOGJhOGJhYzNmZjgwYWE2NmI0NzdhNmRhZWUwYzY4YzIzY2NjZmU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURBOEIxd3o3VUViSnpkUjFwUEw0WkIxdjVJdWN4Qy9KYTBLTWRaNG9iSlZnSWhBTklVVHJaNlJQSWhYaTRZb2JXSFlXaU9FSktKSWc0TXlacVA0MWFYV09EYyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlZrUkhWRFZQTUhBdmEzQnlNM1oxTUdwR0t6QnZhVGxZZHpacmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFRXhUWHBOZVZkb1kwNU5ha2w0VFVSRk5VMUVSWGROZWsxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU0UTBOck4xZzBSVEJqVVRkd2QzUXlMMGhUTW10eFYxZGtkVXhUU2pCU2EwZEJXV1lLUVVaNVpFcGxXazR5Y25scFdWVllXbFZIZVdRdmNXOVdUMUpXZFhJeFR6UlVabFJoTTJadmFVWmtSR2xFU25SSldHRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYyYUdkR0NqTTVLMUJ1YjJvNVJqQk1XSFoxWlRSaWIxQldLMnBSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVW10T2VsRjZXV3BqZVU1SFZtMU5hbFV4VFZkRk5FMUhTWGhOVjAxNlRWUlplVTVVU1hsTmJWVXdDbHBxU1RSTk1sbDZXVlJaZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUWRIVjZUWEJCUVVGRlFYZENTRTFGVlVOSlVVTXlabE4zZDNsalFUSUtXRk5uT0VGTVFtTjVOM2QwWkdsU2IxUTNjWE5TTUhwck5sVmhiRXB5VlU1c1VVbG5SM1pDUm5OeVpIbEpOM0JYYURCNGNYVmhjbmdyZUhreU9IUkdXZ3BCYW5jNVYwUjJUVEJyVTBkaVlUaDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsNFFVODRWVVptWkRaVk1UTk1PRzgzUjJFMVVrNXdZek0xQ2xScU1qaFZXa0owTURoVk9VVkZjRTVtZEhsWlpsRm9Oazk0VXl0dlduWllPWHBHUkZWSlZYWkhkMGwzUjFKSE1rZzJWSGhtWlRWb1dFRm9XbTlNVlRBS1kzQTNXVlJ4YTBoQmRtcFBVR3AyUVZCeFlpOTVMMFIzVEVkMlkyVm1TMUZ6TTFWV1JYRk5SMHBCV1VnS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666140835,
          "logIndex": 5397810,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "4d743b724ef2551a80b11c31625222e4f283f3a6",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3278001377",
      "sha": "4d743b724ef2551a80b11c31625222e4f283f3a6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

