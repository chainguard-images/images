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
| `1.35.0-r27` `latest` | `sha256:bc86063a903e71328ffd4b89e211d42def896ccb40df0cccdb3d96a9fec632df`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bc86063a903e71328ffd4b89e211d42def896ccb40df0cccdb3d96a9fec632df) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:4a04623b2b406fb4c573687abea2d4208770eae925d6000873d6dc725f8d2b9f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4a04623b2b406fb4c573687abea2d4208770eae925d6000873d6dc725f8d2b9f) | `amd64` |



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
        "docker-manifest-digest": "sha256:bc86063a903e71328ffd4b89e211d42def896ccb40df0cccdb3d96a9fec632df"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b51699cbfcd5d778b98f38ebb02ee54011b65e20",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC0RWtVejdpEXctNiJbQwSI5CGM6IG5R2oJfM3qSoG18gIhAPxFKVeetO6ey1/LPKG0ysq4W5KoLSCuxg/1v7H542nr",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyYmQ1YzM4Y2ZmMzhkNzNiZThhMThmMTFjY2I0NDI0NDdmMTBmZGVhNWEwYTIyZGUxNWEyMWZhMDE0ZGMzM2YxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURFcUJPSU1tVHN6RFFUQWx2VlNldlkwTkpVeHpySzdQMjdmUHlZdTJhbDZRSWhBUGdpQXEyc3RLNzFxY0x3aEVua0ZiRzM1T3ZvR2F2dU9zRlJGMnN3aTRybyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwVFowRjNTVUpCWjBsVlptVjJhbFZ1Y1VSVWRqbFJaa1JJTW00NFJXRldlRmhZVGxKTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RWTlJFRjZUbXBCTVZkb1kwNU5ha2w0VFVSSk5VMUVRVEJPYWtFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZpVjJ0QlZGWmxhbTlEYTJoRVowVldSSGREYXpKNWFuVmlVVUozTVhkWU4yRlBieklLU1RCWmNpdG5XRmRQYWxwNlJGVk5aVWhDZGtGWFVFeEJRbFJ1TXpZNFJEWjRXWHBPVDNSQ2NGYzBaSE00VGtwWmF6WlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtVDFwdkNuYzVkQzlIUVVFME0yRlBVRlpqVGpSTFoxcHpkV2xyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIU1RGTlZGazFUMWRPYVZwdFRtdE9WMUV6VG5wb2FVOVVhRzFOZW1oc1dXMUpkMDF0Vm14T1ZGRjNDazFVUm1sT2FsWnNUV3BCZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUmFFdDBUa2hCUVVGRlFYZENTVTFGV1VOSlVVUlFZMDEyTHpKaU1GRUtaRzF6VTJKNGQycExPR1JhWVhvM01YZFFNMkY0Umt0QlZYSnRSa0ptYXpSelVVbG9RVXhVYUZsQlRURlpUVk5zVWs1S1ZreFBkVE55T0RKRVowZElMd3BJSzB4bVVFTnhjREpEUkRsU2J6Vm9UVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlZMEZOUjFGRFRVTlJVRm8wUXpSWU5IVldjemt3T0ZacWFFRm1PRVJvQ2s1UVVsRkxiREZuZWl0b2JYWnBWRU5IYVdGRWVEVm1XbXRQVDB3MWJUZDRSRzlIVDFkTFEzSTBkMGwzVUd0TmRtVk9hazFpTWs0NVJHZGxiVE5yUms4S2F6ZFVVRXgyWVZsSEswOUlTVEIyYlZVMmFVUk9ieXRoU0ZacFpIY3hWbWxQTkdoNGRGUlpNVlptWW1ZS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667003793,
          "logIndex": 6072317,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "b51699cbfcd5d778b98f38ebb02ee54011b65e20",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3349408435",
      "sha": "b51699cbfcd5d778b98f38ebb02ee54011b65e20"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

