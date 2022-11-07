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
| `latest` | `sha256:fba69d75518826fc9a3c47c2c7edc150eb3c1d8c820190707453e245693d8289`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fba69d75518826fc9a3c47c2c7edc150eb3c1d8c820190707453e245693d8289) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:fba69d75518826fc9a3c47c2c7edc150eb3c1d8c820190707453e245693d8289"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "94ce95a1c27075a037fcd4bfe038eb7fde3b5130",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHVOFEgnwqRClCVl1sCL1bWwOS8qz/9MVVXZghOv+u/lAiEA/laihu9Xfzkv7uFwgZ7Tu7d+Q2C6z/vCK3iLbN531is=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2YTM3ODZmZTI3NGQ4N2JiNWM2Yzc2YzMwMmFmOGU3YTllNjQ4OTUxNjllZjAwNjU0Zjk4NDI5MjgwNDEwNWUxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQVZyRFRXS0VGL3JUOUROYklrNGtUazdFRVpqREl1WFN6ZG82dTY3ZWd4dEFpRUEwNDB6Z3VWd3NCQVhyMVMyN0oxVFZaVllPQmpIU1REZENYRlpNbnNyYVBnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlZEZFFNM1ZLVVVkRmNHeG1Razl5VjIxdlRGUk5VRkZtUzJ3MGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFVjNUbnBKTTFkb1kwNU5ha2w0VFZSQk0wMUVSWGhPZWtrelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKTjNab1NUVldOMkYzTjNjM0t5dG5MMEpsYmtOTWQxbFdXR0ZKVG1oMmJrMU9ORGtLTkc1dWRUQldRMk5RV1doT1IxbzBiVWwwY2xodFpXNVliR2d4Tm1Gc05rNWFiMnRTYzAxVGJHTmlZemczTm1sNFJIRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZDVWxVeUNrZDBObkpOU0N0TFZYb3plREptT0dWQmRsZ3hOMkZ6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyYzFUa2RPYkU5VVZtaE5WMDE1VG5wQk0wNVhSWGROZW1SdFdUSlJNRmx0V214TlJFMDBDbHBYU1ROYWJWSnNUVEpKTVUxVVRYZE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFVXJaM2hqV1VGQlFWRkVRVVZqZDFKUlNXZ0tRVXhPTVVoNmVFTlVhRE13YjJaMWFDdFRValk0ZDFoTmMxRmlSa1pQU0RSMU5GbEtSVUZCVUVNMFEwdEJhVUUyZEhkTE5HSTBORFJpWm1GWGIyc3ZPQXB0WVhoNFYzUTNTVkJXTWpVd2EwMXhNR3AwY1U5VVEyb3hWRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJkaXRHTm1sM2JFbElVM000Q2xGemFuZFRURTVZTlZWeVJTOXRZWEV4YUVJNU1FcE9URlZWWjA4NFFUZG1NMDVCVDJaWFdWcFJXamRvVG5KcWRVZzRkVVpCYWtKTVQwZDVSMmRuZDNRS1puaExSa2swYzJkeWJHdzRjR1l2T1RSM05taFNUVm96UTJSVWRtOVFRbFZETVhCd2JsWXZSSFF5YW1sNWFHSldiSEF4YkZsWWJ6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667783255,
          "logIndex": 6650175,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "94ce95a1c27075a037fcd4bfe038eb7fde3b5130",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3406805661",
      "sha": "94ce95a1c27075a037fcd4bfe038eb7fde3b5130"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

