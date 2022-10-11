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
| `latest` | `sha256:ea72af69ab72e9c3fa9b6fa037ce418e426cd8cb26df1577458ba0b4c154797d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ea72af69ab72e9c3fa9b6fa037ce418e426cd8cb26df1577458ba0b4c154797d) | `amd64` |



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
        "docker-manifest-digest": "sha256:ea72af69ab72e9c3fa9b6fa037ce418e426cd8cb26df1577458ba0b4c154797d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0940708c3321b9218724c91e76864c6dcf993df4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBT0UrITsmee4mXxQ4Ks51Sv7Dr9na4eeJG79PyyhwKLAiEAkKUpIDbUP1MbsaZpNgpnBQS5TtgU1NuwKclNc4wFcTc=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhNGM0MDM5MzNiN2YxNDY1YTRjNWNlMjY4NGEzNTk4OGU4MTVjMTU1ZjFhNzU3MGZkZmFiYThlYTQxYzVjZGI2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNDNk9vdnljR3pPTVNiN2ZvUDV3b1duekQ4QjRLcDhGeGFuMmsrNG9HNkJ3SWhBSXNYZzF5cDBUOGlyS3NkaTJ3UUdVeVZ1TG01QTVvbzRxSnZIeC9TTk5wYSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhweFowRjNTVUpCWjBsVlRFMTVabVY1WmtKV2VFbFhjbmRTUVdkbE5WaERjRGxQTXl0WmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhoTlJFVXhUVVJOTTFkb1kwNU5ha2w0VFVSRmVFMUVTWGROUkUwelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYxUTB0bVFVY3pLMlZQVkM5TVdUZHJRVUprVFRkdVpUQkhNR3hHTkV4SE1ISjJlSEVLU1hOSVQzRlFaWEpKU3pRMWQwZDRhVVYzTmtRd1dFbHhMMkZzZEd0bFRWRTRUemRSUTJWSmFrVmtXQzlGYkc0dlpIRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ0UWpkMkNsSjRkbFZpTTNkQ1NTOXhaV2hLSzNjMWRscGxXak5OZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJFRTFUa1JCTTAxRWFHcE5lazE1VFZkSk5VMXFSVFJPZWtrd1dYcHJlRnBVWXpKUFJGa3dDbGw2V210Wk1sazFUMVJPYTFwcVVYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHpSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1VVkkzUVVoclFXUjNRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCRmRrcG5NRUZCUVVWQmQwSkpUVVZaUTBsUlJHOEtOelpSTmxZMmFrTnphVWxaUjBacFdGY3hLMlV3UzJWUVkzUjVTWGRHYlhsNFVIWjJia3hqVDBsblNXaEJTbXBGUVZwcWJHNWhjaXNyZVdWWWVHZFBWd3BIUm1VelNrZzVUREYwU0U1eVkxSTRlVkpqZVdkUmNVSk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSnJRVTFIV1VOTlVVTnBRM2QwY213ck5ESnlSMFJJQ2tab1lYRTBMME5HYkZSa1JtbGxVV1JVY1dwb05Hc3hNMUY1WkVabFNrbEthbVpqZUZsellVeEJZM2s0TDJab1ZtaDNSVU5OVVVNeFQzcFBOWHAzU1ZVS1IyMDFlbGN3WW5GdEsyODJVbGxRUTNOd1VVUmxlRzlsU3pacE1FNWtWV1JhTVc0NVlYVnlVa1YyUkVGWU9VNUtTRWhqUW5acmR6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665453044,
          "logIndex": 4860201,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "0940708c3321b9218724c91e76864c6dcf993df4",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3223563804",
      "sha": "0940708c3321b9218724c91e76864c6dcf993df4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

