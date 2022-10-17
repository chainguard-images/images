# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml)

Alpine base image built with [apko](https://github.com/chainguard-dev/apko). Uses packages from the [Alpine distribution](https://www.alpinelinux.org/).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:35505ff2cf536d1fd05cbdeb3816eb4bdf4a2cba62126023b435361f92c9db5c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:35505ff2cf536d1fd05cbdeb3816eb4bdf4a2cba62126023b435361f92c9db5c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

```
docker run cgr.dev/chainguard/alpine-base echo "hello"
```

See the [examples/](./examples/) directory for how
to use this as a base image.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/alpine-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/alpine-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/alpine-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:35505ff2cf536d1fd05cbdeb3816eb4bdf4a2cba62126023b435361f92c9db5c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "74fff540d4661c815ecde2b30c99c9a8734d0d27",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCiCAQT9+VStCiL0mzlx3ccUfoe6qa4j093bbAWpDvRagIgXoYPVA3d2JM5/WRUlxpaDF4Ms7XRUh57BkV0FlFEA8Q=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3OTRjZDBjNzIyMjY5ZmExNDU5NWFkMWJjMDFjM2RlNDAwNzBlOTgyZmE3YzdkNDA4MTA2Y2M1ODhhMjgwNWQzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRmZQN1l0THA0bEdXeFZDS25GdkllN1dNTjgxVUlqZkhHekpNQ25PVkdLZUFpRUE2WVMxNy9kUlk2cVJYTVBIRmdpU2l3STM5OStVZHljK0tJd21WQVJ6RjJBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwMVowRjNTVUpCWjBsVllrMWhTemx6VUVONVJtc3lSR1JMT0ZsUWNEZHVjR1psYjNWcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFVjVUWHBWZVZkb1kwNU5ha2w0VFVSRk0wMUVSWHBOZWxWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZoTmtreFVDOWFjMncwTjNKSE5UZFFSR1U0TlZWUGQzVnBUMFJUUkRGbVQyMUtiM29LY0VKM01VUkVUeXMzVDB0M1lXTnFTelZUVUdsNFlrOUVWVVpOVUdOd05rMUpiRVExT1hGMkt6bENaMmxYZVVrdmNFdFBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU0YURnckNpczJia1J4Y1haaldVcFdlaTlRTmtaRFdrTm9NMDlqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3pUa2RhYlZwcVZUQk5SMUV3VG1wWmVGbDZaM2hPVjFacVdrZFZlVmxxVFhkWmVtczFDbGw2YkdoUFJHTjZUa2RSZDFwRVNUTk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p5dFBTMUZwU1VGQlFWRkVRVVZqZDFKUlNXZ0tRVTFUUWxSMVIxaFBVbXBwUkV0VmRsTjNaMGxWTUVKSlIzaG1jVmxtTkdObVpHWnZhRUZyU1dsUWRUQkJhVUpQVmtOcVJGQnphVzlIY1c1dEwxbDVTUXBCT0ZCWFRVaFZSelJxVDJWR2EyTjFaa1JaZVRsb2FVTm9la0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9jRUZFUW0xQmFrVkJkRXAwZDJaQlYwTXJUbU5LQ2tGbmJWcFJZMnRRYUU5eFJFcE5Rak5OWkZWS09FVkhlbEIyZUZCb1dYSjBkM3BUU2s5dVpqY3ZjREpOWlU5bE1WaE1VMEZCYWtWQk9GWXdXVzUyUm5nS1ptdFhWblZCVVVWMGMzWlFlV2RKU1ZaSVlWbGpZeXRQWTFOV1VWZFRkSGRXYW5sMlYxZFpNV3RQZVRadVVIVkxlRXRuUlRCaE5YQUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665969856,
          "logIndex": 5247423,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "74fff540d4661c815ecde2b30c99c9a8734d0d27",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3261685913",
      "sha": "74fff540d4661c815ecde2b30c99c9a8734d0d27"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

