# jdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/jdk/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/jdk/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `ghcr.io`:

```
docker pull ghcr.io/distroless/jdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:6dd8f1ff48430fa8eb8ef8b5385fc2993a1b692e5d1cfc8aba63068044482668`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6dd8f1ff48430fa8eb8ef8b5385fc2993a1b692e5d1cfc8aba63068044482668) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify ghcr.io/distroless/jdk:latest | jq
```

Output:
```
Verification for ghcr.io/distroless/jdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/jdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:6dd8f1ff48430fa8eb8ef8b5385fc2993a1b692e5d1cfc8aba63068044482668"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c111e404400bcf506c167bb1cab5736a5e8bc417",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQClBS5Yy/PxJ2wnfndDme/1cceJBXdIbqnOrAPR8EtaeAIhAPhFelkUkeYMdcQ7/uMQ3gPw8F666UGAjCXm5NiZWu0d",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNTE5YjQ0NmYzZmI0OTczZDI3YjFkY2FlMWExNGUyNjYzODhlNjRiYTY1MmY1MjhhNTA1N2ExZDAyMWZiMDZlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNzbmdBL3NuUmJ3UllQZHlKcHN1Sml0OWs3bVU0OGFOUnhadURyOXlWMCt3SWdiWXFndTVVNjBsS2ZjOUFpRy9Da3JJOUJJemFtWTd1dFdJY0RicWFSUzFJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNha05EUVhneVowRjNTVUpCWjBsVllXcFhVSGhrTVZsa1ZHbG1aVFpsVjJoT1RtOW9SV2xPUW1WQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlJFbDVUbFJSTTFkb1kwNU5ha2wzVDFSRk1rMUVTWHBPVkZFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0TDBOdVIzcHpaWE5uWWtRdlYxcE5aRGh1V0hWcGRUbFZhMVZIUmpGeE1USmxUVzhLUjNCNlZUaDNPRVV4Vlhoa1ozVmxVa281U2xaaWVuZHlla1pUVkdwQ1NsaHdRbFZCYkhKdGJrTkNibGd4VGtFck1qWlBRMEZxZDNkblowazBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5WkZWUkNtRndlVEpRTVZCaVZUUllWVlpyZDFOdVZGbzVhVFk0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoYlZKeVRIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWZENaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRm9lbGt5YUd4YVNGWnpXbFJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtOb2FrMVVSWGhhVkZGM1RrUlJkMDFIU21wYWFsVjNUbTFOZUU1cVpHbFpha1pxV1ZkSk1VNTZUVEpaVkZac1QwZEthazVFUlROTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVlZGUkcxU2NHTXpVbmtLWWpKNGJHTXpUWFpoYlZKeVRVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcFoxbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqaENTRzlCWlVGQ01rRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuTUZGa2VsWk5RVUZCVVVSQlJXTjNVbEZKYUVGUVlUTmFiR1pyWjB4RlNEWllhMkY1TlRsYVRGSm1MM0p0VW14R1MxcE1lVlZvYkZWc2JVY0tZMko2WTBGcFFsRjZlR2syYW5jek9DOWxWbkJxYVVkMWVEaDJORkpwZERkT05USk1XV0k1TlVGUE5VcFlNSFJFVTBSQlMwSm5aM0ZvYTJwUFVGRlJSQXBCZDA1dVFVUkNhMEZxUWtObWVsVkpkbmRxYlhOTGJGZE9OM1ZqYTNkeFZIRk5Nek5pV0RsVGVWQXZVVU5JWTJaVGFrUnVNbXAwTUdJM1JYWlVUMnRwQ210c2RHVTBXa1Z3UzBOalEwMUljbE5ITUdsaWRXNUJNMWgwTWxaUEszbHNNRlpqVmtSTVZqZDFaVzVFV2paRFRUUlhibTFtWlVsYVpXSkZRMXB6YW1FS04wSlpSamhwZFdJdk9XWkhkRkU5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663295166,
          "logIndex": 3512441,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/jdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3065001865",
      "sha": "c111e404400bcf506c167bb1cab5736a5e8bc417"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

