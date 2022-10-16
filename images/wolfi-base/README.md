# wolfi-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/wolfi-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/wolfi-base/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wolfi-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:413b3f8cc943ca0f9fab6b4d40de1ce0b05c5ebcf14c11b2daa6528224d2a810`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:413b3f8cc943ca0f9fab6b4d40de1ce0b05c5ebcf14c11b2daa6528224d2a810) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/wolfi-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/wolfi-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/wolfi-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:413b3f8cc943ca0f9fab6b4d40de1ce0b05c5ebcf14c11b2daa6528224d2a810"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "3f15010f8701aef87fb661e1e0b29c98dfb14cd2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIA3ttkkER+iZFTCWdeZpQR4imnaEkUOZDUl4aF/GoXzMAiEA3gSsUqyP6rAAHvLPgv0S24e0oOkbn2XYxC8CpfhfNNc=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2Nzg5YzUyMGVkNGI1MTQ0ZTQxNDRkOTM5NGU5YzI1MmFiNmVmYmI1NWJlY2E3MDFiYWY5NDBlNjQ5MTU3Njk0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSHJKL3lReGNxUHQ3dy92aEV6dG12c0NpcDM0YmFhNHdBNjI1RmY1clJzREFpRUE4ZUJvdlA3b2V6RHkxTEFHQlY5WS9qdnl0U3p6WVdpbkhoeDE5elV6d2pZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwdFowRjNTVUpCWjBsVldHaHNibW94ZFVGR2RscHBTM3BFZG05SVVpdGtkMVp4YnpWemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRKTlJFbDNUa1JCZUZkb1kwNU5ha2w0VFVSRk1rMUVTWGhPUkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ2WW1WdWIyTnNlRVpFZFZSMk5qTnRNM0pMV1RSd2FpdHdRamxtUm5WUmFDOXBTMHdLTWswMFNqSkZLMVpRYW1KUWRXbFZNbmxGTTNCb1JVUlhWRlZZUjNWcVFUVk9RVFpKZW1oa05FeEtjM1pXV0hKc0wwdFBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwVEdaM0NtdDRTSGhtU0RjdlRUTk9aMU5MYWpOelZVOURjVE5CZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJFNXRUVlJWZDAxVVFtMVBSR04zVFZkR2JGcHFaek5hYlVreVRtcEdiRTFYVlhkWmFrazFDbGw2YXpSYVIxcHBUVlJTYWxwRVNYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCbGFVdGtZVUZCUVVWQmQwSklUVVZWUTBsQmFWVUthRVV2U1M5aWEyaE5ZbXhJTjJka1RDOXVjbWRIT1cxUE9IRklZVFJCZUN0SGNsRkNWSHB1V0VGcFJVRjJWakJxVW5kcVF6ZHBlR05FYXpsMlJEUnJPQXBJWVZZeFRXdExURVpyWmt0Vk1ESnFTMGh3T0haSFkzZERaMWxKUzI5YVNYcHFNRVZCZDAxRVduZEJkMXBCU1hkTU9FMVZUM05WVGpoTE5rMXhkV2N5Q2toNmF6ZzNRbTF5TlRWV2RIUjVSQ3R2ZWxOYWRVNDVNblpXVDNoalJGRmpNR0ZsWlcxc1V6VmxiMDFTYUVwQ1RrRnFRVTlNVFZwdmJqZHZTMEp2VFhrS0syWlFjakJMWXpVeWVqSkxWM2hyTWpsU2MzWnhabG93VjBVeWFGaEJOeTlHT0hwd2FUZEJLMWROVTA1UWFUTlllR1JKUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665885847,
          "logIndex": 5189806,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "3f15010f8701aef87fb661e1e0b29c98dfb14cd2",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3257906963",
      "sha": "3f15010f8701aef87fb661e1e0b29c98dfb14cd2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

