# ko

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/ko/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/ko/actions/workflows/release.yaml)

This is an image that contains ko, go, and build-base.<br/>This image is designed for use in situations where you would like to use `ko` with codebases that have C dependencies where `cgo` must be used. In these cases, staticly linking against musl instead of glibc results in smaller binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/ko:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `0.11.2-r3` `latest` | `sha256:63f3cf0b68d3e4e3046529fa1f5858a9b48d203e5ae9e5e6e830d6955948d973`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:63f3cf0b68d3e4e3046529fa1f5858a9b48d203e5ae9e5e6e830d6955948d973) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


## Usage

### With CGO

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
        "docker-manifest-digest": "sha256:63f3cf0b68d3e4e3046529fa1f5858a9b48d203e5ae9e5e6e830d6955948d973"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "a962e38e2534108cf2d540d009f0418f379033b1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCBTM6pTRg+xnEszz+3DdxtlPml8AAyze0+/xmzpr96ZgIhAOy2DObiECh2+kFoasI31YTc8AYnb4CwlTLfkmhp5JNt",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiNGFlMmIxMjY1NGNiNDU0MjY0ZmNjMDcyZTE5MjU5MTA4ZmE0YmU2ZTViZTFlNTg3NDEyNzAxZDkwMjcwNjI5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRWF5enFXZ284NHhzbVRrbzZJMXd0N2dtUFZCZXVqZnh1MjkzNmJEdGVuS0FpRUFweXpmYjROZzgzYjVCQzYyanpXTjR0Yy83QnRxbXpsNXd1ZFNEYnBrM3hRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnJWRU5EUVhobFowRjNTVUpCWjBsVllYTXJiV1JQWWtkeE5uRjBObFJKUjFCS1lVNVBTQzlYWW1KTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTlZGVXdUV3BGTkZkb1kwNU5ha2wzVDFSRk1VMVVWVEZOYWtVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzTVV4Q1ppOXJSMnBFU0ZWaU5VTXpkekZ6VjBSMFNETXJlRXRFYlZCNU1qbExaWGdLVVV4MlkxQk1UVFIyYjJ4TmVrRjNiV2g2TWxaVFpTOUxlU3RYZEhSclVtdEZjSEkxUlc1WGEzRlJUMHByTm1GcVJXRlBRMEZxV1hkblowbDVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1VkRJckNtMHpiRWt5VVhacVRrMVBOVFJKVFdaMGRUZDBZWGhWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFoUldVUldVakJTUVZGSUwwSkdUWGRWV1ZwUVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoTWpoMlRHMWtjR1JIYURGWmFUa3pZak5LY2xwdGVIWmtNMDEyWTIxV2MxcFhSbnBhVXpVMVdWY3hjMUZJU214YWJrMTJZVWRXYUZwSVRYWmlWMFp3Q21KcVFUVkNaMjl5UW1kRlJVRlpUeTlOUVVWQ1FrTjBiMlJJVW5kamVtOTJURE5TZG1FeVZuVk1iVVpxWkVkc2RtSnVUWFZhTW13d1lVaFdhV1JZVG13S1kyMU9kbUp1VW14aWJsRjFXVEk1ZEUxQ1NVZERhWE5IUVZGUlFtYzNPSGRCVVVsRlFraENNV015WjNkT1oxbExTM2RaUWtKQlIwUjJla0ZDUVhkUmJ3cFpWR3N5VFcxVmVrOUhWWGxPVkUwd1RWUkJORmt5V1hsYVJGVXdUVWRSZDAxRWJHMU5SRkY0VDBkWmVrNTZhM2ROZWs1cFRWUkJZMEpuYjNKQ1owVkZDa0ZaVHk5TlFVVkZRa0UxUkdOdFZtaGtSMVZuVlcxV2MxcFhSbnBhVkVGaVFtZHZja0puUlVWQldVOHZUVUZGUmtKQk1XdGhXRTR3WTIwNWMxcFlUbm9LVERKMGRrMUNNRWREYVhOSFFWRlJRbWMzT0hkQlVWbEZSRE5LYkZwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtOQ2FXZFpTMHQzV1VKQ1FVaFhaVkZKUlFwQloxSTRRa2h2UVdWQlFqSkJRV2huYTNaQmIxVjJPVzlTWkVoU1lYbGxSVzVGVm01SFMzZFhVR05OTkRCdE0yMTJRMGxIVG0wNWVVRkJRVUpuTUVoUkNuSkdWVUZCUVZGRVFVVmpkMUpSU1doQlVHb3lWWFJKZERWMlpXZDVMMFE1U0hkck0wWk9Zamh5VFdFd1VEQlpUMmh5Uml0RlMweHVRa2syV1VGcFFqa0tOamhCVEVoNE9WWXhSVXRIWVVSUlFsRXZOVzU0UzBsVmFFTldiVkZsSzNCdlIzTXdlbXRXVUZSVVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dlFVUkNiQXBCYWtJM09ERmFiV1JaYmpGR1F6bGtUSEZSTTNrck5ERlhOa1JoVVhsTWRYb3pjbEZrVGtaaFRtcFdMeTlFV1ZwMFZ6RXpaMjVKYmtaT2VVaFdVbTA1Q2tNeFRVTk5VVU5vYm1zeE1EQkpSV0Z2VjNKU1QyeEZSbWgwWVhONE16VTRRVmN2ZGs1T09YQlRTbEJSVUd3MGRXdHBNVEozVDNaRlNtc3lTSFJoTUdJS1NYSjBlalpDWnowS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663256556,
          "logIndex": 3509654,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/ko/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3061776658",
      "sha": "a962e38e2534108cf2d540d009f0418f379033b1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

