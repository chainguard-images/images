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
| `latest` | `sha256:c2aa83e228411e3fa5bfb2f89a43c54aedb58cfbec09c9b74b5cded63adff909`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c2aa83e228411e3fa5bfb2f89a43c54aedb58cfbec09c9b74b5cded63adff909) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:c2aa83e228411e3fa5bfb2f89a43c54aedb58cfbec09c9b74b5cded63adff909"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2fb03f9eb32b8e94bd67eb0b4bb11bd2eaed0059",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCoqpdAJ3F11aRodj6FW6TCjJr0Oq4paCSnv5C+F9aGcQIhAIuT7qabLnpnJwq9YDv0wryKtr28pP52G077t1sZrhyF",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5NDczNWRkYWM5ODViNDJmZTI5YzczOTFlN2NkZGNjZmJiZWUwMGQ2OGI0MzVmOWUxMzFkYWM0ZDNmZTdhZGRhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNNaVo5OG8vMWltV25VMkhheVRBUVF2dmQyb2dNRTB3VFl6NVhUZzdZVnV3SWhBTnM1UjNCQVRxUEI4RS9Lai90dmIvRFFhemhSQzM4NlZOZi9wYTIyZTBWZyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNla05EUVhneVowRjNTVUpCWjBsVlVYVXdNbVZETWpkS04yWTFZMkZ5VkZZMFFsUmFNR3BMVEUwNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFbDZUVVJKTkZkb1kwNU5ha2wzVDFSRk5FMUVTVEJOUkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSUTJzclRGTjRhRk5uUmtORU1uVTRjbmgzTXpsdkwxcFVSbVpXY0cwdlJTdGpkSFlLYW5SWE1ESkxWelZhUXpkTlJtVnFWa3RoVjBOUFZrazFLMEpaY21aWVNHRmFiMUo1V2t4emRtSmlhbTF2TUhKc1kwdFBRMEZxZDNkblowazBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtWWsxSENrZ3pTMFpIVDNkc2JXbHdNV3Q1V2t3cmVqVkRSMkk0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoYlZKeVRIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWZENaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRm9lbGt5YUd4YVNGWnpXbFJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtObmVWcHRTWGROTWxrMVdsZEplazF0U1RSYVZHc3dXVzFSTWs0eVZtbE5SMGt3V1cxSmVFMVhTbXROYlZab1dsZFJkMDFFVlRWTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVlZGUkcxU2NHTXpVbmtLWWpKNGJHTXpUWFpoYlZKeVRVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcFoxbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqaENTRzlCWlVGQ01rRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuTURWMWVqRm5RVUZCVVVSQlJXTjNVbEZKWjFacWNrVkxlbEpCWkZoNmRXeFRPRFpTTW5GcFlUSkxiekJ0UzA0elZuWnlUV2g0TkVoMVRrMEtRM1p2UTBsUlEyTkRlVEoyYTNOb2VGSXlTbEJMVFdOM09USjJOWFpTY1UxTlZVeG5kVE5WVUc5WVdtSm9Oa2QxTlZSQlMwSm5aM0ZvYTJwUFVGRlJSQXBCZDA1dlFVUkNiRUZxUlVFeFQxUTFWRFpOVW5Ca1JsRTJURFJEZERNeU9EbFJVWEprYVhGMkszSnlaVFJMUkZOcFpUWmxkelV3YkRONE9YVjVRVGN5Q2xGUFRrbEpTazU2TXpoVWRVRnFRVGRMT1RWRVYwdDRVVm95WjJSRlVHaHNNVzFCVGt4MVl6TnpRV1V6WTI5MGNFd3dRMFJOV1ZkUWNXUXlZelk0VUhNS2RHWTFjMUpZY2sxUFJFZFZRV2huUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663468250,
          "logIndex": 3527952,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/jdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075568320",
      "sha": "2fb03f9eb32b8e94bd67eb0b4bb11bd2eaed0059"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

