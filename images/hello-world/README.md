# hello-world

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/hello-world/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/hello-world/actions/workflows/release.yaml)

Hello, world!

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/hello-world:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:63b19e8db2b0ef8b9603a8e14cfed07a6a538637011edf7293496b36aacf8879`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:63b19e8db2b0ef8b9603a8e14cfed07a6a538637011edf7293496b36aacf8879) | `amd64` `arm64` `armv7` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/hello-world:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/hello-world:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/hello-world"
      },
      "image": {
        "docker-manifest-digest": "sha256:63b19e8db2b0ef8b9603a8e14cfed07a6a538637011edf7293496b36aacf8879"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9903bf0dc9603dc045af5a1336292925dc928ff1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEo4n/9HUTh2rPNQ+0GT4mvZnGxyBNrufBr51z4u/sJ1AiBo0PCTcFX+kYCj7pB5b1aW7RQsbEhlo6eokMdY7WY8sQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwZTYyMTI4OWJkMWRjZDhkNWYyOGY5OTBmOGI3NjhlMzM2NWZmZGJjMzgzMmIwZDk4MmJiMTI3ZGYzMjYyYTA4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNDVVBMS2daRVdEd01lY1U3RjczZ1hIdXNoVTVSQVBZaUY2ZGpTVWMyZGJ3SWhBUHU2bHdPZTg0d05RakJ0bkdvemlYcFp4MEdxTkVKYnpxRkFrVFJyV0F1MyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlVUTkxVVzFqSzFReFptUXlXRUpIVTNBdmJXRlFaRzlJYWtnMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFVjRUWHBWTVZkb1kwNU5ha2wzVDFSRk0wMUVSWGxOZWxVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU1TTFOemFFcGpUVnBoZDJ0TWVWWk9RV3d4Wm1aSWJGSmFNV2R0TlZGMWMyVkpSR3dLUVRnME5tZGhWV1JHV1ZSRlZVaENXSFZRYlV4TWJVWkZhWGhzUTFSdFVtSm9hR2xKTUhOcFZUVnpVakJoZUV0d01YRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZqUW5oR0NqRmlTbW80T1hFMmFVWmlWRFpMTlRkWU5DOUlWVTV2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoUjFaellrYzRkR1F5T1hsaVIxRjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUnJOVTFFVG1sYWFrSnJXWHByTWsxRVRtdFpla0V3VGxkR2JVNVhSWGhOZWsweVRXcHJlVTlVU1RGYVIwMDFDazFxYUcxYWFrVjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxcEhiSHBrU0VwMllrZFdlbU41T1c5YVYzaHpZbmt4TTJJelNuTmFSRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XV3RIUTJselIwRlJVVUl4Ym10RFFrRkpSV1YzVWpWQlNHTkJaRkZCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlRrcEJiRFIyUVVGQlJVRjNRa2ROUlZGRFNVRnRiVEI1UzAxVVZtOWhhRzVuVWtWaFRqVUthalU0TVVad1FqSjROMEU1TjJoTmJHVjJSRGs0V2pSRFFXbEJlbkF4UW1kQmQwSnZZV0l3YW5oR0szWmhURXBpZGtneVNWZG5iV1VyVmpkUVJFbGlRUXB2YTFOamNVUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwQk1HazJUMEl5TkRNMlNXdEZOVkJOUlRaR1oyRmtlVEZOVWtNNWVWcGhWV1JKQ2tsaU1FUXpNekJyV1hwblRuTjJaelpOUm5aR1duY3ljekJwVFRRd1VWRkRUVkZEWkhGM1drOTRiVFJhUnpOTk0ycEtOelIwUm10RFNWcGxiMkpqSzJvS2FFcE5XRkZ4YW1GYVRVVjRLM0JvZUVkdU1XSldNVGRFTlRWTmQwWjFlazlrT1ZrOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663377243,
          "logIndex": 3523466,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071628648",
      "sha": "9903bf0dc9603dc045af5a1336292925dc928ff1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

