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
| `latest` | `sha256:b1031d100df37b2356d14b9d3ae4d11e58d96dc9ec817cc09204ca910e02b2b6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b1031d100df37b2356d14b9d3ae4d11e58d96dc9ec817cc09204ca910e02b2b6) | `amd64` |



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
        "docker-manifest-digest": "sha256:b1031d100df37b2356d14b9d3ae4d11e58d96dc9ec817cc09204ca910e02b2b6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4d7fd7a0b094bd763e74e45810f678bc003f995a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCg2edP+qCTMkxygXiO9FaVWHIJfzE1x9Tt/SnaWAoWdAIgZa7iedJ6xFxTKLQy5B8yDS4Cza7EMoOZ4R8/Na/nO7Q=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhYTYxYjI2NDk2MmQyYjg5MzUwZTA3ZWE1MTI2OGQwMjA5NDQ5NWUxYTJhNzcyODBiMGJmZGY2ZjA1MGVjOTQyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR2ZIREtsZlNYVjJMaVVKUGtmeEtKb21MVDhBNkN6TWhxZWs5djVVeE9Gb0FpRUFnL2tFeTVDWDk2TXp2T29NMnJ2QUgramhpT2xhM2kwQ0RlUk4zS2Q2K1RzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwdFowRjNTVUpCWjBsVlFWZDNkbVo0UzFWTGIyTTJTa1JYWVZwdVEyMXVURUpsZWpWUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hsTlJFVXdUMFJCZDFkb1kwNU5ha2w0VFVSSmVVMUVSVEZQUkVGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2UjFWaVZEQjBjMHBYZGpSUlJWcFRSbmwyUm1WSVoxVkxZVm8wTURoaUsyOXVNWGtLZW5kVE4zQktZMjV2UkRWclNUUm5RM2hOZW1GMFZURnRTeTh2ZHl0WFNtOU5SelpyY1VSdGNXeExSVWc0VDFjeFowdFBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU0YUVaaUNqUnRhV3RYT1RjclJuWjBOVGxsVjAxVVprNVFNR05aZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJGSnJUakphYTA0eVJYZFpha0UxVGtkS2EwNTZXWHBhVkdNd1dsUlJNVTlFUlhkYWFsa3pDazlIU21wTlJFRjZXbXByTlU1WFJYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZBNVdVTlRPRUZCUVVWQmQwSklUVVZWUTBsUlJIQUtZbUpsVFZoVlFtMXJVak5rVEhkdE9WQllibWxLTWtGT056VlFWV0kxY3pabWRtRjRaalZsVm5aUlNXZE1WRFpQV21SamFEZGtVMEl6VG1kTVoybGxNZ295ZFhCV1kwWmFMMVI2T1VSM2FUWXhPVTFEZGpGNk5IZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlWRkJkMXBuU1hoQlRITXlUbmwyUkdOWlZVRjZkRkZNQ2s5eWIxZFVNemROWml0M2IwSkxTVkZXUTBrNFptSmxka2t5V1hvMmJFcHFRMWRLVkVGc1VqQnVNM0JPT0d3elZGSm5TWGhCVUc1amNVbGtXVU5oV2xRS09XeFVaalZYTVVKM2JVeDBjMEphWjFoaGNYYzRZVVpKZVc5QmNtaG5aRE5sT1N0dFVGaENkU3QxYTFod1oxRXpWaTgwWkU5QlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666403285,
          "logIndex": 5610707,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "4d7fd7a0b094bd763e74e45810f678bc003f995a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3301506038",
      "sha": "4d7fd7a0b094bd763e74e45810f678bc003f995a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

