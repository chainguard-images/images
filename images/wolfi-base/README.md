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
| `latest` | `sha256:d9733ddb8b0e9af2da36d3889b39950d39069e853b68ab19b46c4ff8ee7436ca`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d9733ddb8b0e9af2da36d3889b39950d39069e853b68ab19b46c4ff8ee7436ca) | `amd64` |



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
        "docker-manifest-digest": "sha256:d9733ddb8b0e9af2da36d3889b39950d39069e853b68ab19b46c4ff8ee7436ca"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e0eef20fb68b3e0ad0e254b0c6107c56a9b1f193",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCID+YFEPRwVT6LqLeoTc2sQZBQHnJANlo+P67ABEB1QmdAiBTNJ2YlLiz4y5xeWvkDxAtr3jTMw5qNCQhchqih4Mc2Q==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZGFkNzkxYzI5YjU1NDAyZTI0NGM1NTNmZTczMGQ0Njg0MWU0ZGE0OTM5N2UxMDdjYWRiY2E2YThjMTE1OGY5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSFU2TzVaVTd0d2VHZGp4YkxrOUwweEZ2ZnEyRW9wUzJqNXhyNSszK0NjckFpQklVT2lEMW1SeElsYzZHRUtFenY3UWIrNnM3WFFoV1pqajg4YXdQMjhXc2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwdFowRjNTVUpCWjBsVlNrVlhhemRsZGpWRlZEUkNNR2xOTUVSWFZWa3pSMWhxTlZaTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhkTlJFVjVUbnBWTVZkb1kwNU5ha2w0VFZSRmQwMUVSWHBPZWxVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ2TldKT1RFTnRiRTFaYlhvMVVVMW9WMlJGUjFWbFUxaDBTbkZhTW5aUWRYUktZVkVLWjNONFFqSkhWbXRDZWtwQ2VHOTVNSFYzYWtnMFRqSkdZV3RaVjBSNE1XTkVlRnBFTDBsWGJXRk1ka2xQUVcxU2RtRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ1Y1dsRUNtOVpiVVEzZFVkaVUzVmxTbFJFWTNscWJYQlFVRlUwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxVjNXbGRXYlUxcVFtMVphbGswV1dwT2JFMUhSbXROUjFWNVRsUlNhVTFIVFRKTlZFRXpDbGw2VlRKWlZHeHBUVmRaZUU5VVRYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZKbVNuQm9kVUZCUVVWQmQwSklUVVZWUTBsUlF6TUtjR1JsY2sxSk5XaDBXV3hDVW01dlJrNXNOSGRJUTJ3eVEzVkJjbTlVT0RGNFRIRlRNell3UVRaQlNXZE9RVVZqWkUxRk9HTnRXSEZaTm5GNFYwcFBUQXBCWkhWVVFXTmlkMWxoTDBkeGVsWnRMelpKVTNkNlFYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlWRkJkMXBuU1hoQlVIRlhSSFJMV1haQlNtcG9Sa0o0Q25sREsyVlZiSFIwVG5SNVNVMU5SVGwyVWpSbldsZFVOVVpqVG10aGRWaHlTRFZ0WkRNM0swUmxia3A0YnpWQlMwTjNTWGhCVEVzMVEzQlZRV0pNVERrS1puZ3hVQ3N4T0ROTmRrOVZVMGgzWW5RdmEzQkhhVEUyTDAxdFpXNXBkekJwVWxCYWNWWkZlbVZOUmxaNlZXMTVSRVUwVm0xUlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668043679,
          "logIndex": 6805896,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "e0eef20fb68b3e0ad0e254b0c6107c56a9b1f193",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3433233125",
      "sha": "e0eef20fb68b3e0ad0e254b0c6107c56a9b1f193"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

