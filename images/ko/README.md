# ko

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/ko/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/ko/actions/workflows/release.yaml)

This is an image that contains ko, go, and build-base.<br/><br/>This image is designed for use in situations where you would like to use `ko` with codebases that have C dependencies where `cgo` must be used. In these cases, staticly linking against musl instead of glibc results in smaller binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/ko:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `0.11.2-r3` `latest` | `sha256:fbbb484f9f5e4045904182000544b680a8152fe39aee6f2a806b5a7c60efdbdc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fbbb484f9f5e4045904182000544b680a8152fe39aee6f2a806b5a7c60efdbdc) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


## Usage

### Using with CGO

Navigate to the `example/` directory:

```
cd example/
```

Then run:

```
docker run --rm -it \
  -v ${PWD}:/work \
  --workdir=/work \
  -e KO_DOCKER_REPO=example.com \
  -e CGO_ENABLED=1 \
  cgr.dev/chainguard/ko build ./ \
    --push=false \
    --preserve-import-paths
```

This will build the example program, but not push it, due to `--push=false`.

To push, you will need to mount in your Docker config to provide auth by adding:

```
  -v $DOCKER_CONFIG:/docker-config \
  -e DOCKER_CONFIG=/docker-config \
```

If you're using Docker credential helpers, those will need to be made available in the container as well so that `ko` can invoke them.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/ko:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/ko:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/ko"
      },
      "image": {
        "docker-manifest-digest": "sha256:fbbb484f9f5e4045904182000544b680a8152fe39aee6f2a806b5a7c60efdbdc"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "765277f425e84d07734c8d9c46bf12bebc5f00c7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAWJGT5o/NYb1AQIKLtoBeHeqtH9+pMo/xUblHNy3jv+AiEA8gvXUZJ2B4IMfLN2gvZWdbCRRmNhX06AyMbJhitmcM0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwYWRmNzVjNGRiMTJmNTUyNGEzNDA4OTFiNmQ1MWYwYTUzYjRkYzhjMTRmY2FlNmQyNTA2ZGE1MTAyZGI0NjM5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURwMGdRQm9nL2M4V3JLRGVRT3NmblJoUXRmZkthUS82cEJVTGxmTnNSMmZnSWhBS3NBS0w1NTlWRTB4dGd1dEdpNEFxeXNuYWtxUGNZR1dCb2tuTC9kbTBZVyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnJSRU5EUVhoaFowRjNTVUpCWjBsVldHMWpTbUZ6TjIwNVRHeEpWRFJOT0RaVFZHb3pPRGx2Um1rNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDRUa1JSZDFkb1kwNU5ha2wzVDFSRk5VMXFTWGxPUkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUzUkhGNU1sQkpkMUk0TTNaMVp6bEpielZrSzNoT2NVTmtZa3BSZDJ0ekx5dHBRa0lLU0ZSb01YUk9hUzkyYWxaM1RuUjRSa1pWWTBWaWNVNHdNV3BVY0ROSGFsTjRkSHBzTkRaWGRsUm1NM05oU0hOcVZuRlBRMEZxVlhkblowbDRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZFT1dnMkNpdG9iMWxZVlZWYU5tZFVLekp4U2xkTFZXbHRRM1JuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFoUldVUldVakJTUVZGSUwwSkdUWGRWV1ZwUVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoTWpoMlRHMWtjR1JIYURGWmFUa3pZak5LY2xwdGVIWmtNMDEyWTIxV2MxcFhSbnBhVXpVMVdWY3hjMUZJU214YWJrMTJZVWRXYUZwSVRYWmlWMFp3Q21KcVFUVkNaMjl5UW1kRlJVRlpUeTlOUVVWQ1FrTjBiMlJJVW5kamVtOTJURE5TZG1FeVZuVk1iVVpxWkVkc2RtSnVUWFZhTW13d1lVaFdhV1JZVG13S1kyMU9kbUp1VW14aWJsRjFXVEk1ZEUxQ1NVZERhWE5IUVZGUlFtYzNPSGRCVVVsRlFraENNV015WjNkT1oxbExTM2RaUWtKQlIwUjJla0ZDUVhkUmJ3cE9lbGt4VFdwak0xcHFVWGxPVjFVMFRrZFJkMDU2WTNwT1IwMDBXa1JzYWs1RVdtbGFha1Y1V1cxV2FWbDZWbTFOUkVKcVRucEJZMEpuYjNKQ1owVkZDa0ZaVHk5TlFVVkZRa0UxUkdOdFZtaGtSMVZuVlcxV2MxcFhSbnBhVkVGaVFtZHZja0puUlVWQldVOHZUVUZGUmtKQk1XdGhXRTR3WTIwNWMxcFlUbm9LVERKMGRrMUNNRWREYVhOSFFWRlJRbWMzT0hkQlVWbEZSRE5LYkZwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtOQ2FWRlpTMHQzV1VKQ1FVaFhaVkZKUlFwQloxSTNRa2hyUVdSM1FqRkJRV2huYTNaQmIxVjJPVzlTWkVoU1lYbGxSVzVGVm01SFMzZFhVR05OTkRCdE0yMTJRMGxIVG0wNWVVRkJRVUpuTVdaU0NsWkxPRUZCUVZGRVFVVlpkMUpCU1dkRGFXbEdUR05oVUU1cWMzaFphRFZFYm1KUEx5dFJWbTlCUTFVeGVVZ3hUVEo1TjNscVpVSk1WbTgwUTBsQlNGUUtRbEpNUVcxQ09VZDJlVTV0ZEZsTGNqZDROSHBRV1Rod2NEUlFNbTVyY0V4VFZWTnJOeXM0ZGsxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1kQlRVZFZRd3BOUW5KbVJuZFRUblZKYWxkUmRuTXlUMGRZVm1FdlRWbEpURGhuU2xoUGFYSlFVMk1yTkZCdWFGTTNhM1pTVVVwaFlrSkphM2xJVTNOVWNqTk1ORkJtQ2xSUlNYaEJUMEUxZUhkd1dGRm5heXRRTjJZNVFqaFRWVUkzYWxsNFkwdE9aRU5pUmxSUk1rOUpURFpzUW1aMU0ycHZlV2RoT1dWTFpVVmlUbWg1VENzS2MxUlhTblpSUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663625714,
          "logIndex": 3564577,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/ko/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085956575",
      "sha": "765277f425e84d07734c8d9c46bf12bebc5f00c7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

