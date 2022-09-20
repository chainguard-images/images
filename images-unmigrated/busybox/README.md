# busybox

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/busybox/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/busybox/actions/workflows/release.yaml)

An image that contains busybox and musl, suitable for running any binaries that only have a dependency on musl.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/busybox:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.35.0-r2-glibc` | `sha256:d796a659d1b786a60ffa621f6e11131369e1a1c95f752342d752e83075027575`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d796a659d1b786a60ffa621f6e11131369e1a1c95f752342d752e83075027575) | `amd64` |
| `1.35.0-r25` `latest` | `sha256:bd1b8070d6763f038f0ad2694356f4281b05935280d637d8a43fa7cc7ca22b21`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd1b8070d6763f038f0ad2694356f4281b05935280d637d8a43fa7cc7ca22b21) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/busybox:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/busybox:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/busybox"
      },
      "image": {
        "docker-manifest-digest": "sha256:bd1b8070d6763f038f0ad2694356f4281b05935280d637d8a43fa7cc7ca22b21"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "203174bc72668bbd8a2db0c43048c5bbe81aafc4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDpq/kI6qW69xZBUsIW1UKTKjEDuQSKszSzTJlhUZHRjwIhAPojuLdowCggnLegrEOxWZUT91AM8YDqcyZgZRHBE9lm",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0MDM3YTIzNGI4NWNhNWMzMTBiZGRhZWQxYjkzYjQwZDM4OGMyNWFlODI4ZjAxYTJmYmEzNTI1MDNjODY1MGIwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQmYyb3cvdVVOdmY4ZmViNlBrZ2V0amVFa0VJYVllak9KekowWVpnZzgvUEFpRUFsOXZsb3V5Q2pOcDdoNndvQ1dRbEJjZmJyVVVrSnhwZkVTQWhPOXd3WnJzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRha05EUVhsRFowRjNTVUpCWjBsVlFsWkdPVWRqU1RkbllpdERaekZSUkZwRk1tZ3hNME12V0d4RmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlJHc3hUbnBWTWxkb1kwNU5ha2wzVDFSSmQwMVVRWGRPZWxVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZoT1c5U1NpODFXVmhpYUVJMGEzSXphVUZEWWpkeE5rbDFOVUkxUm14QmEwZzFNRk1LTDNCdWJEVnplbFZVUm1jNFpFTm5jbFV2UlZWemIwSmxTV2R0Um0xdUswaFlkbWRsYzJ0U1FqTlNRWGhIUzFsRVIyRlBRMEZxT0hkblowazNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyWlRWaUNuVTFhbU5yVTJGbk16aFFWazVoYTB0blpsSk5kVVU0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaYmxaNlpWZEtkbVZET0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUldkWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVWalNGWjZZVVJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtObmVVMUVUWGhPZWxKcFdYcGplVTVxV1RSWmJVcHJUMGRGZVZwSFNYZFplbEY2VFVSUk5GbDZWbWxaYlZVMFRWZEdhRnB0VFRCTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFEUVVkRGFYTkhRVkZSUW1jM09IZEJVVlZGUlcxU2NHTXpVbmtLWWpKNGJHTXpUWFpaYmxaNlpWZEtkbVZFUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZIUWtFNWVWcFhXbnBNTW1oc1dWZFNla3d5TVdoaFZ6UjNaMWxyUndwRGFYTkhRVkZSUWpGdWEwTkNRVWxGWlhkU05VRklZMEZrVVVGSldVcE1kMHRHVEM5aFJWaFNNRmR6Ym1oS2VFWmFlR2x6Um1velJFOU9TblExY25kcENrSnFXblpqWjBGQlFWbE9ZVlpVU25oQlFVRkZRWGRDUjAxRlVVTkpRMDEzUjFCQmRtbHlXbmxrUVRoVFpDODVaVUZMUldGeFJ6TkZhVGhhWlcxVWJrOEtjelphUVd0cGFXWkJhVUZ0VEdkNk5VVjZXWFJ1U3psRU9VeHRVek5UYkZORlFXbHpTVVZ3ZDFsbmRFMUJTVTFWV0RKeFVXdFVRVXRDWjJkeGFHdHFUd3BRVVZGRVFYZE9iMEZFUW14QmFrSkxaV1pyYVc5WVZEbHFTMVp2WW1KeGJuWm1SRlZ0VDBnd2VHRXdiVkJXU1RKdk9XeFhiRnBwYVVkaGFHUm5hRTlXQ2toRmJGQkVURlpLYjB0RGRFdFVTVU5OVVVSUU5FMXRRMkpzTkdjdlMxbDZiRkJsTVZGMWRUWXdUVE56V1RWVVZ5OHdlVnBXWkVsTmNuaDBaRmROYjFVS2VqVnZaMVYyYW1rclR6SmhXWGRETm1oc1ZUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663667902,
          "logIndex": 3597448,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3089175376",
      "sha": "203174bc72668bbd8a2db0c43048c5bbe81aafc4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

