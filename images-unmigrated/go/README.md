# go

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/go/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/go/actions/workflows/release.yaml)

Container image for building Go applications.

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/go:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1` `1.19` `1.19.1` `1.19.1-r0` `latest` | `sha256:efddab21710e500ee2bbffffbf7a7eae3a3e1babab531fb74c615747f3096e9b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:efddab21710e500ee2bbffffbf7a7eae3a3e1babab531fb74c615747f3096e9b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.18.4-r2` | `sha256:da4e839a8ab485d9ab3df00a2af1cc32fd580a8de85534792d1e16261dfbf9ba`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:da4e839a8ab485d9ab3df00a2af1cc32fd580a8de85534792d1e16261dfbf9ba) |  |
| `1.18.4` | `sha256:bd5c8dcb24bd85848715673e1eb3e43207a60afc9d57ab7350e0b2b1b3ed6786`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd5c8dcb24bd85848715673e1eb3e43207a60afc9d57ab7350e0b2b1b3ed6786) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.18` `1.18.5` `1.18.5-r0` | `sha256:e65e5a561f2035a8ae8682702a0d9565732c61b874745f4a74c5baa73eb60cc4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e65e5a561f2035a8ae8682702a0d9565732c61b874745f4a74c5baa73eb60cc4) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19-r0` | `sha256:aa284c7040aadffbff12a55d8a32eb36305f9cc2e77c3010a5e0870bfaa9894c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:aa284c7040aadffbff12a55d8a32eb36305f9cc2e77c3010a5e0870bfaa9894c) |  |
| `1.19.0` | `sha256:3979b72069076e34271c89babd8d785323a247dd70800695b88aa78e5d08a124`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3979b72069076e34271c89babd8d785323a247dd70800695b88aa78e5d08a124) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To build the Go application in [examples/hello/main.go](examples/hello/main.go)
using the host architecture:

```
docker run --rm -v "${PWD}:/work" -w /work/examples/hello \
    -e GOOS="$(go env GOOS)" -e GOARCH="$(go env GOARCH)" \
    distroless.dev/go build -o /work/hello .
```

The example application will be built to `./hello`:
```
$ ./hello
Hello World!
```


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/go:latest | jq
```

Output:
```
Verification for distroless.dev/go:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/go"
      },
      "image": {
        "docker-manifest-digest": "sha256:efddab21710e500ee2bbffffbf7a7eae3a3e1babab531fb74c615747f3096e9b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "2e1124836cba563fa75515c014bf55d2b59f2a39",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDlLxtpsCtlfcsBqTSf4IHdRPVD9nTjsEVf75sfDXYVHAiEA366vbz8cJBEm/dYNjH+C9yvrDMANC2Bsvw0pzphiZ6A=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2Yjk5NmIxNDQ3YmZkNzk2OGUxZWFjZjgzNTBmODA4MzI0ZGY5NDk3YjZkYzhjYjczYTMwNjNjZjhmNDU2ZTdjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRittaUdldzJRdUtrRWdqcUwyRWphcHlxU1EvZ0hWaEdHY0dTaDYwdHoyN0FpRUFxTHF1TFNaeUFKdjFpQnRRR01uWTdrcUZCSEFKRkYwbUpUYVJQV2krNkZVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnJSRU5EUVhoaFowRjNTVUpCWjBsVlJrVkRaRUp3VjBVMFVUSllURGhHVkZSMGNrSkxjVFF2TURKemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRCTlZFa3hUbFJCTlZkb1kwNU5ha2wzVDFSRk1FMVVUWGRPVkVFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZGYlhaWVVVYzRMMjB2YVhCc1NFNUxhbm94V25SSGVuRllWRVJDTDB0cFVWY3dWeXNLVkVjd0x5dGhhV0ZEZWxKc2JEWkJNSE5IT0dKUGVFMVdUSEV5ZWxKbmFtaFNSa1J0V0ZONGNXWlJSQ3RsWldSUlNFdFBRMEZxVlhkblowbDRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZEZDJSdUNsSXJkSFpXTmxwSFEySkNOaXREUlc5YVMyVmxZalZ6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFoUldVUldVakJTUVZGSUwwSkdUWGRWV1ZwUVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTWpoMlRHMWtjR1JIYURGWmFUa3pZak5LY2xwdGVIWmtNMDEyWTIxV2MxcFhSbnBhVXpVMVdWY3hjMUZJU214YWJrMTJZVWRXYUZwSVRYWmlWMFp3Q21KcVFUVkNaMjl5UW1kRlJVRlpUeTlOUVVWQ1FrTjBiMlJJVW5kamVtOTJURE5TZG1FeVZuVk1iVVpxWkVkc2RtSnVUWFZhTW13d1lVaFdhV1JZVG13S1kyMU9kbUp1VW14aWJsRjFXVEk1ZEUxQ1NVZERhWE5IUVZGUlFtYzNPSGRCVVVsRlFraENNV015WjNkT1oxbExTM2RaUWtKQlIwUjJla0ZDUVhkUmJ3cE5iVlY0VFZSSk1FOUVUVEpaTWtwb1RsUlplbHB0UlROT1ZGVjRUbGROZDAxVVVtbGFhbFV4V2tSS2FVNVViRzFOYlVWNlQxUkJZMEpuYjNKQ1owVkZDa0ZaVHk5TlFVVkZRa0UxUkdOdFZtaGtSMVZuVlcxV2MxcFhSbnBhVkVGaVFtZHZja0puUlVWQldVOHZUVUZGUmtKQk1XdGhXRTR3WTIwNWMxcFlUbm9LVERKa2RrMUNNRWREYVhOSFFWRlJRbWMzT0hkQlVWbEZSRE5LYkZwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtOQ2FWRlpTMHQzV1VKQ1FVaFhaVkZKUlFwQloxSTNRa2hyUVdSM1FqRkJRV2huYTNaQmIxVjJPVzlTWkVoU1lYbGxSVzVGVm01SFMzZFhVR05OTkRCdE0yMTJRMGxIVG0wNWVVRkJRVUpuZW5kU0NsTllORUZCUVZGRVFVVlpkMUpCU1dkSlV5dHBSVGM0VDBobk1tSnpSV3QyTlRSaUwwcHZLMnRKWWxCVGVWZFVXR2g0ZDJkeFpFMVFkbU0wUTBsQ1Ftc0tUME5RV0RCWE9GRndiMDh4WWtsRllUTnhXbTA1WlRsT2IyNW5RVFZXVTBSVVVsaE5WbWRsYjAxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1kQlRVZFZRd3BOUkRab1pWZGFPWEJWV0RGNWJpc3ZOazVVY25OMWVFZGphVUZtWm1GeFduQjBkWEJZWjFkS1NuYzRSMWhQWmtKa1F6bENiazF4TlhFMmNUSkphemhtQ21oblNYaEJTbk5FUVZkMmRraG1SamxuUm1OV1oxRjJPSEJPVVRsNVYyZzBObFp4TjNCQlkyeHlWa3huTXpRM05WTm5ka3hyVlV0eWFIZ3JaR1Z1ZDFFS1ZrdHNkRkpSUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663160135,
          "logIndex": 3496210,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/go/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3052934652",
      "sha": "2e1124836cba563fa75515c014bf55d2b59f2a39"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

