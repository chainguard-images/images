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
| `latest` | `sha256:6a4b4bd3d2f857587755964cd6d382ba5f3608b7b37341f3b73d89f5791ff910`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6a4b4bd3d2f857587755964cd6d382ba5f3608b7b37341f3b73d89f5791ff910) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:6a4b4bd3d2f857587755964cd6d382ba5f3608b7b37341f3b73d89f5791ff910"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "ea2099e34380834653fc25daf147dc3997909413",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAQa931tJiEFwjT83nKrraJ/v4UIUy51NLxl1CY+B7AgAiEApBWQqEC0ZJyRtqRX7X/3Fx/Hsxg0jJ3PMNilKGGo4Rg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2NWVmODgwYmY5N2E3NzViZGQ4YzE0MDZmMGE0MzRlOTA1NjhlZGYyYjlmMmNiNjA0NDVjYzhkYzE4NDlkYjYzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURGSTFVb0tjTG40a2NRbWlVVW1aVDdJVTBDeVlQREI0b1oxdVc0Y3JPOUt3SWhBSWZtTWluVXZWT0FHejRNRmZMMUNnZ1BqN0ZSV3RVbTZYcFBlaGNYREVOViIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhscFowRjNTVUpCWjBsVldVbGlUbXBqZEdSQ00xZElkRzR6ZUV0SU1HSTJabFpOVDI1VmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTmFrRjNUMVJKTkZkb1kwNU5ha2wzVDFSRk1rMXFRWGhQVkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3UTFka2QxUjBTVzVLVm1wcU9WbDZUa2xSVVZRdmVFRnlORzlUT1M5cVRHNHlXalFLWVVaaVZHUmxkRzFSU0c1M1VWaERZamRKUW05UVQyMVdTRWg0VlRST2VVVmxWVE56V1RWNmRXTktZVWREU1c1cWJXRlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZVEd0UkNqWmlNMEpDYWxKNlYzaG1VR3NyY205UVpGbHpWMnhOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoUjFaellrYzRkR1F5T1hsaVIxRjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlhVjBWNVRVUnJOVnBVVFRCTmVtZDNUMFJOTUU1cVZYcGFiVTE1VGxkU2FGcHFSVEJPTWxKcVRYcHJOVTU2YTNkUFZGRjRDazE2UVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbXNLWVZoT01HTnRPWE5hV0U1NlRESm9iR0pIZUhaTVdHUjJZMjE0YTAxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekJtY25CRlRVRkJRVkZFUVVWWmQxSkJTV2RqTW1aSWFVdFVUMmMxWlZobGIxa3dMMWd6TVdsd1luWUtXVXRyUVU5blpWcHNVWGM1T1RGQk9HdFRSVU5KU0ZGeFNFVnRWMk5HVTNGSmJXVjFNbUZEYmtwV2VXNXhkR05GTDBWTlNtWlhUMmd5V1d0aVJEVlFhUXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpuUVUxSFZVTk5Sa1F4S3l0WVFWZzRlR3B0UTJoSFFqTkhia05CZUVzemRHOVVZVWd3UzNNNWNGTnlkSEpQQ2pWNFpXbG9aR3QxZUZCSGQxZFhlQzltY0ZjNVJGTnhkbHBSU1hoQlNUbFBRVWRyTUc5UWFWYzRaMjVMWTAxbmVUVk5iVkZXYzA4M2FVUjRXa0p1VDBjS1RXVnRVbGxhUkVjNFVHdHhPVlJYZUVKVmFYaGhaMGR6WlVwbWRtOVJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663358977,
          "logIndex": 3519363,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3070444427",
      "sha": "ea2099e34380834653fc25daf147dc3997909413"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).



