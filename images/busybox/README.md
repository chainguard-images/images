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
| `1.35.0-r2-glibc` | `sha256:39555ca00e2261f973570cd687c101b39ddd5b96654aeb85900c1566af78fdf8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:39555ca00e2261f973570cd687c101b39ddd5b96654aeb85900c1566af78fdf8) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:a4eb13b345694afe8957c23cb5b58509d0b3a71d505b763212774a25945d8e5b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a4eb13b345694afe8957c23cb5b58509d0b3a71d505b763212774a25945d8e5b) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:469514798dfe3a7c8862f314a81d1f3a6ff587d1f9fba07a75c66d8d514220b5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:469514798dfe3a7c8862f314a81d1f3a6ff587d1f9fba07a75c66d8d514220b5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:469514798dfe3a7c8862f314a81d1f3a6ff587d1f9fba07a75c66d8d514220b5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b50f9af43c522f5cfe5d6c12b04315fa979b0623",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDs/rYTleXHBLvKmL+flMLxMEz9veauJ0rP2UrpU8P4KAiBjaS6lVc5nUvxN7+F/F11ColgokL02Fe+JdMGrG/21yw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMzA0ZDVhOTFiYWQ4ZDEzOWE3OTE3ZWFiNDE2NjkwMWY0NDY2NDYxMTVkNTU3MTYyNjExYTY0NTg3NTNlYTRkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRUY1ZFBQQ1ZtNVFOUHNrZlhxeFVmdjhrZ3praTZ3eWcybFMxdUovZDh6TUFpQTZiTFI0NXpHa3hCYVI5RGk5SkRsRnBXU3J1VHI3Q0UwR3ltRkNiQVV3YXc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlkxSk5NR1psWkdNMGRtTjRURzFsUlZkUWVHWlNlakE1V0ZCWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFRXhUVlJCTkZkb1kwNU5ha2w0VFVSRmVrMUVSWGROVkVFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1VEdGeVNsQXhZVlpaY2twdlpFOXljVnBEU0ZWS2VqUXphVEp3TkhKeldsZGxPRzRLTUZkeGJXb3Jjekl3TmxZMU5HYzRhM2hwWkdGNmQzZ3djVTVzTlhvcmMyaHdhek4yYmxSUWFFZE9NMUI2Y2tKd1MyRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZVYTBac0NsSkdkMmw2V21oc1NtczNTM1pOY2pWdlpuZGhaRXB6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIU1RGTlIxazFXVmRaTUUweVRURk5ha3B0VGxkT2JWcFVWbXRPYlUxNFRXMUpkMDVFVFhoT1YxcG9DazlVWXpWWmFrRXlUV3BOZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUVR6QjBiR2xCUVVGRlFYZENTRTFGVlVOSlNHaHNVazlSV0VwS1dpOEtRMlJsV0RWS1JXRTBOak55YzJWNFdVWkdSMnhrZGpoTU9HZHBRVmMzYzBWQmFVVkJPSFp4ZUc0MGVHaGFVekYzTDJwTE5IaEZNV1JVUjJSRGNWcFJPQXA2V1ZaMFpGUXpSRGRNY214a1pVMTNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsNFFVeG5XVlpvVHlzMmJpdHlSWEpCYzFrNVR6bEVZblJvQ21SWlF6ZGtWRk5LZERSVmJFOXpVR0V2WlhWdE9HNHpTblp1VEM5UU1VWm1hakZwV0d0bU5FVmFaMGwzWlV0VlozaHFORU56YnpkcFpsbFpNMmxIVlRBS1MzVTNOa1EyUW10UldXdFpPRFIzUVZwNWVXbE1ZVVp0TDFSTmFXbFFXbE5WYTNsNVdXZGpOblZ3ZVhFS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665622290,
          "logIndex": 4995143,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "b50f9af43c522f5cfe5d6c12b04315fa979b0623",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3238908431",
      "sha": "b50f9af43c522f5cfe5d6c12b04315fa979b0623"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

