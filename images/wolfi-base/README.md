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
| `latest` | `sha256:9593f992835c6eb5a97984b01163b67e5e7c8a75894ad0284b408b7ae380f4c5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9593f992835c6eb5a97984b01163b67e5e7c8a75894ad0284b408b7ae380f4c5) | `amd64` |



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
        "docker-manifest-digest": "sha256:9593f992835c6eb5a97984b01163b67e5e7c8a75894ad0284b408b7ae380f4c5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "400ff89cf48ee08cc622600490a8bacb19c6890b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDeHrQosz/feI3+L9mN1CDJJ9e4/Ot4chzN3h4aqnq0UAIhAMTt4Ho/9xgSXBevw8ahj02maoSOd895DHOQftmKtTqD",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4MmY3YWU5MWYzZGE2YzAxNjkwZTFjY2Q4ZjhlZGY2OTYxM2U2MGFhYmZmMGY4MWRlZWZiMTQ4ODdkZDk5MzM2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRGcxWTE0cGpjWW9yMkZHNVV1SnR0R1JQNkFHVkFEOGFvNy8rS25nSXI5QUFpQmMrVW5sSXFkaURrbmZhcXJtdFlobjJEaTM5aDZyR1JETjBRWTB3L0swd2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVldsWjVObVZwWTBSUGJrRlVWbloxWlRSNWFrRnpaMjlZWWtrNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hoTlJFVXdUVVJKTkZkb1kwNU5ha2w0VFVSSmVFMUVSVEZOUkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY2TWl0UFN6SlpXV3hOZVRSbE0xYzROVWhUVHpKWmNrUlhVbTFFV25WSVZWWktUVEVLTHl0MGIwb3ZjRUZLYWtsQ2MzbG9RM0oyUkRaRFZtdE1Rek13TkM5R1ZEVjZjbVUxYlU4d1lqbEJkRzFJWkhWYVZtRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY0V2pKTENtNDFVV2x0VlVSSmFucFZWMFJHYkhCME5ESlNjaTlyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJGRjNUVWRhYlU5RWJHcGFhbEUwV2xkVmQwOUhUbXBPYWtsNVRtcEJkMDVFYTNkWlZHaHBDbGxYVG1sTlZHeHFUbXBuTlUxSFNYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZBMFRYVllla0ZCUVVWQmQwSklUVVZWUTBsR1RESUthbkZIY2xaRGJXNTVOVTB2V21ObmJXSldVV1pPTlhWTlVrTkhXbkZLZFRSQ1JXeERkRzQyTDBGcFJVRnRkMGxpZW10TWFrWm1OalZhUVZZclFqVkNWQXBXTlhSMlVXMU1Oams0Umtkb1pXSjNNV3RXZEhCdVFYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hoQlRUUk1URkUxWWl0TlNuUk9TR2hzQ2pONFZEaHhaV05YY214MlJDOUtkVm8yVkZkRFVtcFBOR3h3VmxBdmFrZHdVMFY0UmpCaGNXdEtaMGcxTTFGTGVIZEJTWGRSY2tReE5tWndjVWxSZHpVS1JYbGFOMkZFYURCM1QydzJMMGM1TkdSU1VEbDVVbWxtVTJ4MU5rdzRLM2RaTkhWVVQyeHplbFJrUnpOcGNqTndXV0ZRZHdvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666316433,
          "logIndex": 5531249,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "400ff89cf48ee08cc622600490a8bacb19c6890b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3294170748",
      "sha": "400ff89cf48ee08cc622600490a8bacb19c6890b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

