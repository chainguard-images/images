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
| `latest` | `sha256:7b25395282d0648c7854528b738e1f34f731aa80db3f37e95abc3597bfe21e2f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7b25395282d0648c7854528b738e1f34f731aa80db3f37e95abc3597bfe21e2f) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:7b25395282d0648c7854528b738e1f34f731aa80db3f37e95abc3597bfe21e2f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "5845671e5fbd9a178d4650b2e5b6fb06b16befc0",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIB2oxaqjKJaxHw5XwhGFa1Jb1Y5uelOaOIK6oL5h9d4OAiEA3zY9kNmEQU8FStRtwKLy0NvuMo253+THzQrk7E3pfO4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkNDg5NjJkOGMxNGQyMzBiZTk0MGFmZjU5NzExNjExNWEzYWI4OWJhOGU5YTgyOGM5OGUzM2NmNTY2ZTAzYTIzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUN0RDFkZDQyVDNqcys3Z0dLMXphRWlRZ0dxVzJuQmcrck1Oend2NDQzU2NBSWhBTTVNYnpsRDZvaXJ4dzV1bDBrOWFWS0g5V0ppMGZ1SjZXZFdpMlBTTEcwcyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlNqY3pWMUZzTnpSeU0yWjFXbmh6VUROVlVuUk9LMmd6ZW1GSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlZHdDRUMFJGZDFkb1kwNU5ha2wzVDFSRk1rMVVhM2xQUkVWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSY21GWWJsTm9kVXgyVm1KaFQxaFJjU3RUTUZSTmMzQjZXWEV5VWpOblJtNXRSMWtLT0dWbVpXaHpPVmRMYWxoT1VITmxNRXM1ZDIxeVlVaFhaMU5sS3pkU1ZERldRVFpaY3poaU5WWnFhVGxsU1RsalIzRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ2UjFkTkNqUjRZbFUzT1cxWGNFZFpaa1owVWpaeFdsbFdRMjlWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoUjFaellrYzRkR1F5T1hsaVIxRjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlPVkdjd1RsUlpNMDFYVlRGYWJVcHJUMWRGZUU1NmFHdE9SRmt4VFVkSmVWcFVWbWxPYlZwcFRVUmFhVTFVV21sYVYxcHFDazFFUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbXNLWVZoT01HTnRPWE5hV0U1NlRESm9iR0pIZUhaTVdHUjJZMjE0YTAxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sM1dVdExkMWxDUWtGSVYyVlJTVVZCWjFJNVFraHpRV1ZSUWpOQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekJsT0hKV1VVRkJRVkZFUVVWbmQxSm5TV2hCU1UweWJ6Sk5MMk5YZGpScFVUWnNXbXRIVEdodWJERUthblY1UW1kRmFEQTNObXRxU25Ka1lYSXZjbWxCYVVWQkt6WnRTVUl4Wm5WNFQyWXJZVlIxYjB3MFpHMW1NM0F2TlROcWRIQmFZbUZyTVVwSFowaFNaQXBFUjFsM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWw0UVV0NVdXOVVRMU5OWVRkQ1prc3lNMjR5VEhRMGNtMXNURVpwY25vemNWcHRNVEJ2Q2poM1pXaExRMXBtYUcxSlRIaGlUeXRWUW1sMFJXa3JVazl2UjAwelowbDNSVWM0T0VoNWNHOU5iMU53WXpWbVdEazNSSGxhZWxKV1pHVmpaVmxQTlVvS2EzTXZkM0I2V1RGaEsxUkpialpVY0V4b2QzQkxXakJaVG1wWVUyZEVSV2dLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663355908,
          "logIndex": 3518385,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3070177346",
      "sha": "5845671e5fbd9a178d4650b2e5b6fb06b16befc0"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).



