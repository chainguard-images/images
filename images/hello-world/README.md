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
| `latest` | `sha256:05d8bbeba5df3c1974745417f89d7351d5cd91421d4ff38d799cca4fa69ef65e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:05d8bbeba5df3c1974745417f89d7351d5cd91421d4ff38d799cca4fa69ef65e) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:05d8bbeba5df3c1974745417f89d7351d5cd91421d4ff38d799cca4fa69ef65e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "82d610100f07543752325604865aa7a247b22b52",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAzpW4vV6dTB1ygHoB717Uv7tcqVWJGH5cNAqVn41ApaAiA9QfbqYznmIwZwdi0lmyK+6gwtvzIiB7LkFHW8jxWZjQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlNDNlOTY3YzVhMmE2MGZiMWRhODA3ZGY2OGRlOTFkNDk0ODg2ZTE0YTY4NWJkMDU3YWQ5MzQ1MWQ4MDJkNDFiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQU5ocmhqTEpLZjlTdk85ZGgwUEV4Q3lZMGF6NW9kTzkvRFYyYnhvZ1V3VEFpRUF6L1ZGa0VzeER3QllVV29sbncycVFNeDdLdlZNaWdUdHBwOVM4ZDJjK3R3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhscFowRjNTVUpCWjBsVldEaG1Wbk5aU0hKYU1IQjBiR3BNTWxwSk5rVldSbmQxZUVwamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlZHdDVUMFJKZDFkb1kwNU5ha2wzVDFSRk5VMVVhM3BQUkVsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ2Wlc1NlNYRTRMelJOTTAxNVkwbG5iM2xPVmpJemJITk9kbmxITDB0dlVXOWlhMmdLVkcxTk5GWkZaMlo1WmsxTFVIaGtObWRDV2pCRlZuZ3ZWV2xNYTFKR1J6Um5iRGRuTWpsdE5rTnJORmgxUVU5Q1kyRlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZaUjNCNENtVjFabTRyV1hCTU0xbFFOR0pMUW1Sd1ZIVXlhalJqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoUjFaellrYzRkR1F5T1hsaVIxRjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlQUkVwclRtcEZkMDFVUVhkYWFrRXpUbFJSZWs1NlZYbE5la2t4VG1wQk1FOUVXVEZaVjBVeldWUkpNRTR5U1hsTmJVa3hDazFxUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbXNLWVZoT01HTnRPWE5hV0U1NlRESm9iR0pIZUhaTVdHUjJZMjE0YTAxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekZqTlVSYU1FRkJRVkZFUVVWWmQxSkJTV2RKZWxCdlNrUlRPVEZWTjJoeVZHOVlUMDFtWVVJNU5YVUtXV1JKYXpaVVRqQjRRVU5aZDJjMWRuVnRRVU5KUWpodFVVeEJjRXhsVVdzNFFqSkpSWEZWV2pZd1RtUTBibTFSVm5SUFFVcE5NV1ZwWWpGVFZtbERTZ3BOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpyUVUxSFdVTk5VVVJxU1V4M1kyZzJiVTFMWmtReU0xbHBWaloyTm04dmJHaDFhRU14ZEVjMlNWbGFObTgwQ2xoa1ptbHRTbmN3YVhWRkx5OTRaa2xzUW05RlREVnNWMEpqT0VOTlVVTjFMMFEzYVUxV05GSldlVXhtTjI1SFZtVlFUVXh4UVRKMVRHTk1hM0JHUTJvS1JUVnBaRWhqTVZkRGRtaEJaRUZuT1d4dE9IZGxUM1UxU0RKd0swazNPRDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663615709,
          "logIndex": 3556079,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085068151",
      "sha": "82d610100f07543752325604865aa7a247b22b52"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

