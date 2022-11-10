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
| `latest` | `sha256:6e261e5dc73fed90071c08763331e5455cba41b1ad5ff8ab27e25a0d7e3b543a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6e261e5dc73fed90071c08763331e5455cba41b1ad5ff8ab27e25a0d7e3b543a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:6e261e5dc73fed90071c08763331e5455cba41b1ad5ff8ab27e25a0d7e3b543a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "22b2ac07a4dead11b95191c8326bdf0572db8954",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEQ4n6qqBT39aOI6bIlT+ZSVBQDY8tw1j7PepHObfbmIAiBvO1R2kFLeI2cn3dJ1tAM0IVibT9jsz4bfxv84JWQQ4g==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxOTU2ODk2OWZiYmEwYThjMWQ5MDE5MDQ1MDEyYTg2MWYxNGY3YWUwY2U0OWY4YTk2M2EwN2RlNWVmMWJmZmFlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURWQ0pzTGNsZEw1RnVYRS9TUDBvdjh6M0xEcW9mMDFMbGpvWkhuVzRjelhRSWdUZkVxSUUyV2NmclhWQzFzWHJ1V2kwejc3RVo1NVlKOUI5WVZIM0JraFJjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwNVowRjNTVUpCWjBsVlRGUm5hMVFyUW5OWVJqaFpRVzQ0VEhadFNreFZjV2hQYkZKbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhkTlJFVjNUa1JCTkZkb1kwNU5ha2w0VFZSRmQwMUVSWGhPUkVFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyVVhkSlZGRTBRM2x5V21wdlFrbGlURkowWWxSNGQxTklhRkZMSzFaa2RTODNVRzRLWWxrek5IRlhjWFpVVEUxclRqVXhhMWhpTXpoaFlVTkVSVlV4VVVFemR6ZENUblZsTTBsUlQyRXJZMGQzZEVOVE4zRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU1T0VaS0NuUnBTSEZtTXpCSE5FZEdaMHR6VTNwQlpEVXdZMHhWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDVUVzFKZVZsWFRYZE9Na1V3V2tkV2FGcEVSWGhaYW1zeFRWUnJlRmw2WjNwTmFscHBDbHBIV1hkT1ZHTjVXa2RKTkU5VVZUQk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFWTRVVEJWTkVGQlFWRkVRVVZuZDFKblNXZ0tRVXhwU0hOclltSkhWVXMwT1RKcWVERTRTblpwTVRKd1EzWklUR1JYTlc5dU9GQkVWVlZqYW1GYVdXaEJhVVZCZURoclRVNDFWRUYwWjFWSVNXMDVTQXB5VFZRd2NYVXliVlZaVTJRdk1XRjJUbUYyY2pnMVRUTjBjSE4zUTJkWlNVdHZXa2w2YWpCRlFYZE5SRnAzUVhkYVFVbDNRa3RxYkVSYVRXbDFZazVWQ2pobWFHaGlWR0p6VmxsclRYUnpaVVpPT0VWUU16RTFhbkpZU0RZMVEyWm5UM0lyUjJONFJYSXhRVFUwTkhCS1lXTlVPVVpCYWtGcEsyVnBPRUpySzI0S1RqTkplbEIwWW1OaVJqVmtNMjQwT0dSeldtcG9UazlOWldObFozVnBWek5LU1ZocE1FdG1MMWhPTkhwU2VFZFVLelZtVjNCSk9EMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668042268,
          "logIndex": 6805121,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "22b2ac07a4dead11b95191c8326bdf0572db8954",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3433123159",
      "sha": "22b2ac07a4dead11b95191c8326bdf0572db8954"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

