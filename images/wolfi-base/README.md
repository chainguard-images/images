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
| `latest` | `sha256:c241e2060f7c84422bd1e8dc93f17a0dc2cb0c25ce220c6c641e85316e722e05`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c241e2060f7c84422bd1e8dc93f17a0dc2cb0c25ce220c6c641e85316e722e05) | `amd64` |



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
        "docker-manifest-digest": "sha256:c241e2060f7c84422bd1e8dc93f17a0dc2cb0c25ce220c6c641e85316e722e05"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "40842c26a115b1835f14c2a03a88f038f6251610",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD3c9ftPp6uyYs/y63WeuVCu/QYmjdmViMuclSjYvtQYAIgL3h4dA9wa2m9q8Xi9Iy8GGFFHWXwleLbQjS4pURnKWM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0ZmVlOTg3NDE5N2JhZDE1NDg4NzZlMDczNTkwYjY0NWI1YmY3NjU4N2EyYmZkZTU4Nzk5NjkwM2UzZmMwYWU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNJc2FaQmtVcUhsR3U2RElCc2lFS3c0V2RNYkRjNnJxUmhBeERFVmVVS1N3SWhBTXpTeDMwU09uOW80SC80aks4bmJCRVBSaHFpK0pNbGd3QW1oYVRSeTI1UCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVlUweG1lWEJZVW1WWFdGTjZZVzFJZFc1d1N5dGhNRlpaUWxoM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRWTlJFVXhUVlJGZUZkb1kwNU5ha2w0VFVSQk5VMUVTWGROVkVWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZqZWpaa2QzVkVVSFEzWkdwM1ptbDJWSGhXYUdOTGQwMWtNMnR5ZUdweFMwZ3ZabFFLUTI5cFpEbHBORk5oVEc5TVQyeEpXR2MxTUc1NWQwOXZUREY2Ym5SbmVXaHJPRzFQTkcxTU5FWjFkMFJRYm1GdlNrdFBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwUzFsbUNrMHphVVJGZEdrclkwTkhTbXdyTTFGQlZFbEJXVlJSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJGRjNUMFJSZVZsNlNUSlpWRVY0VGxkSmVFOUVUVEZhYWtVd1dYcEthRTFFVG1oUFJHaHRDazFFVFRSYWFsbDVUbFJGTWsxVVFYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1U4MlkwZE1OVUZCUVVWQmQwSklUVVZWUTBsRFYwWUtWekZqU0haSFMwbEhPRU5WYkdGbFVURnJTRmQyY0RaQmVrNU1aVkV2ZGpOU05XTTBLMDAyYUVGcFJVRnNOelZQZFVWT2NGUkhWWEZRZFVwUlZERjBjQXBIWkROUGJ6WjNVRGxxV0RReVJUVTNWVGhUVlhScFdYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hoQlNXRm5UWFJuVXpKUVRXSkliVFJNQ25SQ1NteFNabEZHU1V4bWVWVldia1pxSzI1NE5rSnRaM28yUlVodlQyeFhTRFkwVkVSRlkwOVFhelZ1TkZGSWIzaEJTWGRPUWpab2QxUmxVRXQwZG1ZS05WTjRLM3BxTkdsMkwyMTFOMU5vYzJGc1luTkJPWFZHWjBoT1pEWk5UamxrUm0xMmNUZGhNM0JDYlRoRmJXMU1Relo0WlFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665280278,
          "logIndex": 4726659,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "40842c26a115b1835f14c2a03a88f038f6251610",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3212508163",
      "sha": "40842c26a115b1835f14c2a03a88f038f6251610"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

