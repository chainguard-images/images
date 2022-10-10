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
| `latest` | `sha256:6a42b2c22d73231a45f76473b2b40f38b127462533d7dc9db5041810942f38f2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6a42b2c22d73231a45f76473b2b40f38b127462533d7dc9db5041810942f38f2) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:6a42b2c22d73231a45f76473b2b40f38b127462533d7dc9db5041810942f38f2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "8ded57d477efd568a4142aaa9da816235b007ed8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCohDrNp/H1r24W52gFFETGpKiwFmuTfKYSjuz/Xlfn6gIhAP209yAS04QVvvWwg7wJEpKJqlxFQyVx/s0vdx4rLZ97",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhYTU0NmNhNWI5ZmZmYzE3ZDUzNDkxNjUzYWQyNjM1MzViMzQwYmFmNDZmMTQ1ODJkZmVlZmE3NmNkN2Y4NDE2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSDNiRWw1YWJvNnlFcmV5MjdKeEVrbEhlcllVYWp6VGpma1F4MHg3cytHc0FpQTFTa1YzNjJVMUtmNDV3RkJIZW1ERGVlZDFTcGZrbnY0YlRQa2p1KzlZc3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVlZGWTRVRGR5VGtvNFNsbHJZM1Z6ZG1oQ2NFdG1lazExV1hWamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhkTlJFVjVUV3BWZDFkb1kwNU5ha2w0VFVSRmQwMUVSWHBOYWxWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwYmpKVGRYZE5TWE5XZEZSWFNsQnNkVXRxU2xKc0szSnlWRmRIVFhwaFRYRjFOSG9LZFZaV0wzTlRhVXB0U0c5TGIwNWpURWhvUlVkb2IxTTNUMXBEUzJGTk5taGFRalZ5WXk5UFVETnFOM0F6ZFhJMGEwdFBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZYV1RRMkNrTkdXRTlGT0daMVJtUndSbU5LY0RkVU16RnRlbUZSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyYzBXa2RXYTA1VVpHdE9SR016V2xkYWEwNVVXVFJaVkZGNFRrUkthRmxYUlRWYVIwVTBDazFVV1hsTmVsWnBUVVJCTTFwWFVUUk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6YzVPSGx0VFVGQlFWRkVRVVZaZDFKQlNXY0tRM05OVjJkaFkzbE5TWGQwTUZnck9XVkxWMDlFYXpaNmFsWmlaRWhOT0hrMlMzUlJRVkF3UVVsSFVVTkpRVEp4VERNME9WbDJZa2t3VTJOTFJYRjJOUXB6WjJOUVpHWm5RM1pWT0VKUVNtTk9jMFU1Y25rd016Tk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlJESkpOak5OZVdVNU1tSlNZVTlZQ25kdmVXUlFiR2RhWjBaVGVtWXpNMUpQYldkUVRVUXhOWG94Y1dveU4xTllibWxJYkhGa1IwdE1VaXR6U2swdlJtSlJTWGhCVEN0Q2N6bGlWMWx3UkRVS1pYbDRTVXd6YkV0UWRHRkZNMEp5Ym5vMFlqaDFjbTgyYWl0bVRFOU1OMUpOTWpSVlluZFpMMlJtVERCNU0zb3dVM1ZSY1VwM1BUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665364978,
          "logIndex": 4785491,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "8ded57d477efd568a4142aaa9da816235b007ed8",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3216282304",
      "sha": "8ded57d477efd568a4142aaa9da816235b007ed8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

