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
| `latest` | `sha256:c53d53ebc333710269bc11bd7fbe59b62e941bfa046d52531fac189f80831892`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c53d53ebc333710269bc11bd7fbe59b62e941bfa046d52531fac189f80831892) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:c53d53ebc333710269bc11bd7fbe59b62e941bfa046d52531fac189f80831892"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "7ed30d6a436af8abe845f067cf903527e3301ed7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIH5mCWHRwq6IWFQggAPNeMdXU341Sevr46tgTa++VD0AAiAs6A1EnilfHqdCszvOwLBFKNGFaKLiOXcRvBST8X3SNg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmYWUyNjRkYjhkOTRjOGYxZjQ5MGNiYTgxYjQzZjUzOWQ1NTlmY2JkNjcxNjFmNDk3NTJjNzlhMzAyMzZjYjg4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNOK2t2bG9JK3gvNVdZL0NhWXNDU0pUS0tJVnFNa2xUQ2M5cDFzNEZocFBBSWhBSjl2dWlydlI1ckx0ZlZuYTFGNlRHUWU4MWFMbmJFZHdnRDk2VE1XSEc0MSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhsdFowRjNTVUpCWjBsVlVGTmhRVVoyVlVvMksxRTFTbXcyY1daWVZIb3hTM1JEYnpWbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTmFra3dUbXBOTUZkb1kwNU5ha2wzVDFSRk1VMXFTVEZPYWswd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXUjJKVWFIcDNhRUY0UW5SVlNUQnRWV0pvUlZaNVpVMVhiVlpsTWxKSU1TdDVaM0VLV0dSYUwwOTRjbFk1TVdwb2FsTTRURXB4ZVVweFdHUjZWVWRhT0dseVluaHljSFZrZEhRMVRIcFRiUzlHWm10UWF6WlBRMEZyWjNkblowcEZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSVlhCVUNtcEZMMUVyZWpJelUzUTNWa2RpUWpOcFdVVkRXSHBCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoUjFaellrYzRkR1F5T1hsaVIxRjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlPTWxaclRYcENhMDV0UlRCTmVscG9XbXBvYUZsdFZUUk9SRlp0VFVSWk0xa3lXVFZOUkUweFRXcGtiRTE2VFhkTlYxWnJDazU2UVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbXNLWVZoT01HTnRPWE5hV0U1NlRESm9iR0pIZUhaTVdHUjJZMjE0YTAxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sbldVdExkMWxDUWtGSVYyVlJTVVZCWjFJNFFraHZRV1ZCUWpKQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekJPVmtoUGIwRkJRVkZFUVVWamQxSlJTV2RUUkM5U2NUWnBMekZKUXl0TldtWm9kRVpuV0ZSc1IxUUtiMFJDU0hsU1IzcHJSVFZ4V2t4NlozUmxjME5KVVVRNFFURkVWRUkxYkRGdFVXRnRUbEV2WWtaVFlXMUhUSEZaY3pFNGFUazRTa05OY0hSM2FqWmFZZ3BSVkVGTFFtZG5jV2hyYWs5UVVWRkVRWGRPYmtGRVFtdEJha0YzTnk5T2REUlNUalpSYlZGMmRYUTFabUk1ZEdreFVuWXlPVzVwWld3emFGZGFkMGxCQ2pkcGRFVXJNRE12UVhoSmNXcE9aa1F2U1VocE5uQlpkVEV3T0VOTlJVaE5SbXRGVWk5UFJWVkpNazVFZEZKeVNWaGFVRGxGTDFGb1dsZzBUMGhVUlRJS1NrRTFlbmh2TmpoTVNpOXVVRlZTYlRoNVRFdEZRbFZMYUVWRVpUZEJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663282004,
          "logIndex": 3511455,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3064187989",
      "sha": "7ed30d6a436af8abe845f067cf903527e3301ed7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

