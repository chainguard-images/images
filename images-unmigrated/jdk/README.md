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
| `latest` | `sha256:c2d62d36d53de84d47e10c4fb411020e59a9a549a4a58c1dc3dd1d4888b9e3f7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c2d62d36d53de84d47e10c4fb411020e59a9a549a4a58c1dc3dd1d4888b9e3f7) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:c2d62d36d53de84d47e10c4fb411020e59a9a549a4a58c1dc3dd1d4888b9e3f7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9a13bd04044abf76b2e0749d05aef07e76931054",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCsh1fI/2wvpirZM1UvS/+GAAk7gdeZwLKnj+B5ouIlWgIhANiRgc8gYdhRYUkwcnyIIuJaJgvVjdl5L0dw1df0EOMT",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0YmI2NzQyNmY0MmFlZjAzMWQzODhmYmI5MmYyZTAyNWJkZTllYjBlZTg0ZTQ4MWU1ZTJkOGJkN2ZiYjE4ZjdjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRVRySjZHaE9EZEo1Qldka0JLZ1hyblp0TUdNNDhRSmZZMlpqOU5RcHRWMUFpRUFwM0dyNjI5VUxaWFY5RlYrWDVMY2cxcHJEUFhuVG9NR0RVU0FWaTFhV3BnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNha05EUVhoNVowRjNTVUpCWjBsVlMyRlRlVEZSY21GNGRWSjNUVFJzYWpVMVRXVlhTakp6WnpWemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlJFbDVUa1JSZWxkb1kwNU5ha2wzVDFSRk5VMUVTWHBPUkZGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYzWVZOS1YxRnRkMjlRTWswMk0zQjNZWEUzVVVaS1EwaGFRVEIyVWtjelkxaFhWV29LWjFOSGNFMVNkSHB3YWs1bVMwSnVkRkZzWkVWblNDdHJWVkF5V1VocE0zWm5ibTFuYVM4eGNqYzBlVXRsY1dSdlRqWlBRMEZxYzNkblowa3pUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZVZGpjNENsRjFTM0V4VVdRemQyOTNWbVV4Vm14bVkwUXJkalpuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoYlZKeVRIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWZENaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRm9lbGt5YUd4YVNGWnpXbFJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtObk5WbFVSWHBaYlZGM1RrUkJNRTVIUm1sYWFtTXlXV3BLYkUxRVl6QlBWMUYzVGxkR2JGcHFRVE5hVkdNeVQxUk5lRTFFVlRCTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVlZGUkcxU2NHTXpVbmtLWWpKNGJHTXpUWFpoYlZKeVRVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcFVWbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqZENTR3RCWkhkQ01VRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuTVU5UU5tOWpRVUZCVVVSQlJWbDNVa0ZKWjAxcVNtSnhTUzlwZFdNelJqZDJjRUZpZWxsMGJpOXBZbUZET0hka1lVNHlORzFCTjJkcFZHMEtWR3hOUTBsSE5rWlBTMXB0Wnk5RWFXUjBVRGhtUjNST1FsSktibU4zWVZOYU5pODBRamxTV1RoVGFVaG9kWEZTVFVGdlIwTkRjVWRUVFRRNVFrRk5SQXBCTW1kQlRVZFZRMDFIV2tGUE5sRXlTVXM0TlU5c2JqVjJaMGtyTm1zM2VqZDFVbTV2ZVhkbk9FTXdlSGxMVWpSallVUmlNMDg1U3pWTllrOXRORWN5Q2xwNFpEQkNTMDB2U1VGSmVFRkxValpSUm5scVlXSnBTVkI1ZGpGT2EwSnVNRzFDTlRaSlFXTTJZbFV4YjBZd2IyeHZObVJOYUZveFQyMDVZMDlFVTA0S1RuZEVLMHRYVlhGTFkyWjFhMEU5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663554315,
          "logIndex": 3531444,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/jdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3079540564",
      "sha": "9a13bd04044abf76b2e0749d05aef07e76931054"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

