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
| `latest` | `sha256:e244315d5094258be0b70eb03ac7e169fa2fa9372b2c8d7d4e4d7524b169937d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e244315d5094258be0b70eb03ac7e169fa2fa9372b2c8d7d4e4d7524b169937d) | `amd64` |



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
        "docker-manifest-digest": "sha256:e244315d5094258be0b70eb03ac7e169fa2fa9372b2c8d7d4e4d7524b169937d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "8ba97d083d55c4bcdf3c9761d6fbca9847ef2e53",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCxKyAgtHh0de7myu3fhZcT/t9k36NrLSJKe4zlbIQ8gAIgW1LYnZu4g99Rh3udFNp4TItoNnAUEki9CkLStNDdSmg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiODc4NWEyMGRiYWVjYjQ5NjM2ZjAwYjcxODljYmU1YzM5MDQ0ODNlZGQxMGFhOTFhZDI5YzRmNmJjYmE0Zjc2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ0ZyU0gwY0xOVWpzbVVxRW85N293MEdVV0ZCZy9wTmNBTHcxZitKamdlakFpQXowcDVNeEZrUmR0cHFIemR4UzRXZGJ0VmhIU3BUcC9lVUIvN3R5cXlaRGc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVlJubzVUM2xGV0d4MlJFZG1MelFyTkUwMU5HSlpTQ3RYZVVkSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhkTlJFVXhUbXBSTVZkb1kwNU5ha2w0VFVSRmQwMUVTWGRPYWxFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZVVlVwTFQwbFhOVmhIVFVkMFJrVTFTREpET0hKRmJXUkNWRmxuWWtZMmQwVkdka1lLSzNGbE1sVkphazFvVEdvemN6ZGFhSFJ0VW05TWIyRmtSME40Wm14amVGRjBNMVZ6U2k5TVRGRjJNbEJOUzNoV2VqWlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ6V21GcENqRjZNSEppZFhKMlpHaHhWRWt2Y1ZneEwyMUdXVU5yZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJHaHBXVlJyTTFwRVFUUk5NbEV4VGxkTk1GbHRUbXRhYWs1cVQxUmpNazFYVVRKYWJVcHFDbGxVYXpST1JHUnNXbXBLYkU1VVRYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1U4dmJUbHpSVUZCUVVWQmQwSklUVVZWUTBsUlJFSUtLMDVSYm01NlVUQmFTMlZxY0M5TmFIZEpXa1V5VkVoM1V6TlBjbms1VFZSQ1JEWnNkbVExUm5KUlNXZE1VRU5MUlc1c1EyUjVVRWhIYm5wV2QyUnFkZ3BIZVhWUFVVbHVTVnBqUVROVlZUZzVUMGRJVDBORmEzZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hkWFZrNXFUbk41S3pRd2JHWTRjMFJpQ2lzME5YRnNOMFZoVEZjNUswZzNkVU5vU1VaSFVFeDRhSFJSUjI1SVptVmtVR3BTYjNoWlQwNUROV0ZwTDNndmNFRnFSVUZuWkU5TGVITXhiazU1YW1rS1IydHpUelJsSzJsbU4wY3hUR1ZyVm1WRmNrSldOblpFU1N0SVdGVllaMVpEYkhkc1IzRkdRM0JNUmtFeGNYSnlNa2hsUVFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665367010,
          "logIndex": 4786946,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "8ba97d083d55c4bcdf3c9761d6fbca9847ef2e53",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3216395809",
      "sha": "8ba97d083d55c4bcdf3c9761d6fbca9847ef2e53"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

