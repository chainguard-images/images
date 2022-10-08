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
| `latest` | `sha256:761ed906b464c18f19d2a28fe7ab4e6e75ddeb4a60cd1d1a7e0539c999f2d17f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:761ed906b464c18f19d2a28fe7ab4e6e75ddeb4a60cd1d1a7e0539c999f2d17f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:761ed906b464c18f19d2a28fe7ab4e6e75ddeb4a60cd1d1a7e0539c999f2d17f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e9b7c010c445c26e9c9c9164faaa7848e508c61b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDAUfvGGVmLarCsMEPePlfDQmaq2g/n3BiecnpF0gm3MAIhAJAy7EVt9OSXm7lY3rMgJYSa474QmUsfZYWCvoLgH/hp",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxNTE2ZmY1MDc1OTkxZjVlNTE3YTFkNWY4MzgxM2M1NTNjNzYzMjE3ZGRmYzA0ODJjYTgxNTk1YWVlNmY2OWNhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRnV1cW11RStDQ0pTLzlWWlFobXZZV3pSWnpNOHdvcUJmNjNLUGdkQklWZ0FpQi80UGt3SjVIZVhqUjhydk94ZXJpYmJac21vRGk2dzJlQnJ6NlA4TWQ0SXc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlZHeGxUMjgyYzNGd2FHeEtUWEpQUVVKNWNXbHpXbmgzVERaWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRSTlJFVjNUbnBGTlZkb1kwNU5ha2w0VFVSQk5FMUVSWGhPZWtVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZEV1ZWVFYzSlFaMFJSVnpGM2RHMVNSVEpJZVdwSk9VcEJUVk54UkhWVmNrcDJXVzhLTTBkTVJXMXNVRUZWUkZBeFZWWm1kWGhITlU0MU9YQXhXV2RxTWpJMmNVUjNibEJsY3pFNVYwNHpaMUpsUVZKdWF6WlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ1T1Uxb0NscGpkRVZCZUdvcmJUaDVNbVoxVG5GVU5qUjZUbEpSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHNUMWRKTTFsNlFYaE5SMDB3VGtSV2FrMXFXbXhQVjAwMVdYcHJlRTVxVW0xWlYwWm9DazU2WnpCUFIxVXhUVVJvYWs1cVJtbE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6ZFZhRE55YjBGQlFWRkVRVVZqZDFKUlNXZ0tRVWxXTW14cU9FaENlVXN6ZDJoallXcDNiMUprUVVOSk5FWnFiMWM0YXpGTU1qWjZhRmx4V2tOWVRFRkJhVUpyWXpsUmREZHlkbmRRVkZFMVZpc3pOd3B6T0VGVlJIZFVTRGRaUjNkMVEyVlRWVXRrT0RKSVJEZzFha0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJLMVF6VnpKbFJHTkVSMUJyQ2paMFlrVnpMM2xMYTFCWlRWSlJOM0ZyVDBGTlUwbEthRUZsTVU5c2RHNUhiVXhTUms5aGFsQkxTelZWVEZWWk5HSkliRmhCYWtKT0wybGtLemhxTVdNS1FYTnhaVmxJU2xBemNpdHBRVGQ2YldWUFJVNUpWemcwUjFkUVZqRnROVE5zWW1OelNrcGxhM3BhUVhsdVRYaHZVVVphY1RSaGJ6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665191278,
          "logIndex": 4664883,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "e9b7c010c445c26e9c9c9164faaa7848e508c61b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3208575350",
      "sha": "e9b7c010c445c26e9c9c9164faaa7848e508c61b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

