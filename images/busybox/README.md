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
| `1.35.0-r27` `latest` | `sha256:e2c2f62f064c8add81992d0e9b1e93ebc25a1c74a5bcf7aec4b533d50a528a48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e2c2f62f064c8add81992d0e9b1e93ebc25a1c74a5bcf7aec4b533d50a528a48) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:6564e18500da04d0cf3ab9d0c9611a43bcd8f144e113e55f44049124f57c870e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6564e18500da04d0cf3ab9d0c9611a43bcd8f144e113e55f44049124f57c870e) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a) | `amd64` |



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
        "docker-manifest-digest": "sha256:e2c2f62f064c8add81992d0e9b1e93ebc25a1c74a5bcf7aec4b533d50a528a48"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9f1af75e99dae1f8edbedb4dd8dbb0f55607477e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDG3SVCqqs05YD9OAkKCnt9FAwrFlLn8iWresRT/mWxHwIhAJPxMJYzJQUeGBKf/G6SBQjyX6l3a4PefSq5SBNKL8mm",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzYzI0MGI5NWE0NmIyNTFmMzQxNGY5MWNlZmJjODQ1YTY2NDI0ZDY0NDM2MGIyMjY4NGM1Y2E5MzQzOWIxOTUxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURpYU95b0duZW5TTEh4c3hFNzQxd3NKMVhyZTQxRElVWHdwcW5RV2h2QUl3SWdPMmJsdndlS2pZWm9mbmRWd2xFUzFFd2VENU1NeUYvczVjeVNMc3VCN1JVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwUFowRjNTVUpCWjBsVlRERnJjMVJ1ZG1sTllWWmxUMmxxV21Wd1dFbG9WVGhwZUdFd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRSTlJFRXhUVlJGTlZkb1kwNU5ha2w0VFVSRk5FMUVSWGROVkVVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZJVkdJeWR6UkRUMmcyTUhwNU9FMUdjbUl2ZHpoVU1WaEhhMFJtZGpodVNuTlZZV3NLWmpGYVJGaHJhMjlVZFhORFYyMVRPVFJ4VFcxSlIyOURVbFpFZUNzNE1XeGlVV3RzV2xwTFRqQnVjMUY1TldWME0wdFBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUzWVVJMUNraGlVRmRqVGxrNGNVRklORnB3TWtNcmQzbFJNVWRuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFYkcxTlYwWnRUbnBXYkU5VWJHdFpWMVY0V21wb2JGcEhTbXhhUjBrd1drZFJORnBIU21sTlIxa3hDazVVV1hkT2VsRXpUakpWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUWIydDBSblpCUVVGRlFYZENTRTFGVlVOSlVVUmFkbEJJYTFWVGVVNEtOQzl6YmpCblNYcGhRbHBKUm1KT1kwZHdSM0Z0UkRGTVFteFdiMWdyU21JMlFVbG5RMjVQYUZJNGNtWTVkM05TUVhGaFkwSXlVR1IyTDJWNlEwTXdlZ29yT0daVk9HRnFZVlZhUmsxNFdEaDNRMmRaU1V0dldrbDZhakJGUVhkTlJGcDNRWGRhUVVsM1Qza3paVkptWkdsWFZUa3dZbE5VYzA5MVZEbERZM0JHQ21kTVIxVm1jVUZTZDNOTlMybHpWMDlxTnpFNVFXeDViR0phY0dWT0swaGtXVVpuU1hCWlZWWkJha0ZQZFhOQ0sxbFZVakZETlRSWFQzaHdWRkE0YUZFS2JtMUZMMjltYlhGd1pYcFhXbTlsVGpsMlozZFhTR1l2V2xOdWNqRkdhbEpCU2xFeloybHlZMXBRUVQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666054302,
          "logIndex": 5316063,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "9f1af75e99dae1f8edbedb4dd8dbb0f55607477e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3269767798",
      "sha": "9f1af75e99dae1f8edbedb4dd8dbb0f55607477e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

