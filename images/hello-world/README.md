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
| `latest` | `sha256:bbc31255938d82e50ac60a569844e480c2153a227d42a735b05101dcbfaf38ac`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bbc31255938d82e50ac60a569844e480c2153a227d42a735b05101dcbfaf38ac) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:bbc31255938d82e50ac60a569844e480c2153a227d42a735b05101dcbfaf38ac"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2b09dc13d95251a7134049a70f6fcba7b8778c34",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDShNWdyKHDE5NB0XfwZ8XGJ6vhWwG29T6lCI0xMbqRiAiEAwjoyJvmMg55721CcPpHbHmhFAO55G/NehBuD1dfpH/s=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMjBlZjcwMDg2Y2M3N2JkMzk5YzRmYWE1NjQ5OTU5ODNlMDA4MDFkYTMyNWU0N2I5NWY0ODU1ZmViZjk4NThhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNHL1diMFBYclYxb2tZTW4wNlE5UzhaK3MwWWJzaWFpbEtwOG1ta2MzRHp3SWdQeSt5Q0xILzlxaC9vT2dHYmZORkxRRk5YNSswZWorNlZVVWdHUkVwVDZRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhSRU5EUVhreVowRjNTVUpCWjBsVlpEVTJUM04zUzBSSmNIRlJZa3BFVW5kNVYyWnBTbkJaVmpFMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlJFVjVUVVJOTUZkb1kwNU5ha2wzVDFSRk1rMUVSWHBOUkUwd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV5TVdONFlVeFhWVlJMVlVweFJpOXpiV2huWkU4eVUzbzBWM0p6YVZod1ZTdGtjRmdLZFM5UFkycGFhekppZWxoc1JrWm9VbVZETTJ4TFVIbFFiRVV5VjA1dGN5c3JMMnhwWTNCVmVVVjBaelpNVnpCa1VHRlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZIUVdkQkNsaFNia2RIU0RoMmRtWk5WVTlJUmxrME5XbE9NR1ZWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoUjFaellrYzRkR1F5T1hsaVIxRjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUkthVTFFYkd0WmVrVjZXa1JyTVUxcVZYaFpWR040VFhwUmQwNUViR2hPZWtKdFRtMWFhbGx0UlROWmFtY3pDazU2YUdwTmVsRjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxcEhiSHBrU0VwMllrZFdlbU41T1c5YVYzaHpZbmt4TTJJelNuTmFSRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlRrUTBhR3B6UVVGQlJVRjNRa2hOUlZWRFNWRkVVRUVyTXk5c05qZ3pUbGw1TkhwSFJHd0taalJZUlVOUVkyaERlbE5wUmpaTk5FeDRPV3QwZWxOdE1rRkpaMXBaYnpsbVdrNXhhVVZpTm1WWFpWWm5jMVExZEdWTFNGRmpialZWT0hkbVNuY3JhUXBXT1c1RlRISm5kME5uV1VsTGIxcEplbW93UlVGM1RVUmhVVUYzV21kSmVFRlBlWHBKUVdJeE1qTXJVSHBHTVhsNVRYVjBRM0l3UnpCNFpuVlhTbFY1Q2pWUlJVVnpNWFpOUkZKWldtRmlNbkpzWW1WS05pdHhkM3BxUWpOb1MwZGhOVkZKZUVGT2N6QTRjREJSYzBKS1NqY3ZUelIwZEVSTlNUUmFPRWh4THlzS1F5OTRiV3RRY0ZkVk1FTXJSRXRoZW5FcloybDNaRUpPZUhwUlJqbG9WMVZNZUVKamVGRTlQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1663291249,
          "logIndex": 3512219,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3064787190",
      "sha": "2b09dc13d95251a7134049a70f6fcba7b8778c34"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

