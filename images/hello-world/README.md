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
| `latest` | `sha256:dae6eb976af62747c124f87388178b1093c3bb199c533eaf4e0ec0413583361e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:dae6eb976af62747c124f87388178b1093c3bb199c533eaf4e0ec0413583361e) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:dae6eb976af62747c124f87388178b1093c3bb199c533eaf4e0ec0413583361e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "4c19813f585cf4588b2641b5016428266d5345c3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDf0aRX8LSIEA/IhKC5hf+SG625aBzdYVOkg4YMvdGiVAiEAx+4cAVQ1AkUwTiHdLvSmc3RJp7DggRfFtJxs/HVbFGk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1OGE0NzE3ZDhiMGUyZTNlNmZkMGY4Y2Y0NDdmMzc4MzlmMzA4MWJkMjA3Y2FjMGFiOTJhYTAxOTJlMDdmODlhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQnJNVE1xMlNUanNlVlI1ZzlZMHErNEgvNnRmanZZTzJJK3FTNWdLeTNOd0FpRUFyYk8yaFVKMk5EdG1vWHM0WEtJeWllZkpDcTFDenp5d0xOUzJaekcyaUNNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwWFowRjNTVUpCWjBsVlJtWlZNRGRZV21NNGFucERVbkkzYURaVFRVaG9ibmR5WVRCVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlZHZDVUV3BKZDFkb1kwNU5ha2w0VFVSRmVVMVVaM3BOYWtsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZJTDJ0eGRYVjJhVTl0V1U5WVNWWTBNbU5LZGtkTmRWWlBRMGN3TWpRM1FtVjFha0lLZG05RlprWmtOWGMzVlhOVVIxSnBTbU56WlUxdWFVeDZVV3RhV1VnMlRGQnZTVXgxV0ZsVWJGZHFZWFF5Y0VkQ09IRlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2TjB0VkNpdHFTelF5U2xnclptUnRkbHBDZUROTWRTdGhNU3RaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJVMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRVkozWkZoT2J3cE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVW1wTlZHczBUVlJPYlU1VVp6RlpNbGt3VGxSbk5GbHFTVEpPUkVacFRsUkJlRTVxVVhsUFJFa3lDazV0VVRGTmVsRXhXWHBOZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV1JaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmhSMVp6WWtjNGRHUXlPWGxpUjFGM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkSlFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWIwVmxRVUl5UVVoUlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFI2VnpkcWJtZEJRVUpCVFVGU1ZFSkVRV2c1VUd3d1UxY0tVVnB2ZDFwSE9Vd3pURXgxVVVjNGJrOURTMVJFYW1KdFVGVjFZVk0zYUhsS1JsQTBRV2xDZGpReGMyaFpORkowYm1kcGFUUXlXV04wTm1adlVIWlVSd3BOY3pkUVRYVjNhMjFHVURsUlJWVlFXWHBCUzBKblozRm9hMnBQVUZGUlJFRjNUbTlCUkVKc1FXcEZRVzAzUkdkTU5qUjRXbEYzVldSMUwyY3ljMUo0Q2pkNVEyUnlWbFJ0VkZGd1VDOU9hMk5NZVRaSFprZEllVkpoY0ZaamIyOXBaV2h6T0VGdllsQk1ZbGRGUVdwQ2RFWjRTRTgzTmt4UmVFRTRkelo1Tlc4S1ltNTRiRWRGTWxoSU5URTNURGRRTVZsNUx6Z3ZVR3htZDJWa2NXazJSRTFKUVVSWEx6Wk9SVTVJUkhaTlZsazlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665598950,
          "logIndex": 4978038,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "4c19813f585cf4588b2641b5016428266d5345c3",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3236952203",
      "sha": "4c19813f585cf4588b2641b5016428266d5345c3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

