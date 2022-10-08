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
| `1.35.0-r27` `latest` | `sha256:c0588fa5f884b0a65b8ed045aa40ad7a361b41eeff4769fd8025f33eedb56919`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c0588fa5f884b0a65b8ed045aa40ad7a361b41eeff4769fd8025f33eedb56919) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:816882ad436f6f7362e1e3dafdc10325576a339c8bfd246832e91a19a47c608d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:816882ad436f6f7362e1e3dafdc10325576a339c8bfd246832e91a19a47c608d) | `amd64` |



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
        "docker-manifest-digest": "sha256:c0588fa5f884b0a65b8ed045aa40ad7a361b41eeff4769fd8025f33eedb56919"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cb96b4bc7cf226626b44e29c39fb6a1d8415f994",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFXhxMCiY8dTCHmt2BSoOxxaOBMRkUYOfYiFcgYlMZRPAiEAkY2qP9UVu173iJRdU1bXXd89Q2E8UjrWFI5DzIOkDBA=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiYzk0NTEyNWJmNjljNGMxMzI5ZTI4ZDMzNjE5YzU2OWY1ZjZlYTE4MDM1NTcwM2YyY2Q0NDA4YTNjMjQyMGRkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ2RRdndzYUtXRGh1WVhXVE5ZR2FxQ1RwSllRandtRjNSWWYzRlN5MjZBYUFpQjM5ejVtQkQyaWwrRFlESUVaVnNhbHFrUWR0UW9XcXBpSUZKdWJxbUtqR0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwVFowRjNTVUpCWjBsVldXRmFkMk5LUWtoMllYSnlia3RwV0hsRlRHNW1TMlF6UkhaUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRSTlJFRXdUWHBKZVZkb1kwNU5ha2w0VFVSQk5FMUVRVEZOZWtsNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZrUTNKS1ptWjFiaTh5U2tRMFdVc3ZiREpUVG5GVmVYRnVUVk5FYjBwMFdYcFVLemdLUVZCRGNYbFJSVzU0YWxBMlkycFpZMG80S3k5UmNtTnJVREZGSzAwNFNtaEpZbUk0TVVzM1ZsUlRLMW92Ykdsc09EWlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyTUVaRUNrRklaMWxhYzNORVZGcGlUMUJwVjBwdFNYQk9kbXRyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVG1sUFZGcHBUa2RLYWs0eVRtMU5ha2t5VG1wSk1sbHFVVEJhVkVrMVdYcE5OVnB0U1RKWlZFWnJDazlFVVhoT1YxazFUMVJSZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUE1VTXZTRnBCUVVGRlFYZENTVTFGV1VOSlVVUlNNSFl6VEU5c00za0tORFV4YUhKTVl6ZEZXVGhHYm1sUk5rMXVNa2xxUkhvMU5FVkRiMEZ1YURoRVowbG9RVXRSYW5neFFsZzJPREpJYlhGNGJHaGhTMnBLTjFWVVlVNHJTd3BuVm5SbWMxVlRUazVDTVhFMGJXSlFUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlhMEZOUjFsRFRWRkRRa1pQVlhGWVIyNHliRVp5YkZneFJXRTFNbUZhQ2xwMVJGRlZhMG95VkVoSUwwbElhRU52UVVKMFJYTXdSR0pITDJGcE5tMWxWV1p0VkhWTlV5OW1RV05EVFZGRVZGRnFRVUlyY1haVk1IaDRNREk1T1VNS2EwTklWbmhoY0ZaRmNGUjFTbXMwVm5reVpWcHpjVnBOWldRMkwxUjNWSHA2ZDI0MWNXbEhkR3d4UlZaa1FqUTlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665189825,
          "logIndex": 4663816,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "cb96b4bc7cf226626b44e29c39fb6a1d8415f994",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3208505040",
      "sha": "cb96b4bc7cf226626b44e29c39fb6a1d8415f994"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

