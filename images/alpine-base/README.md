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
| `latest` | `sha256:4cb33196e0fee2d5100f01a715fe864ea482e47f8af9f5211dc54257ed9c4009`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4cb33196e0fee2d5100f01a715fe864ea482e47f8af9f5211dc54257ed9c4009) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:4cb33196e0fee2d5100f01a715fe864ea482e47f8af9f5211dc54257ed9c4009"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4df11a30e982eac465d17ea3d0be84b9da613f45",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBoFOs4lrYWf93nIKAN40lzw6/e2ogoAgvfFkhjJJ3e6AiEArvbPKl5lbtaeI6zg8fmAyoEX6gl/Ho9uhuHpWe1TE/I=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4OTIyNTM4ZDcwNzg5NDFiNzUxOWQ5YjA2YzU0OTE2MjMwMDE3ZGFiZDg4ZDk3Y2E2ZDQ0Zjk1OTNhY2M2Mjk5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQmJEdUtORDhLVDI5UHM5OWxqb2Rha2FZeFd4TUs5WlR0NFRXbTNBcnFEZkFpRUE0alYzUUpueXd5OHFyVXFXVzJiWHYrRmZqQVhmemc2U3AyNVVSOFZqUnNVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwMVowRjNTVUpCWjBsVlYyWnNUVE5GUm5aaFJWcFhObmQzU3pSaFkxTjNOV1paUW5nNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhoTlJFVjRUVVJKZVZkb1kwNU5ha2w0VFVSRmVFMUVSWGxOUkVsNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhTmxOSFlUUk9aSEJ0U1U4cmVUZFljMUptUms5TGFtTTRhRGc0Vmk5cWVUUktlRFVLWVM5WWQyRjVNMDlSUTJsMGN6aFhVakpVUTNKTWFUaFhhbVpuWkhBM00zQktSVm95VGtKNlNWTTJTVlF3VnpacVdFdFBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZDWjBwNUNtVkhZVGhUTUdaVFdYUTJVeXRSYTFOVldsaHJlbWxyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3dXa2RaZUUxWFJYcE5SMVUxVDBSS2JGbFhUVEJPYWxaclRWUmtiRmxVVG10TlIwcHNDazlFVW1sUFYxSm9UbXBGZWxwcVVURk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6aFRXSFpxUlVGQlFWRkVRVVZqZDFKUlNXY0tSa3R2U0ZSV04wbElaM2hFWVZVeU0yczNRamxXTWpSNFdVMHhORXREWjFaV05sRjNjelUxTVdKVVRVTkpVVU5xT0RRelZWRnhja3hwYzBkMVNraDBkd3B4Ym5ad2VTOVlUVlZ4TlhsQ2JWUkZhMDV2VUROSFZEVjFha0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9ia0ZFUW10QmFrRlRiak0zUW1OSVNWWXlTRGwwQ25SSmQyRklka2hOTmtac2R6Z3JNWGN3V1dRd01IZG5WalpCU2sxMk9VZFZRVUZwWTJFeVRUbFlhRTVtVDNWU1ZHWmlUVU5OUTJoaldtY3JNalZpYVc0S1pVeHNUa1ZwVDNCQlpGbElWVkF6Tm1KeFRGZHhaVE15UW5sVldGUkxiRmt6S3pKTk5rdEhlbk5wV1d0S09XMTFhWGRWTm5OUlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665450646,
          "logIndex": 4858445,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "4df11a30e982eac465d17ea3d0be84b9da613f45",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3223416102",
      "sha": "4df11a30e982eac465d17ea3d0be84b9da613f45"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

