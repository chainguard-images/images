# php

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/php/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/php/actions/workflows/release.yaml)

This is a minimal PHP image based on Alpine, using PHP apks available on the Alpine Community repositories (not built from source as of now).<br/><br/>While this image is being developed, we will stick to the latest stable PHP version which at this moment is `8.1`. Supported versions in the long term are TBD.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/php:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.10` `8.1.10-bullseye` `8.1.10-cli` `8.1.10-cli-bullseye` `8.1.10-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:3a7e8364d22b265dca5b89137ddd16185ab5fd503498eb3431fe51058a5a1a3e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3a7e8364d22b265dca5b89137ddd16185ab5fd503498eb3431fe51058a5a1a3e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To try out the image, run:

```shell
docker run --rm cgr.dev/chainguard/php --version
```

```
PHP 8.1.10 (cli) (built: Sep  1 2022 16:13:09) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.1.10, Copyright (c) Zend Technologies
```

## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/php:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/php:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/php"
      },
      "image": {
        "docker-manifest-digest": "sha256:3a7e8364d22b265dca5b89137ddd16185ab5fd503498eb3431fe51058a5a1a3e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6264d8350b07e11bc23cde06e01dcfc08c32878f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDgW7uApWuuHG05gP5M4LY1ZpMja3ngGmaqhbe3llqkCAiARaSghpbQtnOH0erAZPT8/mM/m2QcfBCTHiTa9vPJioQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkMzg2ZGE1ZWZjNDc2N2IwMGM2M2UzMzNhYWU1YmUxNWViNjc1ODFlN2MyZTE2ZjBiYzEzODE1NzgzODM0NzBkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR3Q5aXF1MGRwcHA5Z2VOWnF2OVZjWEM5amc3eStPdGtIVUFIakpPbW5JNEFpRUE5MnlJTjZhMmJpbmxPNGJJY1FSUnRGSnV3cHV1amorSWxWejNyQ2s0QkdNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNha05EUVhoNVowRjNTVUpCWjBsVlpUVkVOVVIzVjBselptSkxlSEkyTWpGWU1TOUVhR2x4VGt0VmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFVXhUVVJKTkZkb1kwNU5ha2wzVDFSRk0wMUVTWGROUkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3YVZsWFEwZFBhMVJYUkdkcFZteGpUSGxYY0RBclZVMUNjVFE1Y2pScGMyeHJVbkVLT0hGbVlqSkNhVkF5UzBrd1QxbEpjRzQxYmxSaU1HTk9iVEV6VVVod1IyVjJNRWxxWkhWNWRHcHVNMnhSZVVoMU9FdFBRMEZxYzNkblowa3pUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTTUdReENqZFdlWEEzYlZOaldXWjFSVWREUTFCMGQydDZaVFpuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqUjJoM1RIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWZENaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRm9lbGt5YUd4YVNGWnpXbFJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtObk1rMXFXVEJhUkdkNlRsUkNhVTFFWkd4TlZFWnBXWHBKZWxreVVteE5SRnBzVFVSR2Exa3lXbXBOUkdocVRYcEpORTU2YUcxTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVlZGUkcxU2NHTXpVbmtLWWpKNGJHTXpUWFpqUjJoM1RVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcFVWbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqZENTR3RCWkhkQ01VRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuTUd0cU1WbHZRVUZCVVVSQlJWbDNVa0ZKWjBWUlFucHhiSGxuV2l0clFrRXJWRzByUkhsb0x6SllXbWxWY0dwNksyUmtNR0UzU0RkMGNsUUtZbUp6UTBsSGFVSlpTekZCU1d3d1RuTnlNa1paZFdKSlduSnpkbTlsV0N0UlRIQkRUblpqUVV3eFRHZDFOMFJvVFVGdlIwTkRjVWRUVFRRNVFrRk5SQXBCTW1kQlRVZFZRMDFSUkdKc2JEVkZkV05vTUZwQlFVeEdUWFpuUXl0UGJIbzFSMDA1V20xbFQwSmpOalpWY0U1c1MwOUlWWFJXT1RGNFNqWldhRmxzQ2tadWRrb3ZiaTh3YW01blEwMUhURWh4Y2pCUVpYRnRjMFZNWWpObWFqRTJVbU5GWlN0b01YTmFRa2xLWkZsNlowcEtSVUZtTlRGdFpHaGhWVkJXUW1RS00yZDBVVU5NV0ZFM1dEUTRjMUU5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663379447,
          "logIndex": 3523631,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/php/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071720004",
      "sha": "6264d8350b07e11bc23cde06e01dcfc08c32878f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

