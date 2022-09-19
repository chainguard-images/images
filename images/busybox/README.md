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
| `1.35.0-r25` `latest` | `sha256:86a2f54399ed3b2cef067708aaa665f019b5ac29150e21a96662a25b49979354`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:86a2f54399ed3b2cef067708aaa665f019b5ac29150e21a96662a25b49979354) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:86a2f54399ed3b2cef067708aaa665f019b5ac29150e21a96662a25b49979354"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "a0b059c7bd381bc9cbd7f9f1f8f9464e95f8b4aa",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC+cxO7xbFq8lP5qwHtbq5L9tUrLJJj/ZHn3Eu9vQ8dGwIgMhWiuAmyrGFEkpccvzeWIFHKDX4lS2yjdhBH+WmFVC4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyYjJiOWZiMzFkYjE3N2EzMWEzODhmNDM4MTRiYmE4ODEwM2RhYTMzYmQxM2FmMDIyY2I0ZTk3ZTY0Y2RhMTcyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQmJwM0FEVFpSby9XMlVaWVlWdmVuV3dhVEpwSXUxWnNobmViWXozQ0YvOUFpQkkyY1JMK1owdDVTTlAzVUF0K1lJU21nbDJESmVqc1c0VFFQUURYdjdJamc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRha05EUVhsSFowRjNTVUpCWjBsVlFWZFJkVWhOZW5kNldtWjBlVU5oYjNseE16QXdZM2x4ZVhCemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDNUMVJOZWxkb1kwNU5ha2wzVDFSRk5VMXFTWGhQVkUxNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZtZWtGV2QwMHZhVTFNUlUxU2QzSkZXRGhhUkdWMlNERk1ObmxtVW5GNE0zVTRVbFVLYTFKbFoxRXZTM0JoVDNGdmVtZExkVTFEVTFOMU5ISkZiR3h4VERsc2JuVkJVbmhTUVRKQ1dHRTFRV3RtVFRWaFN6WlBRMEZyUVhkblowazRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRUW1JMENucENkemRWTUhCeWJWaG9TMUpoY25kWFJFWldZazQwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaYmxaNlpWZEtkbVZET0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUldkWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVWalNGWjZZVVJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtOb2FFMUhTWGRPVkd4cVRqSkthMDE2WjNoWmJVMDFXVEpLYTA0eVdUVmFha1p0VDBkWk5VNUVXVEJhVkdzeFdtcG9hVTVIUm1oTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFEUVVkRGFYTkhRVkZSUW1jM09IZEJVVlZGUlcxU2NHTXpVbmtLWWpKNGJHTXpUWFpaYmxaNlpWZEtkbVZFUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZIUWtFNWVWcFhXbnBNTW1oc1dWZFNla3d5TVdoaFZ6UjNaMWx2UndwRGFYTkhRVkZSUWpGdWEwTkNRVWxGWmtGU05rRklaMEZrWjBGSldVcE1kMHRHVEM5aFJWaFNNRmR6Ym1oS2VFWmFlR2x6Um1velJFOU9TblExY25kcENrSnFXblpqWjBGQlFWbE9XSHBMWjJWQlFVRkZRWGRDU0UxRlZVTkpVVU5CWkd0eWFDdHVaV1EwYkZSNlZFWjJVelJTTWpCdFEwVm1ORVZaUlhWYWRtVUtXRVV5T0doNVZUSTBRVWxuU25SRFdVSnJTR3RUVEc5VGRUUkxTVmx6YWpSNVdHdHlTRTlPU0VWeGJrTmhjMVYwVjFrd05UbEdRWGREWjFsSlMyOWFTUXA2YWpCRlFYZE5SRnAzUVhkYVFVbDNUalZ3UVVwMFV5dERVMDlTWjBKM09FSmFUMWxPUjJkeVpXTnJSVmhuUTBGSmIzQlFiak5aTlhjck1FaG1VWFZ1Q2tFeGMzRk1XRWRKSzFkTFFuTkRiRlJCYWtGdk1VUTNNRTVEZDBsek5IZGxSR3hoU1hGWU9VaDNkaTlzUmtkTGFYSkpkVFZFTUU1dGNFdG9SREpaZUVzS1YyUnVhelpWT0hONVozcFJjRzFDS3pVek9EMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663625398,
          "logIndex": 3564219,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085954122",
      "sha": "a0b059c7bd381bc9cbd7f9f1f8f9464e95f8b4aa"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

