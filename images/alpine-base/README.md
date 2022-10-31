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
| `latest` | `sha256:8e1331ee6ac226a4c1b8472ec29be6b0f252a037f9e89de2e5983b7430fef032`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8e1331ee6ac226a4c1b8472ec29be6b0f252a037f9e89de2e5983b7430fef032) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:8e1331ee6ac226a4c1b8472ec29be6b0f252a037f9e89de2e5983b7430fef032"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "912efde0355e3ab68b8f9be453de435ba428d83d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAJm9uOrmXzAV87uPPpgt6lVBBHNUkMUid8iMcjjEM6GAiAxfq+UVBaZ/s7oqXlMFvsa8E8PmIjS/BdWiruIqsZE5Q==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2YWQ5MDUyNmZlMDVjOTQzZmY3M2UxZmM3ZDcxZGY2NTQzYTY2YWE3ODExYjY1N2I0ZWEzNTJmNTY2NWRmN2M2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURDcmcyMERCd3VtemZ3cXJCRElWZzNrSnNEL084V1JXUGovc3lJMWYrUzBBSWdNWDFwWlVFdWJkdW8vY0htMTdrOEZiQkpJZG15T2c2aFpEeStOY3htTGowPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlpIbERWR2g1UTBjMVJERlNaVTVqZGtNM2RuTnBVek5yVm5sUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTlJFVjRUbFJKTlZkb1kwNU5ha2w0VFVSTmVFMUVSWGxPVkVrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTT1RseUwySlJhMDFTVm1oRmNteHhNMHBJYUZsd1lVZFNMMFJ4ZVV0bFNVTlplRU1LUm1oSFkyWXpMMk5uTkVkdFowZHRlRTR2U1c5cVRuTlFlRTh4TjJKUE5GbEhLMWR3Ukd4T01sSllOMmR3YlVaaGVqWlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZwYkdOekNtWmtabHBHZGxNM1JUUjFSa2hNYkZJNVUxcEpSbkJaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyYzFUVlJLYkZwdFVteE5SRTB4VGxkVmVsbFhTVEpQUjBrMFdtcHNhVnBVVVRGTk1sSnNDazVFVFRGWmJVVXdUV3BvYTA5RVRtdE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFTjFZbTVsU1VGQlFWRkVRVVZqZDFKUlNXY0tZbXhMWldabldUWktTa1pLYld4U2RXODNVVVJKY1hkYU1HMVFZMHd6V1doM1NHUXllWEJhTDIwMVkwTkpVVU5tWTBSNGJtUklaVEJMWTNaclFYSnFZUXBOV0hOSWJHNWxUVFJLVUhwUGJpOW9XWFpCVmxvd2VIYzNWRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrRXlXRzk1ZURGaE1ESmlRbFJ1Q214aWVXSllaVEZtV0RGR09YaG1jMU5VVG1sRk5YZEpPV1pUTmtoRGVXbE5UV3RtVURGTk9GTm1SVGt6ZFhkUVoza3pUVU5OVVVSU05Hb3pXRE12ZG1JS1EyWnNieTlYWVRBd2NWazNaVzgxZGtSbE5rNDFXV2xWU1ZOMGVUSnBVbWRNZEVoU09IZzVNekk1TDBScVUxVlBURkpUVDNjMVl6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667178948,
          "logIndex": 6190912,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "912efde0355e3ab68b8f9be453de435ba428d83d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3357854397",
      "sha": "912efde0355e3ab68b8f9be453de435ba428d83d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

