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
| `latest` | `sha256:76a770d60d5126261e9d49d187963bb6ad3d4d4d17fa245cef1b982b73c2d62e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:76a770d60d5126261e9d49d187963bb6ad3d4d4d17fa245cef1b982b73c2d62e) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:76a770d60d5126261e9d49d187963bb6ad3d4d4d17fa245cef1b982b73c2d62e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "1243232d501eabc79b986c8c78cbd1f2b45dd24e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAv0DNihkMYTkRLjpIChZvC7Po9m5vwUAQv+j94Vyv2QAiEA3LhO0P8akztuiweKnAxhDK5HOCi3YD6xn2ouX0/B0+Y=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1Zjk5NDM3M2E4NjJhMjNhYzBlOWM0MDQxNzFjNmExYWEyNmJiMGMwYTYzZTNmZmU4OTM0ZjZjZGQwOWI2YjI3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQzYvZW1jT1JEQVZLY3pnTmp5TmgzT01FTG9sVGpOL2hCZVFvaFRRMnRNK0FpQVk5dVFBd0RhMjd5My9zNVlWZ0RZbGJzYWZPSmxXYzdtbWRtOVZDdXFUbmc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwcFowRjNTVUpCWjBsVlkydEJTRFJoTmxsemIwRmtNMEZtUVRoelZVUlBLMk5uY25KamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlZFRXdUMFJSZWxkb1kwNU5ha2w0VFZSQk5FMVVRVEZQUkZGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhUlVkRVdUSnpkWEJGYm1oRGRUTlBXRUZDYUdsWmFGUTNUV1EzWTJKWlIxbDBaRFFLTUhOR1JuQTNZalpoZVV0U1Nub3pPRnBQTjA1RlJWRnRUVVV3WlhKSE1uTTJZMEV5VTNkUWNsTlhSelpzWkdkRFNIRlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNVDBkdUNubHJjVlV6WjFod09VZENUMEZEV2pZeGQyRnJjMHM0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJVMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRVkozWkZoT2J3cE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFUlhsT1JFMTVUWHBLYTA1VVFYaGFWMFpwV1hwak5WbHFhelJPYlUwMFdYcGpORmt5U210TlYxbDVDbGxxVVRGYVIxRjVUa2RWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV1JaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmhSMVp6WWtjNGRHUXlPWGxpUjFGM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTVFtZHZja0puUlVWQlpGbzFRV2RSUTBKSU1FVmxkMEkxUVVoalFUTlVNSGRoYzJKSUNrVlVTbXBIVWpSamJWZGpNMEZ4U2t0WWNtcGxVRXN6TDJnMGNIbG5Remh3TjI4MFFVRkJSMFZXZEhSTVVYZEJRVUpCVFVGVFJFSkhRV2xGUVhjNGNsVUtOVFI2VW5scWRWazJURlpOZEdWUlFsbEdPV2wyZDFCdlNYVmFMMDlrZFZoVVNsRkVjRlJuUTBsUlEzbHpheko0UjBjM1pHaHBUVWt4UzIxblNteFZOQXBXU2poUksyWk1OM2hPUzBOMVYwbzNTRGh3V0U5NlFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dlFVUkNiRUZxUVM5bFdGZG5MMUpwVmsxYVJqQmFRakZsQ25wd05FcHBNV2RUWkRaVFdWVjNMMDUyV0ZOTU5pODVhbHBqY2tsSlNIVkVLMUl5UkVaYVowdDJkMjFETUVNMFEwMVJRM04wVlhsS1RtdERWV2wwTkZFS2JHcEpVRWt6WjNwcGJqZ3JaV293V25KWUswVmpiRVE0VFhsQkwzcFlWRkJPZHpSNWVIUlNRVUp5Ukd4SVYzTk5VVUZ6UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667904534,
          "logIndex": 6721008,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "1243232d501eabc79b986c8c78cbd1f2b45dd24e",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3418665040",
      "sha": "1243232d501eabc79b986c8c78cbd1f2b45dd24e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

