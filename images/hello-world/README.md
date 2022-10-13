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
| `latest` | `sha256:0fbd8c836c87a436385d4ea6ff709a303f41194daab250da0b832a5679f37b1c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0fbd8c836c87a436385d4ea6ff709a303f41194daab250da0b832a5679f37b1c) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:0fbd8c836c87a436385d4ea6ff709a303f41194daab250da0b832a5679f37b1c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "98d2eb923d1e191864ac0db35893f3e943e1964c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDdHxxQUAoG3wOAOWZrOFZNnIutPtOzR4N4gd/LrHuAQwIgSoS+AtJ3QT8ptMgEVVvm2Ed3RN0dZmE1pYeqcxXGgXM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5OGQxMjJiZGNhNTgxMTU5ZGQyMDdhN2JlNTVhZjIwNjY5NTVjN2Q3ZTgxNjExOGY5NjNhNzNjZDQzNWQ2YjhlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR2lFN0ZSRXhBVUllQ0luNzNEU09IOHpBMXI5Vk96KzRrV0VISFhUSWlzOEFpQXFOZWlRNisxWGU0aUlwTDRGZEJHaE5wSGR0M1BpeXJrK016bHYxMEpUSXc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwaFowRjNTVUpCWjBsVlVUUTVlVlpRZEhGbWJtaDFXRkJpTUZKR2RYTnBaelZOZG1WemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRjVUMFJGTkZkb1kwNU5ha2w0VFVSRmVrMXFRWHBQUkVVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKWW05TGVtc3haVmN3WjBac1YyVjFRemhNSzNaNlZXNTVaVVoxWnpaSE1VNVdVRGtLVkhWalRIbG5VM2d5VkZsemRYZ3piVFYyYjFoR05tNHdhRzVXVWxwaWJFdHFZVVZLZFhseFUzSmtMM1ZxTVZCSVN6WlBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUyUVc5QkNsbDZLMEZvY2pGRWMyZ3hjVEY0VTJKdlYzbE5kMWxyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJVMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRVkozWkZoT2J3cE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFYXpSYVJFcHNXV3ByZVUweVVYaGFWRVUxVFZSbk1rNUhSbXBOUjFKcFRYcFZORTlVVG0xTk1sVTFDazVFVG14TlZHc3lUa2ROZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV1JaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmhSMVp6WWtjNGRHUXlPWGxpUjFGM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkS1FtZHZja0puUlVWQlpGbzFRV2RSUTBKSWMwVmxVVUl6UVVoVlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFF3ZDJsVVozZEJRVUpCVFVGU2FrSkZRV2xDV2tkWFVtVUtjMGN5ZDFBelNFVnVaME4xU2pCNU4yWk9Ra0p5WWpNME5URTNjVkp2UmpRMmFYWnNWRkZKWjJGcFp6TnJabGhWTmxsd05sbHFTV1V5Ulc1cVYxaFZjZ3ByYm1wR1MxTk9RVFpOVFVvelRVWlBNVWN3ZDBObldVbExiMXBKZW1vd1JVRjNUVVJoUVVGM1dsRkplRUZOTDA5TFVVMTFjVFZYYlZOdGJ6ZHplR2hsQ21sMVdsQklRazU0WkhOMFpqQk1SVGxhYWtSbmRtRk9kblJaVkhsTU9UaFVRWHAzTWpoNFQyWlpiRGwzVmtGSmQxZG9ZVFU0VnpKQ2NrTjJjR3RMUjBnS1UxbGtZM0pJU0ZGdk5XeDNTRXhXYjBGbFNrZFNXR1pQUkVKaldrVnJObVZhWlRjMU5HSnlhRzE2U0VkRlIwOUdDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665692908,
          "logIndex": 5049645,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "98d2eb923d1e191864ac0db35893f3e943e1964c",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245456231",
      "sha": "98d2eb923d1e191864ac0db35893f3e943e1964c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

