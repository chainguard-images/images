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
| `latest` | `sha256:8f4205224a0c1d981307eb2f66df76c8d168bbdb494b5b0e3246d37a76284dff`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8f4205224a0c1d981307eb2f66df76c8d168bbdb494b5b0e3246d37a76284dff) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:8f4205224a0c1d981307eb2f66df76c8d168bbdb494b5b0e3246d37a76284dff"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5e6b8c06e7d8f7bd783c3126fa12807c1458dcce",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQD36mkUqrBqI3Av4JjFjllNfaKYsQQ6AwYZKNNKbr1tiwIhAM5so7Kt4RBVks12cSqhFNN/2Kb3XEQI+7/6y6feFQGb",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiNTI3ZTMyNmVmYThjYTk1ZTFjY2MyNDI0MWVhYThlYjQ0MzI2NmYxNTg3NzE2OTQ2ZDMzMmEwMjE5MWFhOWE2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ2xnVjcycVBmdkxIN2dSdlYvRDdjM3hMclBaRWhqR1JhZEs3QURjSEt4cUFpQUdBcDJIS3hRTWEydENHUHF4OWVEWXFvb0ptZmxXUmc2NWZ0ZWdWTG1VdGc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVlRHMVJWM0FyTkdvemJFZHhjMlozVW1WNFJrVlNSREZSZEhodmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhsTlJFVjNUbnBSTWxkb1kwNU5ha2w0VFZSRmVVMUVSWGhPZWxFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZUVhwd0wycHdiVVUxY2s1Q1QxVm5hMEpLWTBOcGNYTnRObXQ2UW05WFUySkJaRWtLYzNkbVdVZHNXWGxyUkhRMWRscFRSM0ZCUTBORlRsaGtTVTlKYkhoTk1uY3dabkZHU2xFNGQxVmxXbTFqTVdGblMyRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZVV2xaV0NsWTRSR1J1Y1hoUGRuRnZkRmR5TjFaM2FGaE5PSGhGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3hXbFJhYVU5SFRYZE9iVlV6V2tSb2JVNHlTbXRPZW1kNldYcE5lRTFxV20xWlZFVjVDazlFUVROWmVrVXdUbFJvYTFreVRteE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFZHNaek5YWTBGQlFWRkVRVVZuZDFKblNXZ0tRVTV4TjFCTVFVVk9UblZ6VUV0MFkwSjJORFZKU0dkRGNrSXdSbUk1VTJaNlIySTJSWGhUWW1KMVdUUkJhVVZCYjA5RmJGVk5UaXN3Y1hCRFoyRk9iUXBaYlVsUWQyRndMME5vZDBVMlNubE9kM05pTld0WGJURkdORkYzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDRRVkF2TW1wUGVGSlJNR1JSQ214NlJGcHVOM0V5U2poNVpVSnFkRWwwTUdKUWNXcFBXa1J5VTJ4U1QxazFTa3QwYm5kdmQzQkdhM1YyVUZReFpIZzRlRXhUUVVsM1MybEJUWFJFVDJjS1ZXaFBjMFF2V1dJdlVXWmFZM1o1VVhkMWRGTlRPVTl4WlZGbE4zaE5OblU0VWtOM1JHWnlWWE5YY2taWFNESTJNa3RNWTJKbFVuSUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668215275,
          "logIndex": 6904265,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "5e6b8c06e7d8f7bd783c3126fa12807c1458dcce",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3448954147",
      "sha": "5e6b8c06e7d8f7bd783c3126fa12807c1458dcce"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

