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
| `latest` | `sha256:a8cbdcef9359576e70c1b4b3a049fd2e5fe2e2f8bc7f49a7c7af2f74aeb841f3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a8cbdcef9359576e70c1b4b3a049fd2e5fe2e2f8bc7f49a7c7af2f74aeb841f3) | `amd64` |



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
        "docker-manifest-digest": "sha256:a8cbdcef9359576e70c1b4b3a049fd2e5fe2e2f8bc7f49a7c7af2f74aeb841f3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e8e94c309e5a14cc0d934b0c40937a24915f4f9b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIEs88MXmg45T2bLPufupr+uJCzqmojnLNeqHJtchPZufAiEA8sX2oATmqZIIQNOVQqt2Bx5dQgU/DIpS2qy2uzdfX44=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ZGJiNzVlYTE2MWNjODNkMmYyZjM0OGY3ZWZhZjE5N2YxM2Y3ZWJlZDY0YzA2ZDQ5MzFlYjQyMzBiMWQ2ZjY0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRmZsek90bmtsVkJLelZxSHQxVWVjQnVEb0JRWS82LzhJYm5VTW9FVFZaZkFpQXgrWXd1bHJhZWpwd2ZhUHFFbm1wbVVmZUtMTlk5VHZkSlU5d3ljbzJUMGc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwdFowRjNTVUpCWjBsVlJVdEtPVEJPTVZOSFQwdDVjVEpHUlRWQk0weE1UMWRJU25GSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRSTlJFVXhUMFJWTVZkb1kwNU5ha2w0VFVSRk5FMUVTWGRQUkZVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU1TjFrd1kxcDRZMnh6ZEdWSVVGcDVOMFIxYzFKT056QkJlREZTTVZSSmNrRXZORFlLZG5CaVFVTnRXV3MwTkRGS1JVNVVjRlpOTHl0WWRHMHhPREl2Y2tWa0x5OUlVWGhZUlZkM2VrUmpNbTUxYWpCUFdtRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZsVmxsckNuUmlVR3hUY0hCNUt6TXdNM0ZZTkhWNFdrODNjMEpaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxVTBXbFJyTUZsNlRYZFBWMVV4V1ZSRk1Ga3lUWGRhUkd0NlRrZEpkMWw2VVhkUFZFMHpDbGxVU1RCUFZFVXhXbXBTYlU5WFNYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCdk1FeGhhVUZCUVVWQmQwSklUVVZWUTBsUlEwb0tlR013ZVcxYVJWWkhURmhMU2pJdmMxVnJOMHBKTDBGcWNGa3ZXVGMwUjB0UU1XWm1VbFZLYURKQlNXZEdZbEJMTlVOaFFtNUJUV3BVWmxvclpYbzBjZ281YUc1SGJEVklRbEJQWm5GelpUQnFkMGMxYjBKT2QzZERaMWxKUzI5YVNYcHFNRVZCZDAxRVduZEJkMXBCU1hkUVpuZ3laVGhQWW10R1ZrMW5hM0Y2Q2xwa1ptOTJSbmhFV21nMVMyUnNkVVpNWmtsUUsxTlJUbnB0UkdSd2EycDJjMjkzUzJkU1VHMVlUa296YlVwME5VRnFRVzR4TVRoT1V6bE1RME15ZWtrS01DOUllVEZTZFhJelEyRnBaRVp6YkRkRlRHMDVjSGhGTjBkNVRYVmlZVU5vVkROS1YxRnhjV3hNWVVWSEsyUnBkbFJCUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666058339,
          "logIndex": 5319083,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "e8e94c309e5a14cc0d934b0c40937a24915f4f9b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3270038961",
      "sha": "e8e94c309e5a14cc0d934b0c40937a24915f4f9b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

