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
| `latest` | `sha256:8250db0e995d26aab64ece1a32f1de429ad98f428ce0e20152df8fc4de4f9cb5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8250db0e995d26aab64ece1a32f1de429ad98f428ce0e20152df8fc4de4f9cb5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:8250db0e995d26aab64ece1a32f1de429ad98f428ce0e20152df8fc4de4f9cb5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "585e2c14dc11b33fb64db6666b97deb377c7bf75",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDxWzYPrRvPebj+AxlvuPq13UnDmx2R0fiqNokBr2nOcAiEA87CX5LDlSztUXCmSrhlHthH8hWfzyEXCWT/rL1RxMVk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ZjA4YzQ1YWJmNTdmMTZjZTFmYjYxYTIxYjM2YzIzMGY1ZmU0MDQxMGEyZjU5NTBmMGE2NTc3MTdhYmEyZjY4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURLdjltUVpETzM1NEZZckE0Z1FBZkR2Q2tjOHpsTnNRZWdsRHF0bFZlWFZ3SWdicGdUUE1sYURNdUFZTG9Zdk5yQXJxcGN3TXR5cy9FbDZDa3YyaUsxdllvPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhreVowRjNTVUpCWjBsVlJEWlhLM1JwT1U1Q1UxRjNXSEpHYkRGVlJ6TkxSVmgxUkROdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlJFVjRUVVJSTUZkb1kwNU5ha2wzVDFSRk5VMUVSWGxOUkZFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZPYW1FM05HdG5OVVV5Y0dOMlR5dHlRbXRWV2twcGNuTnFVRlZsZDBKM2VuVkRSa2tLZVdOREt6Wm1Va1JoZERCeVkzUlljSGxZYW5aT2JFUnlNSGxRV25kWGEwVmFWakpPVEdjMmIxbDZTbmxOZHl0WU1rdFBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ4T0hsS0NtSmFRV1U1Tm1aTFdUQTFjMnhCUTA1TGRrNWxTbmc0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaVjNoM1lWYzFiRXhYU21oak1sVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUlZORTVYVlhsWmVrVXdXa2ROZUUxWFNYcE5NbHBwVG1wU2ExbHFXVEpPYWxwcFQxUmthMXBYU1hwT2VtUnFDazR5U20xT2VsVjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxcEhiSHBrU0VwMllrZFdlbU41T1doaVNFSndZbTFWZEZsdFJucGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlRsUlVRM2h5UVVGQlJVRjNRa2hOUlZWRFNVWnBha05SVERGM2FETldkRVoyTkVsUFQzY0tlbXhaWWtvM1kzZEphMjE2ZEV0S2RXUkxOazFvTm5kUVFXbEZRU3REVUVsT2RtWjJiRVpLU0RCR1lqTnVXWEJFYzBneWMzVlRSVTUxUW00ck5YbDZhZ3B3TUdoWGFuVnJkME5uV1VsTGIxcEplbW93UlVGM1RVUmFkMEYzV2tGSmQxSnNla1pEUkVGek1UVXhZWEo2V2xSS01VNXBRMkUxZUZJeVkyNUtNWFIwQ2pCTFFTODFXRlZhUTNCWFpsUlZlbkpGVWpsaVlrcFNkSE0wYm14c01VODVRV3BDU1ZGWGF6aFJXamxGYUZZelJGVjNkSGxCYTI5T1p6aFVUM0pOTjFNS2VqUk5RWEZ0Y3pCU1pHb3lPRzFSYUdSblVWaFRkMXBEYTFONUx6UjNkRWdyVFhNOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663549866,
          "logIndex": 3531220,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3079317862",
      "sha": "585e2c14dc11b33fb64db6666b97deb377c7bf75"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

