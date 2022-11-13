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
| `latest` | `sha256:c13b0eb1764c36d1f59b400a9473c42da9849dfa1c39cde0bdec10ef477433a9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c13b0eb1764c36d1f59b400a9473c42da9849dfa1c39cde0bdec10ef477433a9) | `amd64` |



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
        "docker-manifest-digest": "sha256:c13b0eb1764c36d1f59b400a9473c42da9849dfa1c39cde0bdec10ef477433a9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fab018ad297c7efe8c7823404aba2969cf0a6e1d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCqGfy1AuIC2CHzbW6/sgxL0KIvyb75tZHxTBMya2dguQIhAJRUvyZUgrcG0aM3phHhn/1w3/UlkyvJ/hpXdZD+rTHf",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2ODRiODYwMjJlY2Q4OGIzMzY5YjFmM2I1OTk2MGY1NmM5NjQwYmY3YWRlNTNiYzMzMWIyM2ZmMzJmYzY5ZDQzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJREU0dTA2YWQvUnRST0pnalRNd1hKUHZkUUdQWjI4TVRhdEpGdjhFdnA4NkFpRUF5Yjgvckc4WnBpYXFkTXJkSmNWWXA5MzA5eDZRN2c3bUZMenJOaVJqdUdVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwdFowRjNTVUpCWjBsVlUzVlJkV1Z5VlU1c1ZUTlJhWGhaVFdONlJqaFBZemcyTm5sSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhwTlJFVjVUMFJGZWxkb1kwNU5ha2w0VFZSRmVrMUVSWHBQUkVWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVVyY2pKa2Nrb3JjR3MwZWpONGFIVXJZUzlvT1UxMWExRjZjVlZ2VDNjcmN6UjNTRmNLTlhkdE5EVndWbkF2Y1V4NU5YWmtWVmh5WVdreFdtZzRWbEJKUm5oS1lURjJSVUpQTldvME5tdDFlR2RSTWtSeU5tRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGUkRZeUNubzFLM2MxUzAxSVIwMXFVMjR4TVhOcFFqZEtiM0pqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxcG9XV3BCZUU5SFJtdE5hbXN6V1hwa2JGcHRWVFJaZW1NMFRXcE5NRTFFVW1oWmJVVjVDazlVV1RWWk1sbDNXVlJhYkUxWFVYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZKMWJXWk5XRUZCUVVWQmQwSklUVVZWUTBsRVNWSUthQ3RuTm1ReU5rUlZlalF5TjJSWmJYUnJSVzVaT0RVeFNXTldkV1JWTnk5NVdHTTFObE5YVjBGcFJVRTFSRkpoWVd4YVlYQXpMMnhtUldvMVN6VTJXQXBwUXk5VloySmhTemh5V0RkSlRtRlVSRlZYSzB4clJYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVduZEJkMXBCU1hkVU9WRjZibTRyZFhkSFkwSkVaRXBQQ2pGelUyZDNZMHBSVTBaVk1teGFUbHAxUkVWUGJub3lVWGh1V1VndlNYVlBaRlF6T0RSeWVrRkpWSFJVU1dWckwwRnFRVEo0Y3pJNFlYSldURXBHTjNBS2VIYzJZMkZCT1d3d1MxWXhkM1IxWmtOaVNWTnhSMmh0YldsNE5pOTRUVE5IWWxob1RXczJXbEp6Um5FNGNEVk9RM0Z2UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1668302898,
          "logIndex": 6964187,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "fab018ad297c7efe8c7823404aba2969cf0a6e1d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3453320391",
      "sha": "fab018ad297c7efe8c7823404aba2969cf0a6e1d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

