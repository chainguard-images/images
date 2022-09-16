# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/alpine-base/actions/workflows/release.yaml)

Alpine base image built with distroless tools.

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:4c778b57d36a199bb12262e008e9bccc1a85b6788be71f9fd0392089b095c4c8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4c778b57d36a199bb12262e008e9bccc1a85b6788be71f9fd0392089b095c4c8) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

```
docker run distroless.dev/alpine-base echo "hello distroless"
```

See the [examples/](./examples/) directory for how
to use this as a base image.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/alpine-base:latest | jq
```

Output:
```
Verification for distroless.dev/alpine-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/alpine-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:4c778b57d36a199bb12262e008e9bccc1a85b6788be71f9fd0392089b095c4c8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "21b32c76b40fa64b39d17a7a73346d2ec01ccd3c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDDuOmXS+C3pqC13LW/R4onXFKP/wTHsuxJYPaDWfQ/kwIhAPsUJ1kRzeeyfC2BXF6frhJoujVwyxnrUXw8Wbm0QxAm",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0OTE3MzMwYmMyMDhkYzJjZWVjNmI2MjA5ZWJkNjM0MmQwOTJhNTE5ODdmZWJiYWNlMjg2ODRmM2EwMDUxNmFmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNXeDFyZVZkR1lCSDNzdko3SEtTRHkxWmZVL2VIZWU0QkgwRHhoYVozSDVnSWhBUDJMck85dnZXWHY1MjZodktFMU1zWVJ4UElOejhzRTVQSDl4MU56bXdMeSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhrMlowRjNTVUpCWjBsVldFcFNSVGxZTXpGUWRYSk1iRWgxT1VaRWFraFZXRzgzY21aVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlJFVjRUa1JSTVZkb1kwNU5ha2wzVDFSRk1rMUVSWGxPUkZFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6ZUVwdU0yb3ZOVGRTUlRsVGNEWXlkMkpCVDNvNVFWaHBiM2RLUm1Kd05qZGxZa1FLUlUxelIxQm9OWEZyV2xwTmVXOXdaVUVyYXpoblVrbzRiSFkwZW1kaWQxRlliVVZKVTJ0bVMySnNUelo2UlZKMVJFdFBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXT0ZoSUNuSmhOamhHVW5WaGJuZElWek00U0VaR2FHTTRiM0pyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaVjNoM1lWYzFiRXhYU21oak1sVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUkplRmxxVFhsWmVtTXlXV3BSZDFwdFJUSk9SMGw2VDFkUmVFNHlSVE5aVkdONlRYcFJNbHBFU214WmVrRjRDbGt5VG10Tk1rMTNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxcEhiSHBrU0VwMllrZFdlbU41T1doaVNFSndZbTFWZEZsdFJucGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XWE5IUTJselIwRlJVVUl4Ym10RFFrRkpSV1pSVWpkQlNHdEJaSGRCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlRrUXpUVloyUVVGQlJVRjNRa2xOUlZsRFNWRkVlSGR3TVZZNWMxY3ZRbVFyZWtweWJqY0tlRXBRUlV0b2NFcFlNazl4U1NzMVlrdHRkazh6V0U1eVIzZEphRUZKWjNBM2QwdGxhSGtyVGpjclVXWmxPVEJDY0hCemJEVmhSV3hYT0RsVEwxQmpjQXBhVUhJeFpsQlpXRTFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbU5CVFVkUlEwMUdibk52UjNobVpEUnZlVlppZGtkbGRubHJlbEp5YldWb01FdzRiRWRDQ21OVVdXTjFSRTVUWVdkQ1psWnNWekpRVVU5Q1lrczRSV2hoVTI5SVkySnJLMUZKZDJGNVpFMVpRMk5NVUhOVmVFaGpkalYxU1VaS1VrMVVlbTQyVldFS1VraG1SSFp0VTBKQlVqVXlOWFJxVFRWV1dtdHViVkZNZVRaMlp6RjZSVFF2YTFwckNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663290924,
          "logIndex": 3512204,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3064770911",
      "sha": "21b32c76b40fa64b39d17a7a73346d2ec01ccd3c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

