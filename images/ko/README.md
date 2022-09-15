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
| `0.11.2-r3` `latest` | `sha256:94e8b05dc17bb0b8f38acb5af013c1eb15cb688ff1e430c1b3ba9f724f0f2558`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:94e8b05dc17bb0b8f38acb5af013c1eb15cb688ff1e430c1b3ba9f724f0f2558) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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
        "docker-manifest-digest": "sha256:94e8b05dc17bb0b8f38acb5af013c1eb15cb688ff1e430c1b3ba9f724f0f2558"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "554f0d27b274cbe1b120555f1e8ac8786692bc8a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIE4YFkCXnF61hNUnNxfpEHpqKi1/5pN+E2fX6dCyKX3zAiA8p2NmSr8/j5WbbP0xv4Lw4AE0lL93liFMkzZ74rMU3w==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmZDQ4MmQ4MWU1MTE5ZGRiODdlZmQ4YjJlMzcxNGY3NzQ4ZjQ4NjQ3ZTY4YmJhYzgxYjdmMmFhNDFhOWZjOGRmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR2crMWFZOExydGwwRVZBTU96RjNzdkRQZ1FRYTFBVG5VdlgzOGlnT3J1Y0FpRUF1M0dreDYzZ2ZndGNXcW53UDZSeDlUWjEzQ1pyOEJlUUN1dHZRcEZIWFVzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnJSRU5EUVhoaFowRjNTVUpCWjBsVlNXbzViMjB6UkVWT1JGcG5Sa2RrTTJvNEx6VkpPWFFyZEhaQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTlZGVXhUWHBCTTFkb1kwNU5ha2wzVDFSRk1VMVVXWGROZWtFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZVjI5TVluWTBSbHBuVnpKWlNXaGxRMnQxV0ZCak5FODRNVzVaWlhwTmNXcFBMMElLWTBsd1NtdEpWM2w0TUdNMldYQjBjbkoyUW0xTVVua3JOR1YxVDJwRFFuVmpSMnhOU25rM1puTkRNV2swV0ZGVWNtRlBRMEZxVlhkblowbDRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYxYjJJMENtUTJPVU5EVldNclRWVlBhREZIUVV3MFJFRm5NWEpCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFoUldVUldVakJTUVZGSUwwSkdUWGRWV1ZwUVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoTWpoMlRHMWtjR1JIYURGWmFUa3pZak5LY2xwdGVIWmtNMDEyWTIxV2MxcFhSbnBhVXpVMVdWY3hjMUZJU214YWJrMTJZVWRXYUZwSVRYWmlWMFp3Q21KcVFUVkNaMjl5UW1kRlJVRlpUeTlOUVVWQ1FrTjBiMlJJVW5kamVtOTJURE5TZG1FeVZuVk1iVVpxWkVkc2RtSnVUWFZhTW13d1lVaFdhV1JZVG13S1kyMU9kbUp1VW14aWJsRjFXVEk1ZEUxQ1NVZERhWE5IUVZGUlFtYzNPSGRCVVVsRlFraENNV015WjNkT1oxbExTM2RaUWtKQlIwUjJla0ZDUVhkUmJ3cE9WRlV3V21wQ2EwMXFaR2xOYW1Nd1dUSktiRTFYU1hoTmFrRXhUbFJXYlUxWFZUUlpWMDAwVG5wbk1rNXFhM2xaYlUwMFdWUkJZMEpuYjNKQ1owVkZDa0ZaVHk5TlFVVkZRa0UxUkdOdFZtaGtSMVZuVlcxV2MxcFhSbnBhVkVGaVFtZHZja0puUlVWQldVOHZUVUZGUmtKQk1XdGhXRTR3WTIwNWMxcFlUbm9LVERKMGRrMUNNRWREYVhOSFFWRlJRbWMzT0hkQlVWbEZSRE5LYkZwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtOQ2FWRlpTMHQzV1VKQ1FVaFhaVkZKUlFwQloxSTNRa2hyUVdSM1FqRkJRV2huYTNaQmIxVjJPVzlTWkVoU1lYbGxSVzVGVm01SFMzZFhVR05OTkRCdE0yMTJRMGxIVG0wNWVVRkJRVUpuTUVoaENteFJUVUZCUVZGRVFVVlpkMUpCU1dkUVJVRlhZMWx5VEU5YUswdG9RVGxTU0ZNMGVFRjJVazlXT1hnd1pXZDJXVmxYVURSaFNuRm5jV2hCUTBsRVEzUUtOMDVYWkdwWU1UbG1kR3hEVUZBNGNsVXdia05GWTJzM1FXdFZXRFpMVGxWa09XZEVNa0pqUzAxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1kQlRVZFZRd3BOUkdwV2VEQkhWVU5ZVmxoWU9VVnpkamxzT0RWMk4wUmhXblZGTm5aSE9FY3lkM0J2TlhsRlZFbFFlbGhoWlhOcGJ6bElUemN5ZVRseWVTOUtWM0ZoQ2poblNYaEJTMkZ6YkVFek1VY3hiVVJPVjBwM05HaEdiSEZQYmtGdVNEQTRSVzFvV1VoTkx6WkxVVFpRVldwSFJuSTNkazl0ZDJOd1pHcFZjeXN6T1VVS00xbGFORlpuUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663257204,
          "logIndex": 3509761,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/ko/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3061843935",
      "sha": "554f0d27b274cbe1b120555f1e8ac8786692bc8a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

