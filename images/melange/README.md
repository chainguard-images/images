# melange

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/melange/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/melange/actions/workflows/release.yaml)

Container image for running [melange](https://github.com/chainguard-dev/melange) workflows to build APK packages.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/melange:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` `v0.1.0` | `sha256:4ab51807d0d783f95f2ea240822b395839de762243c6e8d2e1ce39ef040a84ef`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4ab51807d0d783f95f2ea240822b395839de762243c6e8d2e1ce39ef040a84ef) | `amd64` `arm64` `armv7` |


## Usage

To build the melange workflow in [examples](examples/gnu-hello.yaml):

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build /work/examples/gnu-hello.yaml
```

Output will be in the `packages` directory.

To build the melange package for the host architecture:

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build --empty-workspace --arch $(uname -m) /work/melange.yaml
```

To get a shell, you can change the entrypoint:

```
docker run --privileged -v "$PWD":/work -it --entrypoint /bin/sh cgr.dev/chainguard/melange

/ # melange version
...
```
Note that melange uses bubblewrap internally, which requires various Linux capabilities, hence the
use of `--privileged`. Because of this requirement, we recommend this image is used only for local
development and testing.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/melange:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/melange:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/melange"
      },
      "image": {
        "docker-manifest-digest": "sha256:4ab51807d0d783f95f2ea240822b395839de762243c6e8d2e1ce39ef040a84ef"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "aa0affd1146749ba9b5ea246fda7ad3989829256",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDQn1K8K7vNDAke1cqqjPX2Tj90PCqi9lfj0DGSGueT2AiBqHClsj6kpsEHGAzMP83HREL2bzwkflCglTb2n0Pse4g==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZWM0MWQyNTMyZGU0NmRkMDU2YzM3OTA4ZmQzOTEyOGEyMTAxNzgyMDZmY2U5ZDBiMDZlNDNlNmU4OTNlMTFjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR3ZMWUdmbVhwZi9IaFpGRTVNKzJndEpVc1dSekxKc1BPeDVyZk9qVkYzYUFpQVhLa1ZvcGFMVE9NcHRQRkxoOStjbk4rWDVwNzREdmJUYlh6eFNjekp0aHc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRla05EUVhsSFowRjNTVUpCWjBsVll5dHRXR1pVU3pNMVZXNVNObUpyUldkV01tdGtTMmxKVlRJMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTlZGbDNUa1JGTlZkb1kwNU5ha2wzVDFSRk1VMVVXWGhPUkVVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZJVWtseGRFSkdZamsyTVZGeWJFUnpSbTVuVERWelJGUnFORmhOYVhZMmJIRlhXakVLU213cmIzSkJZVVpWYWxwSFQyTm5ia1pJTVRseGJuWnpkWE0wVGxnNWIweGpaRUZNWlhkWE5uaGtUemwzU0dKVU1tRlBRMEZyUVhkblowazRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5V2pKMkNqZFVZMnBJTm5ORldsRXJVMk5aVVhFcmR6bHpOMWh6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpVjFaeldWYzFibHBUT0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUldkWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVWalNGWjZZVVJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtOb2FGbFVRbWhhYlZwclRWUkZNRTVxWXpCUFYwcG9UMWRKTVZwWFJYbE9SRnB0V2tkRk0xbFhVWHBQVkdjMVQwUkpOVTFxVlRKTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFEUVVkRGFYTkhRVkZSUW1jM09IZEJVVlZGUlcxU2NHTXpVbmtLWWpKNGJHTXpUWFppVjFaeldWYzFibHBVUVdSQ1oyOXlRbWRGUlVGWlR5OU5RVVZIUWtFNWVWcFhXbnBNTW1oc1dWZFNla3d5TVdoaFZ6UjNaMWx2UndwRGFYTkhRVkZSUWpGdWEwTkNRVWxGWmtGU05rRklaMEZrWjBGSldVcE1kMHRHVEM5aFJWaFNNRmR6Ym1oS2VFWmFlR2x6Um1velJFOU9TblExY25kcENrSnFXblpqWjBGQlFWbE9RalZPVXpKQlFVRkZRWGRDU0UxRlZVTkpTSGwyUlN0cWVXcFlaVVZXVjJ4NVNraEhURGxhZGxsMVJ6RkthV05ZVFhObE9Ea0taekVyUVdSTFdXWkJhVVZCZUdkT1YxSndWVmxFVHk5aWJVdGFPRGw0UVVaaFFqa3hTMEpDT0RCallsWjFUaXN4UlRod1ltdHRjM2REWjFsSlMyOWFTUXA2YWpCRlFYZE5SR0ZCUVhkYVVVbDRRVXRYTURKUlV6STVRelZVZDBSNVdqaDJiRVV4YzBOT1FteERTVWRIZDNGNWEyWnFXblk1VEVsS2RXRkxURFp0Q2l0Tk4yUjROR3ByV2tRekszaDZUMDg0VVVsM1RYWlZjVXRXWkhOU2MwMXFkV0Y2YXpaUFRYSkhjMDQ0VjNremIyUnZkVGw0UkRGdU5XbG5MM2RCVVhRS1FVSlFZbVI2UjNwSFpUUklURlZsVjA5MlEyVUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663257870,
          "logIndex": 3509832,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/melange/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3061831314",
      "sha": "aa0affd1146749ba9b5ea246fda7ad3989829256"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

