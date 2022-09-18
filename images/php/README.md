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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.10` `8.1.10-bullseye` `8.1.10-cli` `8.1.10-cli-bullseye` `8.1.10-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:6f755ba67d7f16953d36691b3a143eace462f11855e3e727c415714e5eb83478`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6f755ba67d7f16953d36691b3a143eace462f11855e3e727c415714e5eb83478) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:6f755ba67d7f16953d36691b3a143eace462f11855e3e727c415714e5eb83478"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "18bf0244fbae093e9d9161a9dd4804ccda4aaea5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFZWais34yOpQlfeY4Fk5F2g/9+hZUqrzH93QS/NKz17AiEAhqZnSF3MAoFDt/x/pELe2xRVFsGKF3/8Kzp+1vV+eyw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5MThlNjQ1NTJhNDU4YWM4ZDVmMTc2MWE4NDI5YWNmNDYxNzY5YjM3OWM1NGFmMThkMjkwNjZlN2M5ODdmNjM5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURHendPOCtOUnVkT0lnM244d1h0RHNjbU9WUzFwTDRtcGY1a3hZTDZKbGRnSWhBT0dvL0hqRy9hTTh1anZ0eTB5Q2lTcmkrSDhrQlcyNzdvNFpPM1Q3VlgxcSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNha05EUVhoNVowRjNTVUpCWjBsVlVVbzBhV1pzWlhWTFZsVkZOVEJCT1VGSFRrTkVTVEZoVFd0VmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFbDRUVlJGZUZkb1kwNU5ha2wzVDFSRk5FMUVTWGxOVkVWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUyVTFCNFFubHVWaTlHVVZwRVJXcExkMVZsT0RCWmQxVjNOMHBOYTA1RGNsRndWU3NLYnpsU1QxSkxTVkphVEVOQkswdFFibXQyUTA1NlRXNVVjVFlyV1VkcGRXOTZMMnc1VjJaT1ZtWnlhRWxUVlZGTlNEWlBRMEZxYzNkblowa3pUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNT0VsUkNsQkZNVk0xYjBSTVFsbEhaR3BWVG1oU1pIQk1VM1ZSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqUjJoM1RIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWZENaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRm9lbGt5YUd4YVNGWnpXbFJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtObmVFOUhTbTFOUkVrd1RrZGFhVmxYVlhkUFZFNXNUMWRSTlUxVVdYaFpWR3hyV2tSUk5FMUVVbXBaTWxKb1RrZEdhRnBYUlRGTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVlZGUkcxU2NHTXpVbmtLWWpKNGJHTXpUWFpqUjJoM1RVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcFVWbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqZENTR3RCWkhkQ01VRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuTURWa1MwMTNRVUZCVVVSQlJWbDNVa0ZKWjBKaGVHNUVZVUV2ZVhKd01qVk9MMjlaVjAxa1JYUmlha0Z1UkRoMFMwbzRkV1ZDUTFJeU5IWUtSRU0wUTBsR2JsWm5NVkZxWVU1aUwyTk1ia0ozT0habFQxVnNVblpZV0RFemFIVkJNbWt3ZEZGamVrdFdWekJEVFVGdlIwTkRjVWRUVFRRNVFrRk5SQXBCTW1kQlRVZFZRMDFSUTJ0VFEzRXhTa3BMZWt4Nk9VeEhRWGMzZUdKc1JqbGFhV28xU2s5M1dFZERWSGR1Y0NzMVNVUlBhbWRuUjJ4WmJraFZjQzh5Q2xsUFJXNDBhbVUwYjNWalEwMUJNa3hHWml0dFowNVlSMEoyYUZOTFEweFhVRzUxZEZkNkt6RmhkSFo0VWt0V1psZEZjMnMxWkdRelkyNWFkR014VDNvS0wzWjZaVFJXTjFaclFsUkZOV2M5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663467109,
          "logIndex": 3527940,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/php/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075526969",
      "sha": "18bf0244fbae093e9d9161a9dd4804ccda4aaea5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

