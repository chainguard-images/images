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
| `latest` | `sha256:5e2753fa23294b5453e8b7278185a3671bbc6385f053a3b50b315a884022b591`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e2753fa23294b5453e8b7278185a3671bbc6385f053a3b50b315a884022b591) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:5e2753fa23294b5453e8b7278185a3671bbc6385f053a3b50b315a884022b591"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5b9ddd77ff45f81c3723c4ef6cef3fe0fa227efd",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDC8Y0iIH11QlG+nDVRu3o3pnyXgE3t8RX2ZScYFbGD1AiEA55vFCdhrj+7DoL/LaGxgRJ/LsZ/qZfr6l+PCReGcEug=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2MGEzZmZjZGQyZjEyZjBhNTgwNGQ2OTBkZDFhMTBmYThmN2NkNmY5ZDFkMTNmMWYwMDQwYzcyYzdiZDlhZjhlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQy84VGxiUmVSalNLTGhvRnVwUW5UclY4V1JOdnBaMmxxRXl5SUFENTNqWUFpRUEzOFpUUGpnWDBVanFQeFdYaGNTRlNxZ2NWbWdPRkJHMk1wOE9WVm8zV2pNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsNVowRjNTVUpCWjBsVlRYRm9aRkJ1VW1ONlVVZ3piRTUzWjNwcFptOVhjbFZ1ZGtodmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFVjRUa1JOZVZkb1kwNU5ha2wzVDFSRk5FMUVSWGxPUkUxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZqUkhocVJUbFRjV2hUYTBoYVRGcHJXR1k1VWs5eU5qVXdVeTkxYkRKclUwZFhPREVLWlRSbU5tWnZWMWRxVUZCMFpVWjROVkIxYTB0U1FrTlFTbk41YldGSVJHaHpNR1JVZEV4Mk5rOVNMMEZCTDJkS1V6WlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZTUhsaUNuRlpMemdyWm14SE4xSTFjalZpT0cxQmJVdzNhbGc0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaVjNoM1lWYzFiRXhYU21oak1sVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUldhVTlYVW10YVJHTXpXbTFaTUU1WFdUUk5WMDE2VG5wSmVsbDZVbXhhYWxwcVdsZFplbHB0VlhkYWJVVjVDazFxWkd4YWJWRjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxcEhiSHBrU0VwMllrZFdlbU41T1doaVNFSndZbTFWZEZsdFJucGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XV3RIUTJselIwRlJVVUl4Ym10RFFrRkpSV1YzVWpWQlNHTkJaRkZCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlRrOUxWWG80UVVGQlJVRjNRa2ROUlZGRFNVZElaaTlXVld0VVJIZEtkVzlEVUhkV1dUVUtUVGhLT1N0RUwxcHNiR1pKVjBsd1dscGphVVpMVmpJelFXbENjakEzYUVSMVEwaENOMlpYU3pWSE4ySm9iV3hyVG1oWU5uQXpVRkZHVTIxSGMyUlVOUXBRS3k5UGFtcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtNUJSRUpyUVdwQ1RqTnpiRXh3UVdsQ2VtOWlkMGwxZEU0eldFZGxabEZwTWpnMlNqbEpTVmhxQ2t4cllVZzJhMjVoYWt3ME9FVkVhRFo1UzBSSGEwdHlhRTlIYmtFeFkydERUVVpPYzA5bFdYbHdhbWsyUTI5dWJXeEdMMDlMUjFWTGNHZEJTMWhJUTBvS2NqRXhVV3hGVUVaWGFVcDNkRVp1S3pCR05rWTRlamhhY2pWRlMwWldaVzF6VVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663463711,
          "logIndex": 3527750,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075417397",
      "sha": "5b9ddd77ff45f81c3723c4ef6cef3fe0fa227efd"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

