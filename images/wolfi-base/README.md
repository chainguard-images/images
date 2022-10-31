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
| `latest` | `sha256:86f3f1ae2c6f0e2a8481524fccc987bafe36a1e354452efa81c9f11d7bc3bcc2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:86f3f1ae2c6f0e2a8481524fccc987bafe36a1e354452efa81c9f11d7bc3bcc2) | `amd64` |



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
        "docker-manifest-digest": "sha256:86f3f1ae2c6f0e2a8481524fccc987bafe36a1e354452efa81c9f11d7bc3bcc2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0b85b9bb30442e85c199415e506bfa8b826bb45e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFN0w2fRPEl3+L1u1Vd1UJJJ9dEbikanVnhde+Lh8jY1AiEA4VqCT/7y+mvPki4wGUi+hm6+DUlFVADhh55m/SPESu4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3OGVhMzkwODBhYWQzNDhkN2E0MmRhMmNmYmQ0OGJmNDg2MTg1ZTUzNTI5ZDJlZDRiOWMxMTkwN2E4ZDVmNThlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQmlyYXFlcWhTRDhQWXpHbWtzMWNrZDA5anNSOGN2ZlI0YzV1OE9UcVg2OEFpRUE3WjFCZzVmS0NydkJiNFVuOGpWeVhsbEgzMm14YmtqdWtNS1J1bCtGa0NnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwcFowRjNTVUpCWjBsVldrUk5NMFJ3Wmpad2R6SklWWGhoV1hvNWNHWkpMMmR6WmtsUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTlJFVXhUa1JGTTFkb1kwNU5ha2w0VFVSTmVFMUVTWGRPUkVVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ2YURsTE9FVmpVVzFQUWt0V2FIcHZja2N2TjNSM2FYcEpMMVJJVVZkeWJYUktTbmtLUkhOU1ZYQTJjRzh5VjJwNmIzcENaWEE1WWxsNGVXNXNOSFJSTkhkeVNUTmtPV0ZPVVZVNUt6ZDBSVmRtU1hCV1lYRlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ1ZEhsNkNqZERRemhPTnpkbU1TdFFSazVWZDJSb2F6QkJhV1J2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJFSnBUMFJXYVU5WFNtbE5la0V3VGtSS2JFOUVWbXBOVkdzMVRrUkZNVnBVVlhkT2JVcHRDbGxVYUdsUFJFa3lXVzFKTUU1WFZYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHJSME5wYzBkQlVWRkNNVzVyUTBKQlNVVmxkMUkxUVVoalFXUlJRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZGeWRubFRjVUZCUVVWQmQwSkhUVVZSUTBsR01HRUtOM1E1S3k5SVpsTlRWMFp1YURGMmJYaG1OVnB1VEN0bGFHWjFiVEo2TkhCVU1VVkVPVzk2WkVGcFFWZzJLek00UVZJcmJXSjBaRXBQVEhSNFdXa3dUQW8xVnpSUGVDOXlOVU4zZFhkdGVIRnBNMjh6UWxwNlFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dlFVUkNiRUZxUlVGNFMybGhjMHg0TkhZd1ozRlNOV29yQ2xKblRtdENNWFpSVGxBdmVUbHdTMHhEV25OblptcENlRFE1VXpsdFQzZDNPRXg2Y2tSalVURnZTakEyZGpkSFlrRnFRbEpsVGtZMU1EQklNVE12U25RS05GcERNbXg0WTA1a1owbFlZalJrVjFOMFlWZEVkV1ZLUmt0alIwWTBOR2d2TTBVMGFESklkRzh2Y25oQ01XZG5kbmhWUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667181262,
          "logIndex": 6192536,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "0b85b9bb30442e85c199415e506bfa8b826bb45e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3357989858",
      "sha": "0b85b9bb30442e85c199415e506bfa8b826bb45e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

