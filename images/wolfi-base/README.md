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
| `latest` | `sha256:ca099f560465d417619fc46f4f14719e791858c36a4a76559a6cd6d5546fec1f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ca099f560465d417619fc46f4f14719e791858c36a4a76559a6cd6d5546fec1f) | `amd64` |



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
        "docker-manifest-digest": "sha256:ca099f560465d417619fc46f4f14719e791858c36a4a76559a6cd6d5546fec1f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b6e60feb2a4b85c8a49da21b647c5590ac470d07",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAMNDj9JwfxKEJM8WBhIKBRgr0EZO9k80FA/GN37Gy5yAiAxAO+1kC3E7SXfiKlrV+lnuQNtCIqE1FGjUV44mQ2ovw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyODhmMWVkYzI3NzIwNWIwYjVmYmEzZGMzYTk2YzkzMmJkMzMwZTRhYzY0MmE5MTA2NjM2NTM0ODY5YTI1ZDc3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNFODdOdXRzUENVQnNTdTdzZHE2bWkrVUJOTy9odUtVV2owVExMejFxZ0xRSWhBSldDVnBBYWE4OG9Qb2VHZVljUUp3eWFuamtVYUFncWp3SGdhRWZNOXd0dSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwcFowRjNTVUpCWjBsVlkwOHdZVnBrY25NMFJsZHBWVFp2V1U1R1FWZG5TbkpZWTBsSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlJFVXhUa1JOTkZkb1kwNU5ha2w0VFVSSmQwMUVTWGRPUkUwMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyTTBSV05rMVBNMUoyUTAxNU5IUlhRbVpwVlU1blNIQnlXbmt4ZEZkWE9VdFRjMlVLZFdwalFrRnJRelkyYTB0bU1EaE5hemxaYTBaQ1ZXSklUemMyUjJSQ09GTnBMek5hVERaNVdYSnhZemhSTXpOVlprdFBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlVyWm1FM0NqVXplbVJ5TkhGSFdVWkhhMDUzTDBkM2JEUnZWSFJaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIwa3lXbFJaZDFwdFZtbE5iVVV3V1dwbk1WbDZhR2hPUkd4cldWUkplRmxxV1RCT01rMHhDazVVYTNkWlYwMHdUbnBDYTAxRVkzZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHJSME5wYzBkQlVWRkNNVzVyUTBKQlNVVmxkMUkxUVVoalFXUlJRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCNlIxbE5jRUZCUVVWQmQwSkhUVVZSUTBsRmVXMEtSM2w2V1RBd0wwTnZSSEZvWm1SSE5UQkhkbUV6V0RWTmMxQk9ZelZaV1hsR2NUbFhXbXQ1ZVVGcFFraDZXa1JsT1VObmNIbHlkR3h6ZVZkM05GRlBTd280WmxwUVZYa3ZhM05WWjJkcFZHOXNZV3gyYURoVVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dlFVUkNiRUZxUlVGNFVXd3ZTVEpLUkRaRFVtbHlVVnBWQ2xoaldGbHRNbHBOVDBJNFpVVktWM0IzWkRkaFJtMVpZbTFFY2xjM1NGVjNRa05oYVVGcE5GTk5XbTA1YlRsUlFrRnFRVU5CZDNOV05Tc3ZOa1ZoVkdjS1Nra3lZMlpzWlhSR05XbEVXbWxtTmpsd1dXWllOSEYzT0ZOd2VUWkVhRmRsZUhSWmJUaDNVMkprYW13elluQkNUa2RqUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666230882,
          "logIndex": 5467722,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "b6e60feb2a4b85c8a49da21b647c5590ac470d07",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3286266518",
      "sha": "b6e60feb2a4b85c8a49da21b647c5590ac470d07"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

