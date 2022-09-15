# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/alpine-base/actions/workflows/release.yaml)

Alpine base image built with distroless tools.

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:4b945b83ff44c2725946f47008468efba0a8f0254129ad15ba1fd72c09b399c7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4b945b83ff44c2725946f47008468efba0a8f0254129ad15ba1fd72c09b399c7) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

```
docker run distroless.dev/alpine-base echo "hello distroless"
```

See the [examples/](./examples/) directory for how
to use this as a base image.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/alpine-base:latest | jq
```

Output:
```
Verification for distroless.dev/alpine-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/alpine-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:4b945b83ff44c2725946f47008468efba0a8f0254129ad15ba1fd72c09b399c7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ee9871328266e1e17c856087cedb4444aac7135c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDtKf7nkYEf22J/gxiz6ZlNULWyAXhQ4WPu1zq7kdirWwIhAI6TdH+SZi1e+Mvo/k27EngA0ZdJQtlnfzivZwvEq6f7",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZmJjMmU1MzQ1ZjkzMWNhMmRhNmMzZTIxODBmYTZiNWY3MGU3OWFmMjQ2OGYxMWZmMWUzMWQ4MmIyZGI1YmM5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNDS0prbU04bDRQVTNKVXNVTFg2WlVMRnN6QXEwcEdCRDA3L250WnBrRHFRSWhBS1c1VjA4QkRscnYzcDRFUUZBU3l4Z0p2aGdjOERDUmRXd0RsOHJ1bXg3TiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhrMlowRjNTVUpCWjBsVlVGSkJaVTkzTWpWckwzRlNNblk1YmxZM1oxSmhUblpMWmpkTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTlJFVjRUa1JWTkZkb1kwNU5ha2wzVDFSRk1VMUVSWGxPUkZVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZwTUVSTVFUZE9lV2xSZVVGcVdrVTBhSEZHWlhCSWRqRkJNRU5xUzBGUFZqQkZNRUlLYzIxUE4xTllORVprWkV0NlkySlNhMFZXVFU0eGMwSkdTMFJLVDNWME4yRjVUV3RGY2pkcE0ycENTM1o1UlVOa2VtRlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU0Y1ZwU0NtNU9VRU54ZDJkVWIzZEJZems1VEZwU1pEbHZObmhKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaVjNoM1lWYzFiRXhYU21oak1sVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwZFdiRTlVWnpOTlZFMTVUMFJKTWs1dFZYaGFWRVV6V1hwbk1VNXFRVFJPTWs1c1drZEpNRTVFVVRCWlYwWnFDazU2UlhwT1YwMTNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxcEhiSHBrU0VwMllrZFdlbU41T1doaVNFSndZbTFWZEZsdFJucGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XWE5IUTJselIwRlJVVUl4Ym10RFFrRkpSV1pSVWpkQlNHdEJaSGRCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlRTdDBjRE1yUVVGQlJVRjNRa2xOUlZsRFNWRkRMMmRsZFcxNVEzYzJXV2RsYW5GQ1ZuRUtSbWhqSzBSUlRtZFNjV2RKVm10cFpWVk5XWFZITTJodWFFRkphRUZMZEZvd1JqaGFObWhyV0U1MVlsWnZRbVJDTUVOR2NURklVM0pFYUd4NFpVWnBaUXAwU1VGWmIzTm9PVTFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbU5CVFVkUlEwMUVlbGxQUW5kWVMyWXZXVVpxUldaRk1XTnVUbWhSVkdvM2QxZHVibGdyQ2xaakwzaFRPVXhRYzBKc1FXMVNhbm8yZGxsVVpVTldWbWN2TkdGUE4xSm5NbWRKZDJWVGNXVnhOak5VWlZsV1prUm1TekJGTVRCWGFIVm1WVTFTZWtZS01HcHNhQ3RWTUUxbWQwZHFTV1U0ZVdGWVpHSm9hbEEwYjJjdlVuWkpOREpNVjJoWENpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663204540,
          "logIndex": 3503571,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3057138137",
      "sha": "ee9871328266e1e17c856087cedb4444aac7135c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

