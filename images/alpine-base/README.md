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
| `latest` | `sha256:2c9ca10651fc7de809f0c438cab777d61a1dacbd194caf8b06fa67d81f358ab5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2c9ca10651fc7de809f0c438cab777d61a1dacbd194caf8b06fa67d81f358ab5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:2c9ca10651fc7de809f0c438cab777d61a1dacbd194caf8b06fa67d81f358ab5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "78e9fa152a052f5af50c112bcb5dda8b52231c20",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD3c+ZQN3+e0NBC7WeNNfo18go6nf2N/8bwmQE9JmaxrAIgRo45GAIZs6blxwg7gRupZ7B3zccixjw+2DtZwtH41XI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1ZWI3ZTUwNjlmYjEzZjFmMjgzYTM5YTc1NWQxZjIxM2ViNzI4N2E3NmE4NzU2OTMwYTQ5Nzg1NmVkN2RmZmM0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNzUW55Z3NycEpoS3RYVW9aRkIvRVAvRWhkWVpOaW82ZVdnN2RxYXpnbmhRSWdUYUMzMTI4YWVBSVlZeC9mUkxDdkhqeFVmL1RJT3E1blZMV0sxL1BHcUZJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhsNVowRjNTVUpCWjBsVlZXbFVXSGxoU1VkU1JWRTRLM0ZGWkZWRGFrZGxaM3BOU1hsM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFVjNUMFJKZVZkb1kwNU5ha2wzVDFSRk0wMUVSWGhQUkVsNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUUVRWMlNuWjJNSE00ZUROMlVEVlpiamx1TlVKVmEzWlpPVlpDUkV4NGVFZERXa1FLWm5selR6Rm9jM3BLSzA4ellYVTJUakI2Y1RSWVFtRktZVzB3Tm5ocE5HWm1XVmcxUjBFdmVFeE9ZVU4wZVV3clprdFBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtY0N0U0NpdFZZV2xHTmxJdmVVcFVabEpYWjNkTFF6QXdkVXRyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaVjNoM1lWYzFiRXhYU21oak1sVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUmpORnBVYkcxWlZFVXhUVzFGZDA1VVNtMU9WMFp0VGxSQ2FrMVVSWGxaYlU1cFRsZFNhMWxVYUdsT1ZFbDVDazE2Um1wTmFrRjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxcEhiSHBrU0VwMllrZFdlbU41T1doaVNFSndZbTFWZEZsdFJucGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XV3RIUTJselIwRlJVVUl4Ym10RFFrRkpSV1YzVWpWQlNHTkJaRkZCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlRra3ZWWEZQUVVGQlJVRjNRa2ROUlZGRFNVRjROR3RYZEZGRmRHUmtjRUpVYkhST09WVUtTVFYwVnl0bmFrdDBkM1pHU0doWUwyMXBNRm8xVGt3d1FXbEJNbEZaUkdsTlMyTTFVakZzZDA1VlVYQXZTM0k1TVcxSmFUZzFia0YzYURCQk5WTm1TUXBHTUZoSGQzcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RuQkJSRUp0UVdwRlFYVkRNVUp3VDBzemVVZGljM295VlUxSE5YSkRURTgyYXpkeFQzWlpaM1k1Q2tKM1FqbEVVMUJEVmpCdGFDOXVSVTlXUmtKUVNXOTVXRmh6YW1oVmRIa3hRV3BGUVcxYWRuUkZaV0YwYkVNNVZsTjBVRzF4VkdGWFluQjBNVlpYYkM4S05EQlZWMEZyWldOMFJUZFhiV3RQV25oV2Rtb3lZakZTV2pJeGFWUnFNemN3WWpOQkNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663376928,
          "logIndex": 3523400,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071617779",
      "sha": "78e9fa152a052f5af50c112bcb5dda8b52231c20"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

