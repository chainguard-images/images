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
| `latest` | `sha256:0f4f8cbcef918bf5309277567d990b3f6ac45df386f9488c48a40df92992b9b1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0f4f8cbcef918bf5309277567d990b3f6ac45df386f9488c48a40df92992b9b1) | `amd64` |



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
        "docker-manifest-digest": "sha256:0f4f8cbcef918bf5309277567d990b3f6ac45df386f9488c48a40df92992b9b1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a0c6b8e1a0bc8ac32eb4c733b9adeaa88355993f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDmWg750EbWl1pr8onG+l2UniJL0LiSi3Z8PIY9pPupBgIgbi1mrUD5lNahB9eUB/T5CYAT7oO3dJVB/eu/rDvl14A=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxYjkwNDU0YmVkNmZjZDdjODZjOTM2YTM3NjBmOGY4ODdmNDFhNDFiNGFmYTE0YzMyM2QwY2U0N2U2ZDhhOGYwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ0NJNFIzbXV4OFRVaitqYnVoV0lCVGJqTGQ1MnpubmJpRG04dm8zcmFISkFpRUF4d0E1TDJMK3IwaWNmUnI5ZjhJWkJBbmd6dW1oTTJGTFBkTERZWXZJNEYwPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwcFowRjNTVUpCWjBsVldFUmphUzlCVWxsc1VqSkZVRmd2WjIxa2FITlpNbmhxV1dSemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlJFVjVUbnBSTUZkb1kwNU5ha2w0VFZSQk5VMUVSWHBPZWxFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaWjBNM2JXY3JTVWs1V1hZM1Myc3dSSEZPVUU1elpXTkxVSEJSU2tKSU4wZENRbklLYnl0WWVrZFJhMWxqUm1aTlJrVnJNM0l3Y20wMWJUUlFXRmt4UldoaFJWRkZUMFF4TVc0emVIbE9jM1V4WVRGV2VuRlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU0YkdneUNrWlpWbE5oTTFNM1RUTnVaMVZuWVhWRFJrUkpXVmd3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIwVjNXWHBhYVU5SFZYaFpWRUpwV1hwb2FGbDZUWGxhVjBrd1dYcGplazB5U1RWWlYxSnNDbGxYUlRSUFJFMHhUbFJyTlUweVdYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHJSME5wYzBkQlVWRkNNVzVyUTBKQlNVVmxkMUkxUVVoalFXUlJSR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZKaFFVRXJlVUZCUVVWQmQwSkhUVVZSUTBsSGMyb0tTVE5oT0ZsNVpVWlZRblZtUVRabGFXaERPRzlpWTFFeFlpdGtVRzVSVmtaak0zSnVkVmR3ZWtGcFFXNXBVa3cxYkhFdmJFNVFlWFpsYWtvMk1qVmpLd280UVRsc1MzSXlVRTVFVVZWbVlubEhXV3RDZEdwVVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1d1FVUkNiVUZxUlVFMU9TdG9aWEYxVTFSVUwwNXJPRFV2Q2tGTFFuVlVNbXhVU1dkdVlXcERSVXB1VFVjM1FrTmlXVVJQTW1kWE5DODJZak50TmpGUlVrOVJVV3B2V2k4eFNVRnFSVUY2WmtwVk1pOXdXblEyY0VvS1VIaG9RVEZ2VEN0R2VsQkthSFkzTjNObWNqWmpUMEpYTVhOTFJtWkZXbk5XUXpKYWIwbEhLMHB6VjBockx6UjZjV3ROU2dvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667957269,
          "logIndex": 6757338,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "a0c6b8e1a0bc8ac32eb4c733b9adeaa88355993f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3424609369",
      "sha": "a0c6b8e1a0bc8ac32eb4c733b9adeaa88355993f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

