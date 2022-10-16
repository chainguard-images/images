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
| `1.35.0-r27` `latest` | `sha256:3a4338e54ef2be6707595fc553506c29022858d9e977c5338bc17754292622bb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3a4338e54ef2be6707595fc553506c29022858d9e977c5338bc17754292622bb) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:7020568bea50dd3a62308894e55b4cab2c635677aae3eef14d563f2b19c6d2fd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7020568bea50dd3a62308894e55b4cab2c635677aae3eef14d563f2b19c6d2fd) | `amd64` |
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
        "docker-manifest-digest": "sha256:3a4338e54ef2be6707595fc553506c29022858d9e977c5338bc17754292622bb"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "57eb4c18afb00337c55e5e53410f436f776911da",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCGMqbuw8+GlewftEfS02SwrUaHRs+nlXafzOv6SuXj0AIgGawI7MTWpWukHJh0Jvy+7uzb09dmDnbjSzPU4dbGAfM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1NDY3YTA3MGM4NmJmZmY2ZGRmZjlkZjRlNTQ2YzM1NTE0MDI1MjY0ODJiOGExMDg1N2JiNTE0MzNkMGFmMDJjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURYL296T2Qyd2w3S1VtVThNbGd2dXJWUkprZ2JjdkcxQzhpMEY0N0lQR0JnSWdKWEM2RTIzVU5ubU9Rc3IvRVZBbnYzNklud0Rtc3NxbU5BQ1NjV1VpdExzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVlZYbDJWbU0wYjNwME1HNXBRMms1TUVOUVozSkZlSGcyYWsxWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRKTlJFRXhUV3BOZWxkb1kwNU5ha2w0VFVSRk1rMUVSWGROYWsxNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSUjI5TlNsSjZXVEIzZUdoSFVrOXhMekJyVTJ0SWFFOTBRMWxLZERsQ1VqRlFOa3dLYW1adk5rMVBVMUpUVFUxMVdsbEtla1ozYlcxUVFYcG1PVEkzZVZRMVlsUk1XVEZxVFV4TVpVZFZaMEZEU0hZNGRIRlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5VkRGMUNrNDBSR3czT0hCcFFYaFBPV1JzVFhCbmNVaElUSGx6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVlROYVYwa3dXWHBGTkZsWFdtbE5SRUY2VFhwa2FrNVVWbXhPVjFVeFRYcFJlRTFIV1RCTmVscHRDazU2WXpKUFZFVjRXa2RGZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUVpWSjZhVEJCUVVGRlFYZENTVTFGV1VOSlVVTlpPSGxVVjJ0NVZ6QUtaV0pNUlZOUGMxWlBhbTFTV0c0eE9FcExTek5YTTNJNFdIVm5NRGxqUkhoMlowbG9RVWxNZGpsRmVrOXpNSGwwTlVjeGFsbHRja3BWV2pNMlptazJUZ3BRWm5ZemNGTjJabkV5Y2xNeGR6RkhUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRWRkVSbVJoUjNONWNVNXpUM0ZIYldWdFZFTktOVlZ4Q21GRVNGazBUbWxoU2tzMFR5dDBjRTFwYWtzelQzQkxkbTlTWjNWRVpYUldRVmdyYWxkaFoybDRPSGREVFVJdlNFOWFaVmQzZFhkcGEyNHZRbXQwZVZBS2RUWmhUelo0WVdkbVZsUnVia2REVUdnd1YzUnZUVlppUTNodGR6ZEhPWEJhTlZCeGNGa3JLMVkxYW0xMFFUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665881571,
          "logIndex": 5186582,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "57eb4c18afb00337c55e5e53410f436f776911da",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3257741957",
      "sha": "57eb4c18afb00337c55e5e53410f436f776911da"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

