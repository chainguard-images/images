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
| `1.35.0-r2-glibc` | `sha256:62dd9cbe1101ddf2ee97c49fe5eec32bf3961c175d98293c4436144c4fc33b85`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62dd9cbe1101ddf2ee97c49fe5eec32bf3961c175d98293c4436144c4fc33b85) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:3dbd08e9b6ada455f87d0574751795980b8db450dc27dfe2212cfc94eceb663e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3dbd08e9b6ada455f87d0574751795980b8db450dc27dfe2212cfc94eceb663e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:3dbd08e9b6ada455f87d0574751795980b8db450dc27dfe2212cfc94eceb663e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f98c1b99ead88b3331f0b87e720ef0e31cea1f74",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDZXGfNkavrKWMyW/y8GCFI46VIf4rhOayIBPrCdl+l+AiEAnxoswildZznVObqM1Y10b1HqBMVXCsegZt94YS29Y+M=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmZDRkYzZlZmY5OTA5OGRmMjgyMTc5YzdkYWU0ODdkNDc4NWIzNmU2YTEzZDNiYjQwZjUxZjE2NmU3MjFhMDE1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRUhIWFVCNHVoTzFsbXF5RVdERHpmR01zNWJJdlBINmIzeTVrZUR6OUNFOUFpQmpEck9HWFNwdkp3K0tVM0w5dVErMG1idTlZTkR6R0tvdWY5T3piZkJZb1E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwUFowRjNTVUpCWjBsVlRqUlJibFJUUld0UlQyUk5aSEpMTWl0UE4wNURXa055TVRCVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFRXhUbFJSZDFkb1kwNU5ha2w0VFVSRk0wMUVSWGRPVkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZvYUM5alFYb3dVRkEzU0hJdmJXVnZVbFEzU2tWNGJGSXpZVkZSU1c1NVoyTk9kRllLVG5SdWFtMVhaMjh6VDNkVVpTOU9PV0VyT0dkMmJFcGtPR1oxY2s4dlNYSlNNMDlqYkc1M0wxbEZTbUY2U0VSSmEzRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZLYkhCRUNtUXZUV05SU204NGVYQnBUMGN6Tm5RNVZubGtWMVZCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIV1RWUFIwMTRXV3ByTlZwWFJtdFBSR2hwVFhwTmVrMVhXWGRaYW1jeldsUmplVTFIVm0xTlIxVjZDazFYVG14WlZFWnRUbnBSZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUWFtTklTVkJCUVVGRlFYZENTRTFGVlVOSlJXbDRXa1JNWVZOb1dWY0tRVGhIWmk5c1kwTjJjRU5IU0hoNE9WSXZhbTF4YkZoU1duRkhXRXB4Y1dOQmFVVkJkRTh6TVdKSWIwcDVSeXRtYUZKelV6ZGhWRzVuVWk5dGREZE9TUXBxWWtGdk0ydExjbEJ0ZDBaNFZsbDNRMmRaU1V0dldrbDZhakJGUVhkTlJGcDNRWGRhUVVsM1ZWbFNhREpFWTBOQk5sZEZjRE5yVUhkTVZFOWlNbmxhQ21GVmRrb3pWRzV1SzFVd2JXWk1XRlpYY25ZM1QxVnhNRGRXUVc5eVR6YzRVelYxYlVKd2QyTkJha0UzTjBwV0wzVlBSRTE2VjNKNmFUaFBaVVZrWmxBS09UZE9ZazFKTm5rMFdrOXNkVFF5T1hobmRIbG1kRUY2WTJsNlNEUndXWFJWVEdSM1lYTlVZVU50VVQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665968159,
          "logIndex": 5246146,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "f98c1b99ead88b3331f0b87e720ef0e31cea1f74",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3261589278",
      "sha": "f98c1b99ead88b3331f0b87e720ef0e31cea1f74"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

