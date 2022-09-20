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
| `latest` `v0.1.0` | `sha256:d5244a9f22508655cf66915fa6befa8d0a595c594db1132d672e7fdae5f58762`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d5244a9f22508655cf66915fa6befa8d0a595c594db1132d672e7fdae5f58762) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:d5244a9f22508655cf66915fa6befa8d0a595c594db1132d672e7fdae5f58762"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e1b89189a5969368ff91651284637a27eb56c8ee",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCdMGPNgMV2xxqbmQFHqifQ8itDT7kbTMaHFR1p6j/2DAIgOkOKVm3nKPZg0fHZReuW5NIaABuvYSoCD9WCv69cteg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4MTFlYjBhYTBiOTYyMjJlN2FkZjY0MzlhYTUyNTNhNmE5MGQ0ZmVkMTU5Y2I0NDVlODliNzk5ZTMwNWU4NWFmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSFV2R3Arb1pEZXFOLzFIcjc0czU5SzYzRk5BblRGOGFGZVZBR3d4RlZyMkFpRUF0NGp2NjVZU01MTEFZSTBNSVB4ZFJZb0lQTUxFVEswQy83UnBEV1BScUhzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVha05EUVhsWFowRjNTVUpCWjBsVlEyUjBNQ3RJTmpCeFJrbEhPRWN6V0hsTVMyUnphRUpJUmpSamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlJFRXhUWHBSZWxkb1kwNU5ha2wzVDFSSmQwMUVSWGROZWxGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZQUlZoT1FuVjBTR3B5Vmk5NGMwVnVaMDFxTTFkME9VRlhUbFZJZVRsTGNFeEZNeXNLTm1odVZXeHBjMFpvUVVWbFpHdDRaM2hJWjNoRVZrUkNaREZWYldST1NtOU5lRGxyV2tWMVVXb3paV2RFVVVWak9IRlBRMEZyVVhkblowcEJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZQYXprdkNtTndialJZVEdKM2QzZEdSRVo2Vm5KV1ZWRTRjemxyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BpVjFaeldWYzFibHBUT0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUm1kWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVsak1rNXZXbGRTTVdKSFZYZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlhVkVacFQwUnJlRTlFYkdoT1ZHc3lUMVJOTWs5SFdtMVBWRVV5VGxSRmVVOUVVVEpOZW1Sb1RXcGtiRmxxVlRKWmVtaHNDbHBVUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRm5RbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNTbXNLWVZoT01HTnRPWE5hV0U1NlRESXhiR0pIUm5WYU1sVjNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZExRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSklkMFZsWjBJMFFVaFpRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSWFIweDZhVkZCUVVKQlRVRlNla0pHUVdsQmRIbzJlalpJZFN0NlRrVnZSMG8yU25KRVZXVkhObTlCTkV4TU5tZ0tNRmhhTkRReFVqUkViM0paZFhkSmFFRktNMk5WUmpWeWVGcGlVMjUwZVRCaFprTnJia3hXY1hFdk9WSjFTMHhUY1dWeU9UQlpPSE5RUldscFRVRnZSd3BEUTNGSFUwMDBPVUpCVFVSQk1tTkJUVWRSUTAxRU1GbGxWM0k1TDNCM2FHcFBPV2hOZDJKT2IxVlFabEo2ZFd3eE4yWXpTamhZY1dwQ2FXRkpUbTFqQ25wR1JXbGlWR3g1YWxKVFRVUnViSGRxZERsT1FtZEpkMEYwV0hZemN6QmhSblpqVnpSWE1tdDFURXN3ZUhJek9WcDBWWHBVZVhJMGVtd3hjRTlVYldJS1pHbDZiMlZ0VWs5Q2VXWlZkSEYyVUhwbldGSkNZbTF0Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663635230,
          "logIndex": 3572725,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/melange/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3086619583",
      "sha": "e1b89189a5969368ff91651284637a27eb56c8ee"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

