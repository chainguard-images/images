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
| `latest` | `sha256:53d3cb985817d2650a2e6e0e1537874a34b46c691900f1d19af0b9765ca6ccef`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:53d3cb985817d2650a2e6e0e1537874a34b46c691900f1d19af0b9765ca6ccef) | `amd64` |



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
        "docker-manifest-digest": "sha256:53d3cb985817d2650a2e6e0e1537874a34b46c691900f1d19af0b9765ca6ccef"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "01433bc75118f7e86595d610f0753d4001997d48",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCJQ287yIqKgchMuhuXVOkPPWn0l+YcWlulYsK850X4ugIhAI9bjkr1u0nR8jQ+/Ue6yY9fUJ8lA0WEeZFuW9up1zCW",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNTJjMWU1YzBjNzNmM2UwYWY2NmI1NjNhZGQ2YWNjMDgxZWE4MGYxMGI1OWRlOTg4M2VkMzc1NGQ1OGVlZjRjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQWt4eUViMjlPSkpWaFNHNjM2WEhiamhXNGloMXBHUjhIYVAyWVI5TmZrRUFpQlg5VFhUQ0NoWG5oYWVaM2h1T3NKUXhXb1IwMURxL0FPYTBNM2FxZ0ZyalE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVlkyOUdVMnRrZDB0dVMwaEZUa2RuU0U1NmNUZFZTazUxZVZwSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFVjVUbXBOTWxkb1kwNU5ha2w0VFZSQk0wMUVSWHBPYWsweVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZDTldOcFpVNWliRlF6ZWs5eE1qZE1WWGhCZUZGSVRFVllhRlpoY2xoWFdGcGhXbVVLUkVkS1NGZHhWbkJ1VjJ4cGVrSTRNMDVRV25sS1ZIUkdkMjVEZGpOWGFIUkJWU3ROTDA5blJ6Sm1jR2g2VlVGVmRHRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtY1hGU0NtUjBheXRhUVhwalFtMTNSMjlwV1RoM1JXVTRjVWRyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJFRjRUa1JOZWxsdFRUTk9WRVY0VDBkWk0xcFVaekpPVkdzeFdrUlplRTFIV1hkT2VsVjZDbHBFVVhkTlJFVTFUMVJrYTA1RVozZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHpSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1VVkkzUVVoclFXUjNSR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZKUWMyczBkVUZCUVVWQmQwSkpUVVZaUTBsUlEzSUtSVTE0YkRjMmEyOUJNREZaWVU5MlFtODNNVkZQVTBSTWQxQnJSVVZGY1VrcmIyOXpRMUJMUWtsblNXaEJTbGhHWW1KNVptdGFOemhaVEVsaVlYZG5PQXB5T1ZwSVNFNVhUazUxV1dKS1NuaHRjaXR2UkVwcGJYSk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlVVTlpjVzE1TUVKYVkyOVJOWFoxQ2xsWVMySllVR3M1ZGxGR1YwNUVNV3haUzNaS1JFVXdVWEJDYjBZeVRWbG9USEEzY21KcVFsbEdiMlZIZUVKUVEyRTVaME5OUTNGTVZXWlJhbHBNVUVRS1l6RXJVbEZZVDA1ck1ESk9jbEJrY1ZKT2N5OTRZWFp5VTNCWloxQmhXU3RrYzJVelIxVk9Zek13T0hkVVRuVXhSMkY2ZGpablBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667784400,
          "logIndex": 6650940,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "01433bc75118f7e86595d610f0753d4001997d48",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3406878643",
      "sha": "01433bc75118f7e86595d610f0753d4001997d48"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

