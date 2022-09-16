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
| `latest` | `sha256:8f3d3be314d82cdb8e687b1d0bd15afed5e4158e1195dad67ced390d6a5344ec`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8f3d3be314d82cdb8e687b1d0bd15afed5e4158e1195dad67ced390d6a5344ec) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:8f3d3be314d82cdb8e687b1d0bd15afed5e4158e1195dad67ced390d6a5344ec"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "17bd2700dff58a5e9681735c9b6a5643846c843f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCID5aAH7CoPC8x3aJ7Dvmyk1WWSfZ2xyGh0B9oL6gvoqsAiEAgQtGwM4qEzuy9LwuNjsJY1yJHPQy5jT6ZHoGfefM2LY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1M2QzYjJiNGQ2NGQ2NzhhNzA4OTkwNDIwMTAzMjJlNDYzNDU2N2E1ZjNiMDFhMmQzMmE3MTI0YzRiZDUyMGE3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRUR2S0J4Q0h1L0ZHMVZOaW16QUxmb3d1emlYMCt1ZFhoNk5tNmJLL245RUFpQjArSEV1MmwwaFY5blR5MExJWWNHbDdRQ0hia3JGeTlkNGVyOUlrUDN0eGc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhsdFowRjNTVUpCWjBsVldtRlFTekpWY3prcmRWRjRlbFkyUlZWS2RscFFWV2h5VkZwamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlZHc3hUWHBOZVZkb1kwNU5ha2wzVDFSRk1rMXFRWGROZWsxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUyTWxSVGNESlNjR2xGYUhWTGIwUXpWelIzV0RWTkwxTnVRVXhHU1RWcVExUXpUeThLZDFGelowWndMMFpoZW1KS1RESktlRkV5Tm5ZMk5XWldaWGhwVlRGYVNtd3dXVTh3TlRsa05UWk1lR1JQVEZSalZrdFBRMEZyWjNkblowcEZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKWnpaWUNrNUlOV3hMUmxveE4yZzRjalZxY25ZemJEWkJTVzVyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoUjFaellrYzRkR1F5T1hsaVIxRjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlOVkdScFdrUkpNMDFFUW10YWJWa3hUMGRGTVZwVWF6SlBSRVV6VFhwV2FrOVhTVEpaVkZVeVRrUk5ORTVFV21wUFJGRjZDbHBxUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbXNLWVZoT01HTnRPWE5hV0U1NlRESm9iR0pIZUhaTVdHUjJZMjE0YTAxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sbldVdExkMWxDUWtGSVYyVlJTVVZCWjFJNFFraHZRV1ZCUWpKQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekJtWkVSVldVRkJRVkZFUVVWamQxSlJTV2hCUzJRd2VrODNSV2RaU2twNWMxb3pSV2Q2YjBONmFHRUtRM2g2WlRCamNHdzFjbVZVV2pOMFVYcG9XRzlCYVVKM2JXMXBOWEJFTkdoblpVWkNURFo0TVhnemFHMXhRVk5tTm1nclNFRXhiWGRYZFhSV2RYZFpkQXB6VkVGTFFtZG5jV2hyYWs5UVVWRkVRWGRPYjBGRVFteEJha1ZCZW5KU2N6Vk9MMGhFYTAxTVZIVnJOQ3RVV205SVdrTjFUM0IxUTA1SEwyNXNaa295Q21GNlZqWnJZa3Q0ZFVob1NsSmhWVnBqUjFSRWJXSjVhMFJxT1V4QmFrRmpVMmwxU0RSTGRWQXJiVUZVWVV4NWVqbHVRM1pvVmpobVZHRndUbWR2U2pnS09GZHpUMFpTUTNKak1rZFlaR1ZLZHpkdlduVnRObm8yZERneFFrcDFiejBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663358022,
          "logIndex": 3519283,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3070362133",
      "sha": "17bd2700dff58a5e9681735c9b6a5643846c843f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).



