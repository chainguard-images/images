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
| `latest` | `sha256:774c8969314392389496626643988a8e3736e89f760eabd0bc884a734b34a190`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:774c8969314392389496626643988a8e3736e89f760eabd0bc884a734b34a190) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:774c8969314392389496626643988a8e3736e89f760eabd0bc884a734b34a190"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2ed447300b6c2a2600864a593cd7fa0ee6e51a95",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICfiPBET8x7sCw/l129fhlGOJXV6pMHKE97OqLGNah0WAiEAgXsgn7ZpC499k+3Kt30XND9AT66Gka8J2yCFgaNZNz0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZDNmZjA4YmE2NTVlMTQwMzRlMTQ4MTViOGI2N2ZlOGQxYjM5MDRmYzM5ZDNkMzgzYTU5YWY0Y2UwODY1ZmE4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRE1PekdDR0prdmp0NC9aRVh3ellYRVh1M3VOaTh4K2xLMlhRaFNWcUNGRkFpQjZ1am1UVC9rc29Yakh1d2VJVWtTS3phR0NHYmVPbFgzMVlURnExK3BJdUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhwNVowRjNTVUpCWjBsVlVHVnZkRGN4V0ZJMlNreEVWMmhDTW1WcGVuSXdPREZ6YVZOSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RWTlJFVjNUVVJSTUZkb1kwNU5ha2w0VFVSSk5VMUVSWGhOUkZFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZoWXk5T2JVd3ZXbFJETmtOSWJEQnBNMDVzUWtzNGVVUkxhaTlwVTBFMVVHVllNWFVLUVRKb0wzcDNWMnMzWW10WFlWTlhWeTlNWjBORVp6VlpVMjh3ZVdkdU5VVlNZbEV4UWxkdmJrdEJkeXMzUkhKQ2FtRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY0VGpWaUNtVk1kMlpQWmprekwydE1UMlJzUzNWalRHRlhNRkJyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDVXbGRSTUU1RVkzcE5SRUpwVG0xTmVWbFVTVEpOUkVFMFRtcFNhRTVVYTNwWk1sRXpDbHB0UlhkYVYxVXlXbFJWZUZsVWF6Rk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFTkdRbHByTUVGQlFWRkVRVVZuZDFKblNXZ0tRVW92ZG1KTVMzVkRZVFE0YzBWdE5VdDVNU3Q0UjNjM1kwODRTaklyYkdSVVpWcFRVRWhUZUVkbGNtTkJhVVZCYkM5MmVWSlVhR1pDZUdOdFpITklVUXAzYm1sTk5sUnRaMHMxUVdKcFJscHRlbmRJVldKb00zcEdTbmQzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZSUVhkYVowbDRRVWxJUVRWM1puQndZMlpIQ25Wc1RtNXBhVms0VmtRemVsaEdMMFJKUlRkbmNrbFlXVnBKTHpsdE9VZGtUVGxrTUhOUUsxQkxURVJqWjNkbGFrcE1hRVF4WjBsNFFVdFJRMG8wY1RZS1kxUjZRVFJhVDJZME1rWm5hWFJOYXpWWVVFNXBaVWd4UkdkdWFuSjBZak0wT0hKMFNuQnNlVGgzYm1WNlZ6UXdlakU1VEVWMlpYVlBaejA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667005265,
          "logIndex": 6073605,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "2ed447300b6c2a2600864a593cd7fa0ee6e51a95",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3349482560",
      "sha": "2ed447300b6c2a2600864a593cd7fa0ee6e51a95"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

