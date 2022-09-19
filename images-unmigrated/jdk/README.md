# jdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/jdk/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/jdk/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:6dff6bd49d1687f003e1d35bfc00f321fd5bb36251d2d69955ca53f304abee94`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6dff6bd49d1687f003e1d35bfc00f321fd5bb36251d2d69955ca53f304abee94) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/jdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/jdk:latest --
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
        "docker-manifest-digest": "sha256:6dff6bd49d1687f003e1d35bfc00f321fd5bb36251d2d69955ca53f304abee94"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "38ff3422ea0dc4f38f0369bcdecc3e6929d0d1ca",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCEXzsbmdSNW1SwWa0VpT3wtD9saqQygnUwGp8mOlCMPgIhAKvApezoWmgFLCNnNdbvWEVQR1rNwllOu0CAbktUySfT",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkNTJmN2ZlN2ZiNTI3OTQ3NDQ4MzMxZjBlODRjZjUwM2RjY2RmMzFjNWVhZWQ1Yjc2NzRiMTEyOWRlOTM4N2M5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQUZxTWVFVlJnZ2Y0NkNub3ZoSDZDajVVOGRTOTNycWZMYjVOODNaanhickFpQU9Wb2t3bUlibUExdDBOSU1sejdMaXNrYzBIanlPOUcrZzVjRnpsQjFsbUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnJha05EUVhocFowRjNTVUpCWjBsVlNsSjZUazVOUTBGcFRHOVpOelJEUTI5VE9WUm9XVXRIYkdwWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDNUMVJCZUZkb1kwNU5ha2wzVDFSRk5VMXFTWGhQVkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1VDJSQlZqbGliRkJZTjFSWk0zY3JSMkpQUkVwNEswVnVORWR4Wm5wS1UwTm5UV2dLVkdsVWNIWnpPRTB4YmxwV01ETXpWMFo0ZVhwYU1sVmlSRnBuYjBSRGVHc3pNVWhEUkZnemNrTkZUV0ZCWVZSVVRVdFBRMEZxWTNkblowbDZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyWXpkTUNrdDZjbWRqZVc1QmRWUmtReThySzNsa1lYVk9WMjVyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoYlZKeVRIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWTkNaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRlNkMlJZVG05TlJGbEhRMmx6UjBGUlVVSm5OemgzUVZGTlJRcExSRTAwV20xWmVrNUVTWGxhVjBWM1drZE5NRnBxVFRSYWFrRjZUbXBzYVZreVVteFpNazE2V2xSWk5VMXFiR3ROUjFGNFdUSkZkMGhCV1V0TGQxbENDa0pCUjBSMmVrRkNRa0ZSVDFFelNteFpXRkpzU1VaS2JHSkhWbWhqTWxWM1NFRlpTMHQzV1VKQ1FVZEVkbnBCUWtKUlVVOWFSMng2WkVoS2RtSkhWbm9LWTNrNWNWcEhjM2RJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUdOdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVbEhTa0puYjNKQ1owVkZRV1JhTlFwQloxRkRRa2h6UldWUlFqTkJTRlZCUTBkRFV6aERhRk12TW1oR01HUkdja28wVTJOU1YyTlpja0paT1hkNmFsTmlaV0U0U1dkWk1tSXpTVUZCUVVkRUNsWTRkM0V5UVVGQlFrRk5RVkpxUWtWQmFVRXJiVFpKV2xSNlJVeG1SMEZDUmt4NU9USXlhRXR4WTBoUU1HOVJVM1UyV0ZoUlZrNVhiM2x0U2xsQlNXY0tSbWxrY1ZoeWIwbHhiRzlDVG05c1NreEpWbXBRYjBoQmFIaGliME5LZEUxSGRIZzNZalpvUm1KYWIzZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkd3BhVVVsNFFVdGxRVmRQVEhWWWR6WkpkeTlXVFRBelUwMXpMMFZzWWpacVZVc3hNMnBtTVRGSVkzSjNVVXN2Wm5scmFtWldja2xGZVU5VldYVTVjRWc1Q2xkTlJrWkRaMGwzUm1sSFZXeE1WSFV2YVhCUlFUVlFNM00zUTJONU1VVk9RV2d4ZUhaMlRUSldhSE54ZEU1T2FEWTRXVEZTV20xNFZsWkJZek5CY0dzS1dXWnJVVE5qV25BS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663625381,
          "logIndex": 3564191,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/jdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085951354",
      "sha": "38ff3422ea0dc4f38f0369bcdecc3e6929d0d1ca"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

