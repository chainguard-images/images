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
| `latest` | `sha256:12476753418911b2d6d49cf5dc9c6ac7c93bc9bae20b67b47cb1cc38b307ba3b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:12476753418911b2d6d49cf5dc9c6ac7c93bc9bae20b67b47cb1cc38b307ba3b) | `amd64` |



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
        "docker-manifest-digest": "sha256:12476753418911b2d6d49cf5dc9c6ac7c93bc9bae20b67b47cb1cc38b307ba3b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1f535cce66e7d25e18db8e211309729e0b6cf63f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCGNGz6WHsD1sNC69RPMkPOsSbqzVrxS6KUztl6iEsxuwIgMFFFw5hhZOgxylD6X+zas43604maJOVPyAv7Xy5N3Aw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3YWNmM2MzY2JhNTdmN2M5MWE2MjdmOTU5N2JjZjEzNTVmZTdhZTIyZjJlNWU1MTU2YmFhYjBmZDA3OWRjNTc3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURiQUR0K3RBTUdyZS83VUkzMi95SXJUempxVFpCZ0VwR1FyN3R2TkljVzZ3SWhBTUZPajhTcndLWEd4cjBoalVtcEFMYlBYVU02SUlNOXA5VEFUUC9NMm1neSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwdFowRjNTVUpCWjBsVlYySjRRVzB3WWtOc04wUXpVVEl2Y2s4d1NrTnZhMnRPYmpkUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhsTlJFVjVUbFJKTlZkb1kwNU5ha2w0VFZSRmVVMUVSWHBPVkVrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMU1ZGUlFWWlRPV0l4Y1hac0x6Wk9ObTFGYjBjMFJ6aFBNVmRhYzFrMU1IRkRjMmNLYm5wV09HZExlVzU2WWpsUllVUmtPSFphUkhVdlNIRkdNMlZtWTFSUVEzUmpPSFIzWnlzMlUyMVZVbTFzZFhKMFdXRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4Y21rMENraFVkemRMWjNsTlQwaHZTMjFYUTJFeE5rdHRZa1p6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJFWnRUbFJOTVZreVRteE9hbHBzVGpKUmVVNVhWWGhQUjFKcFQwZFZlVTFVUlhwTlJHc3pDazFxYkd4TlIwa3lXVEpaTWsweVdYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZKd1kxSlFLMEZCUVVWQmQwSklUVVZWUTBsUlJITUtNbkp3U0ZOWVVXdFJWbTVZVlhkTE1GTnNMMFJVWTFWMVJuWjVNMGhPU2tOWlVUWlJXa05XY3psUlNXZENjWGhTUjFSUEsybEpNbEZOUTBKU1dEUklSZ3BhWkVVNWRtNUJaRzVSWjJwMmR5dE9UVTVvY2pOUlZYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlWRkJkMXBuU1hoQlQwMVljM0E1YWsxNFpHbzRjREpNQ2t4MmJYbE5UVE51TkVKT1JFTmhTWG80WWtrNVJ6QXpUMGhsU21WaFlWY3lVRlJwUlZkdVNtUnZLeTl0UjFOM01WZG5TWGhCVFZCUlYwZENORlZMWWtjS2NXcEhjVUZDZUdSbVZHMDFkRGhLVm5remQxQTFOVWRDVXl0MFRGcHhNR3B4S3pWcVlVUndaa280UjNkdFNISmhiREpvU1UxM1BUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668216333,
          "logIndex": 6905038,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "1f535cce66e7d25e18db8e211309729e0b6cf63f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3449012903",
      "sha": "1f535cce66e7d25e18db8e211309729e0b6cf63f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

