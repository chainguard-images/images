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
| `latest` | `sha256:838d93422c83a0781d239925f0ac8228a0986108f01b48f79285d5bbcecb2c93`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:838d93422c83a0781d239925f0ac8228a0986108f01b48f79285d5bbcecb2c93) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:838d93422c83a0781d239925f0ac8228a0986108f01b48f79285d5bbcecb2c93"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "53611d6d89927ae3e12fe114826f0a15f33fd2e6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCQxwlfNEIlN8L7Ct9IR1F1gfhouXHxdQRGljOOAeZN7QIhAKc8meFw3fiVu2M3K7W+XBRnjcVrKFjKWN6gvZzz8jUt",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkZjgxOTFlYjNmODFmZTBhYmJjYWU5ZTliODRmMzRjZTkwNjJmM2JmODM0YTgzNjgwMTI3Njc0MDcwNWVlM2UzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNlWTJ6cEZoYThyQlFQRmJVMkJKaEQybkxoS1VScC9ELzdkN3AzeU1vYjlnSWhBUGg0NEFYTVBYYnNlTWFKU1RUVUY2WTVRZjlGSHkwR1NIdGFqN1dxU2hYdiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlZWRlZiSFJzUWxWeWRVRnJjRVpIYzFGNGJWZE5ZbGs0Y2tzd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RKTlJFVjNUbnBWTlZkb1kwNU5ha2w0VFVSSk1rMUVSWGhPZWxVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZPZDB0YVZqZDVVRlZvSzBsdllWTTFXakZWT0RGMWIzZFlha1ZtZDBaNWRucHZlVElLVDNadmNteEpXVk56WlRWVFNrTklTemhRSzBVME1uZE9hbmc0WWpsWVJuUndia0ZtU1hjeE5WbEZWVlpoVlRobFNYRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZTm5odkNtSmliUzluY1RORFdUZ3hMMjFzVGpsRlEyWmljRmxOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3hUWHBaZUUxWFVUSmFSR2MxVDFSSk0xbFhWWHBhVkVWNVdtMVZlRTFVVVRSTmFscHRDazFIUlhoT1YxbDZUVEphYTAxdFZUSk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFSklWVGd4WjBGQlFWRkVRVVZqZDFKUlNXY0tUbXBHTW1ZeEt5czJMMDFNUjFZd1NrZEhOakp0WlZkMVlqRlJORkJGZVVjdlJrcFZNVVppVjIxSlkwTkpVVVJtV2taeFNuazRhVTh3VjAxUFNIbE5kUXBCVlZaTVZWQnNRMmRuUWxReWFreDRiMkV2YTNndlpqVldSRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrRjRTVEpRVGxKRlNtMVJZa0ppQ2poVk9Vc3hXRmQwVmpSU1VHWmFOM05CY0ZOckt6SkJjV1o0YVdsQ1VYRTJZVk0xVFZGM1lXVjJWM0JTUWxOdVpVcFNWVU5OVVVSTlUyaHNZM1oyTm5NS1QzTXhkbEpoTm5CeU4xbE1aVVZMU25oNWVpdE5ZVVk0TVRGa2JqUlhWVk51VkVrclRFcFBXbFJJV0d0d1lsVnVRMjFLZW5wVk5EMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666746515,
          "logIndex": 5871590,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "53611d6d89927ae3e12fe114826f0a15f33fd2e6",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3325430549",
      "sha": "53611d6d89927ae3e12fe114826f0a15f33fd2e6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

