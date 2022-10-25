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
| `latest` | `sha256:7cf95af7989317f8a08c49c7bd8e56c900323d8eb60e390192031f7f6a0b2143`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7cf95af7989317f8a08c49c7bd8e56c900323d8eb60e390192031f7f6a0b2143) | `amd64` |



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
        "docker-manifest-digest": "sha256:7cf95af7989317f8a08c49c7bd8e56c900323d8eb60e390192031f7f6a0b2143"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "20e44db3a1d7aeb57567b9e00bfcd2c0de1e7c03",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCaoYB9Er7ksS2DQOf/AlYrhzZ+KroP8vaDGZS9mM/OGQIhAMSnN9vQYYm45kCiiZ36icMeMCY+av3ylXovM4ixkrG0",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4NDlkNjM5NGQ1NDZkNDk0MWFmOWYzZTA5NDA0ODgwM2U3MGQ0OGEwMGEyOGFmNWQ4ZmFiZmRlZDU1ODMzMTk2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNFMUZObG9DMUtiVENRRkNVdlpSdW5FRFlYQTFDUytOSENFMkhvSjhBMVlnSWdmUFd2L21wa2hUNndhSHg4Zzkza2ExQTNxNkZUNG5VZWNQK24zdXBLMUlFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVlFVeFhTelpGSzBabVNHTklOV053VmpoNFNXSTNOVlpFZGxKVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RGTlJFbDNUVlJGTVZkb1kwNU5ha2w0VFVSSk1VMUVTWGhOVkVVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhYUVsaGVsRjROemd3ZGpWaVZYaHRNekJKWjBzdk5HZHBTMkk1TVdkcmNuSllNVXdLUmtJeWRHaG5Sakp2YmxWUVFYWk5SMVZtTW1aWFJDdHNWVXhSY2poNVYxVjNhWEUyT1VGUE4yWnZWM0JMVlZsWk5tRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHT1UwdkNtdEZhVUp2UTJKb2R6RjRWRXh2TkUxc2JVVkRObVV3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJFbDNXbFJSTUZwSFNYcFpWRVpyVGpKR2JGbHFWVE5PVkZreldXcHNiRTFFUW1sYWJVNXJDazF0VFhkYVIxVjRXbFJrYWsxRVRYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZGTk16RjBha0ZCUVVWQmQwSklUVVZWUTBsQ1puSUtkRWxsV1hKdGNXSlBSMDkyUVVoMVpsQTFXRTh6YUdSdlJHTXpTMjgyTkZadmIzVXJjV1ZTYlVGcFJVRTNibXQ1UjAxVWFUVkhaR05yVWl0QkwxbHBiQW92WVdSNWFESjZiMlZMYmsxT1FYTnlNR1pqVmtsU2EzZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hkRlVVUlhOME50VEZvMVkyMTRZM0I2Q25Nek4zWjVOaTlVZURkUVJtaFdkVXhQVFhZeFRVVkpXbU53VDNKWU1sVXlTRmwwUldaRU4wNU1ja1ZGZWtnMEswRnFSVUU0WVRGeGNGZHFSemRDWjBvS1lXRktSVGh2TTJzd1REbFlZVWR3UVRSckwwZG5PV05zYmpsV1Z6QlpVRlZQTUdZeVRXbEJZM0Z2VkdGbmNVOXVVR05VTkFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666663278,
          "logIndex": 5804962,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "20e44db3a1d7aeb57567b9e00bfcd2c0de1e7c03",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317615710",
      "sha": "20e44db3a1d7aeb57567b9e00bfcd2c0de1e7c03"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

