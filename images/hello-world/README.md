# hello-world

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/hello-world/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/hello-world/actions/workflows/release.yaml)

Hello, world!

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/hello-world:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:b5cd792d7b2489fb39ccc874fe90af1708d6004295444809bb8ba5c5b4f8bde7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b5cd792d7b2489fb39ccc874fe90af1708d6004295444809bb8ba5c5b4f8bde7) | `amd64` `arm64` `armv7` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/hello-world:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/hello-world:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/hello-world"
      },
      "image": {
        "docker-manifest-digest": "sha256:b5cd792d7b2489fb39ccc874fe90af1708d6004295444809bb8ba5c5b4f8bde7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f735b4ebdb09b1fa35d82416dad5cd3cd285be00",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCLgKMGtymSKeto1DZDGFCTQjaUYfTQ9q/zjfmrdOgkOgIgE4nTiYh9FEx8sQ3UjxmoUGQ9FJKHIJFvCeHQ2lRGOEE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5MTM2OWVjOGQ1NzYwZDgyMmVhMzQxNjU2OGE4NjdkODM3YWIxYzVhMTJmN2U4ZTQ0ZTkwYWFhNzU3ZWQxMTNlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNVVzBtSlVLaWYzV3BQblI0Zm92N1FGS0lTSWw5TEhBTmhmNzdWWStUV2RBSWhBT2xnY3B6WHJnMlNoN2VmSWZyU0xIOURmWVdUY0ZrQVU5WTRHY3VCc1VjVyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhweFowRjNTVUpCWjBsVlRFcEpUQ3RJVUZwNVMxUm1VVnBRYVZKSVZYQlRObTlDTkVGUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhwTlJFVjNUMFJCZVZkb1kwNU5ha2w0VFZSRmVrMUVSWGhQUkVGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUyWlRKc1RVMXplRVo2YkVKYWVHaFVaa2wzU0VWc1owVTRORkJCWmxwcFRVc3lWRm9LZUVOaWVFMU9WbGhYVW5CbWFrbFJNMjlwUmxWa1ZqTmtUMDlVTjNsVGRVTXpSR1pJUW1aUGRVeEpPRkk0VEN0VlVUWlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6UldSMkNscEtZVmhpWVRFMVJXVlJkREZTZWtSNVlsRmtWRGhaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHRUbnBOTVZscVVteFpiVkpwVFVSc2FVMVhXbWhOZWxaclQwUkpNRTFVV210WlYxRXhDbGt5VVhwWk1sRjVUMFJXYVZwVVFYZE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFYzJTR1ZJV1VGQlFWRkVRVVZaZDFKQlNXY0tVWGRwTVdGb04wdFBXV2hXWmk5NlkwdHBUbE5pYUUxcWVUWk5WWE5FYzB0c2VFUTNiWFpHVUVSb2MwTkpSRFJCTWxwd05Hd3hha3MzTWpGU1QzSjVjQXBQTjJkcFQyWmtZVzFMTkhCdFJ6VjBlalphVFc1eU1GWk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSmpRVTFIVVVOTlJYcEpTbk16YVRRelVtZEdZVEl6Q25KRU9VTnBiVXM0TUdaR00wWkNaMGx6TWtOdldTOTBRbEphYkc1U1ZWaFdNVXRHZFhKaFozZDJUMFpoTlN0SFpWWjNTWGRtVG5OWk5qQnVWMlZpVkdzS1pYSnZWRzF5ZERGaksxTnpLMU5FWTFSS2NsRk1Ta3BOUmpKS2FIVjNhWEZ0TVZGdWIwdG9UREp5YzI1dk1IVlRWVlJRTVFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1668301695,
          "logIndex": 6963369,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "f735b4ebdb09b1fa35d82416dad5cd3cd285be00",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3453257333",
      "sha": "f735b4ebdb09b1fa35d82416dad5cd3cd285be00"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

