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
| `latest` | `sha256:00b504f11792fd6db851c7b2068049560bd28d0c6315f80f37cd2f6517981813`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:00b504f11792fd6db851c7b2068049560bd28d0c6315f80f37cd2f6517981813) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:00b504f11792fd6db851c7b2068049560bd28d0c6315f80f37cd2f6517981813"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "4ad07567850265e5be0bba393b80b84006f2f2f9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDYl8IjsyaJdP1gKt4q46xv1rEzyKWGr0+f7B6fw6vL9gIhAKijNt/J/fPZjTgpMfcbPxFsMmLee+Fo+ehuTpclJsUh",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwYWU1ZWY3NTQ5MGM5NzgxZmQ1YzkwZDE4NmUzODMxN2RhOGMyZDA0ZDA1NGFjMTNiMDUwYjRiMDBjZWRjM2VkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRzlhTkZablg1YzI5WkZ2UW1vWkNibjZrcVp4SG9uUnVQSklVNEpIUnhTakFpQmIyL08yOEdNc1pSR05kMmJSZXdjbXZhSnMySlhlcDNKKy9ZR0krTGtzV3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlF6STVaMVpqVTNvNE5YWkNlRzFxZDFGeFJFSlZNbk5VU0hSUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTmFrRjZUa1JKTUZkb1kwNU5ha2wzVDFSRk1rMXFRVEJPUkVrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU1Wm5SaE1VTnFaRlJTYVcxM1RqTlNLM0JLYVdkM05uUkNNekZNYkhJemNTdGxXbWtLVEZVclNUVnlXVGxhU0RSYVZVSXpTbFZLUnpoQ2RYQkJNalptVGpNelpVYzRNa0U0YW1wR1UyNU1WM05rU0dWblVFdFBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZCUWtabkNrMUZhelZEU21GVU0wSkNVSEZ6YURsdlQxcHphR2wzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoUjFaellrYzRkR1F5T1hsaVIxRjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlPUjBaclRVUmpNVTVxWXpST1ZFRjVUbXBXYkU1WFNteE5SMHBwV1ZSTk5VMHlTVFJOUjBrMFRrUkJkMDV0V1hsYWFrcHRDazlVUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbXNLWVZoT01HTnRPWE5hV0U1NlRESm9iR0pIZUhaTVdHUjJZMjE0YTAxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sM1dVdExkMWxDUWtGSVYyVlJTVVZCWjFJNVFraHpRV1ZSUWpOQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekJuUTJRMmMwRkJRVkZFUVVWbmQxSm5TV2hCVEdSQ1RtOW9SWEp1TkhWWlRXdDBaVkJRV1hGS2EzTUtRVnBPTkdKcFkxTTRkSE5vTUd0a2IxVkdMMjFCYVVWQmVUa3lkRnBRWTJ4bVkzSXZjMGQ1U0U5UlFYRllheTgyYzIxMFFrcHVSV051WXpWYWF6UXZlQXB1ZWtsM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWw0UVV4b2REaExSRE5QUVdNMU16ZEVlbGREYWtseVRHWnZVMGxaZVRsTmExYzNNMDlPQ21STmJGUnpiMjVWTW1sdlQwUlVXRmRYYmtKeEwyZEhWMVU1WTNvNFVVbDNSbnBqV2tJdlVGTkVlV3RaVDFsQ1FrOW9XRkp2VmxOS1dpdEZTWEZGYjNjS1EwUkJOWEp4UnpCNllsSjNXVkl5YmxCWk9UUnFSMmRCWWs1cWNUSnRlazRLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663360474,
          "logIndex": 3519425,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3070562172",
      "sha": "4ad07567850265e5be0bba393b80b84006f2f2f9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

