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
| `latest` | `sha256:2301db736c454b47f4a4efae4db6bf9081e400359e9135a45a44380b79251a3f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2301db736c454b47f4a4efae4db6bf9081e400359e9135a45a44380b79251a3f) | `amd64` |



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
        "docker-manifest-digest": "sha256:2301db736c454b47f4a4efae4db6bf9081e400359e9135a45a44380b79251a3f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cb39c37e253cf0de0cc1254d373f81af49ced891",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEEsNbXuPiWaI1NSAEdNTDwkFyy3hcOMc2gs7rxQhEOUAiACqTaN0ndHdT+BF1S64hfsjFj26uQX0lYP/CZytjCrtQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmZWU2NzlmYWMwN2FlZDVlMjYwNWVmYTgxNmYxODdlOWNmM2U0MTg3MzM1ZTIwZDAwZWIwNDE3MjhlMTE5ZTE0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQkpDeDBoSmxtZUxwSWVybkxmUU1Od3EvNkRsdDFZZ1BkK0hVUFpBMnhoc0FpRUF5dDhBRWV4RUQ0ZUhnVzBDTEdRK1UzRGtrQjQwOExZWnJqaW1QZFErV2xVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVlNVMUdXVklyYTBSMU9WUk9kRFV2VlRkbk5FcG1TRE5QTVdRMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFbDNUMFJWZUZkb1kwNU5ha2w0VFVSRk0wMUVTWGhQUkZWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZpYVZGVFNWTXlZbW92VmsxMUwxQnZVMEZ2YzI4MWFsY3lRa0U1VGtkR1ZESklWRWdLTTBsRlFtTnNURnBJTlUwNVoxZE1UVGhEUzJkalJqaEhUMnRIU0VzNWQyTTRVa2xSV0UxclNGWTFNaXRqTVRSNVFrdFBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZWVDBaaENqVnpRMlZQVWtWQmRHTkJhVlF2TjFOYWVDODNaRWhaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIwNXBUWHBzYWsxNlpHeE5hbFY2V1RKWmQxcEhWWGRaTWsxNFRXcFZNRnBFVFROTk1sazBDazFYUm0xT1JHeHFXbGRSTkU5VVJYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCcWN6TktRa0ZCUVVWQmQwSklUVVZWUTBsUlF6WUtSMFEyWTI1MmFEQkxiM1U1ZVhsU2RIZHVkRzVMYlZKYU9EZDVjRkpSV0dsUFVVSjFkM1JLTTNGM1NXZFZibVFyUzFGMVdsQk5OV1JZVDNNMFdWRkJVZ3BXTjNNemRIaEtNM0JPZUZOVVRFdzBRa056SzJKQ1NYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hoQlRrcFVaRXAzYjFoMVZHWTFPVXMzQ2sxRFowdEphSFF2U0ROa1oycHZWVTkzY2tkSGF6aFBiRTVXUVROaFQzUXhZeTluUkVKblJrbDJjRE5IYkdaQmQwaG5TWGRKZWxocWVrdFNhR1p5YUdvS2RYazJTSGxzWWs0Mk0zUnpZVVpJTVd0bWJHWkNSbU5VVEU1NFIwWXpiekpMYkVzMGFtSnRLM2xwUzI4dllYTXZRemsyTVFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665972535,
          "logIndex": 5249369,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "cb39c37e253cf0de0cc1254d373f81af49ced891",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3261859827",
      "sha": "cb39c37e253cf0de0cc1254d373f81af49ced891"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

