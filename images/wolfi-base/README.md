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
| `latest` | `sha256:fd935ae776828738151f6024886eb21437b58f0c92be5b5ef8c4ad5a995d4556`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fd935ae776828738151f6024886eb21437b58f0c92be5b5ef8c4ad5a995d4556) | `amd64` |



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
        "docker-manifest-digest": "sha256:fd935ae776828738151f6024886eb21437b58f0c92be5b5ef8c4ad5a995d4556"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "15e4afb1ba47cbcd97c445e2a8a688b1be90853d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIGc2LofY32zWeU2lzRKUhSnCg0JQqg5nnx6JhO8mW2buAiA0uCs7GU5Ewm4/sHaQ40CUH0lm56x/929xQ/fgi5LQ/Q==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmMjY4MjkwYzYxNGJjZWE1MzM3MzRmYjk4ZDAyNTJiN2Y3Mzc1MWE5OTI5OWM1ODkzNDE0OTBhMjJiNWE1OGFkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURZVnFSVkV0eHNDS1pxUWxucEViLzlFTGtRWEhZMUtEK0Rhc3U0NlVKdEdnSWdTeTIvSXoxUDZoL3NVVkRRaWJhdDZQWXd4amtkNllUWnlRSW1USWxMZXBNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwdFowRjNTVUpCWjBsVlpUZFhOMjVSTW1GQmVuazRWMDB6VERONGJ6VkRUVlF5UW1odmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFVXhUbXBOTUZkb1kwNU5ha2w0VFVSRk5VMUVTWGRPYWswd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY0ZHpsdmEwUktTVVJOZUhCVE5XUlNRbGR4Umt4clprUTBVbUlyUWpOR1RreHhNQzhLZUdrNUsyUlVRbmRoVEU1Q1puWk9jbTFDTUUxTFQySlJPVEZ3TjJoa1dEaEliWFk1TWs5TllXVlVPVVJEUVZkb2RtRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwWlRBeUNtMUlXblJ4ZEVocFMweE5jbmgxSzNGU1ltMU1ZVXB2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJFVXhXbFJTYUZwdFNYaFpiVVV3VGpKT2FWa3lVVFZPTWswd1RrUldiRTF0UlRSWlZGazBDazlIU1hoWmJWVTFUVVJuTVUweVVYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCME9VOTRTVUZCUVVWQmQwSklUVVZWUTBsSFFpc0tRMEpuY1VWdGNIWm9ZVmRaYkZrM1FUTnphbkp0VFRoaE1EaHhXbFptTTJOV1RYVnhjMUEwUTBGcFJVRTVSakZLU1hKNFRXcHpSMWN6UlhOMVVpdFVkUXBoV0hoUVJWbHNTRUYxYUVwaVJtZ3dRa1pvUlc5S1kzZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlWRkJkMXBuU1hoQlRUQkdWaXRwTmpkNmNrTjRXVzkzQ2pCc2IyeHhVaXMyVUd0eU5HRjFWRFJ3WjFRcmJtWk9TMWRxYVVkVVdFNDBXa3N6TlRkVlptZHRiMUJGVTI4eGRVMVJTWGhCVDB4NlJsQk9Nek5NVlhJS1RYTllTRXhTVmtkS056UTVPRXhyTUVwS1IwRjZURzVqUVdVMVRGTm5kbUZsWTB0VU5FVjFTa0ZwVDFWR1dGZFBkbFJsWVZoUlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666144598,
          "logIndex": 5400892,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "15e4afb1ba47cbcd97c445e2a8a688b1be90853d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3278249966",
      "sha": "15e4afb1ba47cbcd97c445e2a8a688b1be90853d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

