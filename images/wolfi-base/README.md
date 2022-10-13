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
| `latest` | `sha256:96b77229d69d99349932afdaadd8f73de579e855b31d568c2bdd999618de55f3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:96b77229d69d99349932afdaadd8f73de579e855b31d568c2bdd999618de55f3) | `amd64` |



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
        "docker-manifest-digest": "sha256:96b77229d69d99349932afdaadd8f73de579e855b31d568c2bdd999618de55f3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9e8134ce55bd817da0c5cf6ee37911e5f9a68189",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICATtm5qoIMMCe1iFCasbw4wRw6Ni2okFcE4v3W+g5FMAiAXzhx5rsJHSqaN3J6VgEzqBwNiLAfPVc7cbaPyhmVr3A==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2ZWM5NDk2MDllODIyMzI4MDk0MTgzZTJkZDYwYzE4ZTM5MDRjMWQ1ZDUyNTNjMmI1MzYxNWI4OGUxZGY2ZmZhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNGY3g4VVcvWi92bFJQeEpjcExLZUswMnlWQUw3ckJDQVhOME9tZFE1U2pnSWhBS0RYQUUvdUdINWk3aTdxc0tuT3dUZkNGaCtHa2tmejNzUFZBampxd2RPWSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwcFowRjNTVUpCWjBsVlpGbHFLMFI1ZFc1WlRGWklZa3hrU21seWJrSlpjVGxzZUVSdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFVXhUWHBOZDFkb1kwNU5ha2w0VFVSRmVrMUVTWGROZWsxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaY1hWWlNWZzNURGd5V2s1cllrb3lUbVpsTkRWVE1WTmxiMGQ1WjBZelkwaFdSa2dLT0hjcmNYQndiWGxrT0hJMmRrRTRkbWxOU21VMllWRmxXbFEzWldvNGJtOXlhV3hFVjAxVFEzbG1XSE50VFRNd2RYRlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZqVjFKSkNuVnhjRXhwVkU1a1UyZE9OVk5uUTNkclpGaERiVUZKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJHeHNUMFJGZWs1SFRteE9WRlpwV2tSbmVFNHlVbWhOUjAweFdUSlpNbHBYVlhwT2VtdDRDazFYVlRGYWFteG9UbXBuZUU5RWEzZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHJSME5wYzBkQlVWRkNNVzVyUTBKQlNVVmxkMUkxUVVoalFXUlJRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCUVF5OU9ja0ZCUVVWQmQwSkhUVVZSUTBsRVdrZ0tNR2czYWs1M1FsaENOa0ZCY1N0cGRYWk9NWGxRWTBwQ1RWbHVhVTVXZFZSUGNFdzRkVWxUU1VGcFFsTjRaRTg0YVhCc2VraFFiRnBNTURnMk0yUktXUXB0Y0V4RFJHVnJaRkpvT1haUWRFSnVSblV6ZEhsVVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dlFVUkNiRUZxUWpWMVVrSlJNMDV5U0dsclNWUm9lSEIwQ2xKNmNXc3pMMVY1WkRjek9ETk9aRzAwU21ZdloxUXdhRTAwZVV0eVQzcFBjVmhQVEZWS1RFMXRRVlJVU3lzNFEwMVJReTl1Y1ZVM1QyYzBaMDFFWkNzS2JrWk9UQ3RSTjJKUEwzWkdTMkZYVEZCaE1YbENjMDkyVlRkbWMybFhlamhCUkVKS01uaHZNVzl1UWprdlRtaE5UVzFSUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665626014,
          "logIndex": 4998023,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "9e8134ce55bd817da0c5cf6ee37911e5f9a68189",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3239134366",
      "sha": "9e8134ce55bd817da0c5cf6ee37911e5f9a68189"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

