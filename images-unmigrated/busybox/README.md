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
| `1.35.0-r25` `latest` | `sha256:332ea65523c8426d9b903c83e3251b49f462b3e2631d5fe25c11469fb4f1b051`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:332ea65523c8426d9b903c83e3251b49f462b3e2631d5fe25c11469fb4f1b051) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a3454ee1fc8e4c5970cb367204ca01f863a550ea9d0e446e197acf13e3682043`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a3454ee1fc8e4c5970cb367204ca01f863a550ea9d0e446e197acf13e3682043) | `amd64` |



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
        "docker-manifest-digest": "sha256:332ea65523c8426d9b903c83e3251b49f462b3e2631d5fe25c11469fb4f1b051"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "b6aa91c2fe209c41f4766ae4c90f9d09fed8ef92",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDEVHOnT6gt+zY8lr+kd2MdGTZgLpirCgz1+s9tgdtflAiBdvfbdWYHFGnQhl62OW1b5Qh5U85uawlNuqQqNKySOJQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1MDEzZDkzNmIxY2ZlOWZiYmYxOTI5ZTFlOTI4ZTZmZmZhMWY4MWExYzMwNDRiNTg5YjdmZjc4NzY0ZjY5ZDUxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURCMnlPNEdMNkQ4YitjekNub0t2MHNKaURWUjRSSWpSUTZDNVlBL1FGajZBSWdMMmR0cHc2d3pmZW9WREQwY21xOFl0Y2R2QXVUdWFnN2NweVNjSGQ1THA0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVSRU5EUVhsSFowRjNTVUpCWjBsVlQwSjNka1JIVkVKaFJWazBSRWhXU2tNMWNYZHBRVzV5TW5KcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZFbDZUMFJWTTFkb1kwNU5ha2wzVDFSSmQwMVVTVEJQUkZVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZWUWxoVFpFUjNibTlGVTNweVRFOUNObUpEVkV0aE4xUmhZV1JZY0VGMGRYTjNVU3NLTDBKTWNVaFVUbkJUYnpOWWVtbHBka3hZYkM5TWRHTTJSbm9yYTFSdmRIVXZWM051Y2xORmJDOWFTVVV2ZWxaUVVtRlBRMEZyUVhkblowazRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZVWpOckNucFZlV2R2TUVobVNHWnpSVkkxU3psQlQwcHRhRlJyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaYmxaNlpWZEtkbVZET0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUldkWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVWalNGWjZZVVJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtOb2FVNXRSbWhQVkVacVRXMWFiRTFxUVRWWmVsRjRXbXBSTTA1cVdtaGFWRkpxVDFSQ2JVOVhVWGRQVjFwc1drUm9iRnBxYTNsTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFEUVVkRGFYTkhRVkZSUW1jM09IZEJVVlZGUlcxU2NHTXpVbmtLWWpKNGJHTXpUWFpaYmxaNlpWZEtkbVZFUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZIUWtFNWVWcFhXbnBNTW1oc1dWZFNla3d5TVdoaFZ6UjNaMWx2UndwRGFYTkhRVkZSUWpGdWEwTkNRVWxGWmtGU05rRklaMEZrWjBGSldVcE1kMHRHVEM5aFJWaFNNRmR6Ym1oS2VFWmFlR2x6Um1velJFOU9TblExY25kcENrSnFXblpqWjBGQlFWbE9ZVFpLTlU1QlFVRkZRWGRDU0UxRlZVTkpSREZKVDBwNVMxWkllVFpIVVVaRmVIRjFWVXRSY0dkcFZYQXdlVVJMTjNWbFZ6Z0tiRmh6WTB0aFZWVkJhVVZCZWxSdGQxcEVlV1Z1Y0RGVFpqTlpaekpSU2taWGRWUnZMekpvYkd4UE5YUk9RVlEzWkN0emJsUmpOSGREWjFsSlMyOWFTUXA2YWpCRlFYZE5SR0ZSUVhkYVowbDRRVTFhYlVsclMyNUdRMWhIWldkemFtcDNPVm93VDFKR2FYWmhLM0pxYzBaSFl6QlVSVGQzVUZSeGNsWklUWEpKQ2pRemRtUnVObTlXYlZwUWJGVmpTbU42WjBsNFFVd3dlV2MzUmpOR00xaHBNWEUyYkhKTGJrUjJXV2hyZW1kd2RuUnNMeTlXY1RGcmVta3ZPRXAyV25ZS1EyZDViSFJLUTNONmRGTkRNMGxZYkVSTVJscEdRVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663677560,
          "logIndex": 3605241,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3090174220",
      "sha": "b6aa91c2fe209c41f4766ae4c90f9d09fed8ef92"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

