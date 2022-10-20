# ko

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/ko/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/ko/actions/workflows/release.yaml)

This is an image that contains ko, go, and build-base.<br/><br/>This image is designed for use in situations where you would like to use `ko` with codebases that have C dependencies where `cgo` must be used. In these cases, staticly linking against musl instead of glibc results in smaller binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/ko:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `0.12.0-r0` `latest` | `sha256:232c0bb9e854a46b17f09014f46be49f48761018c19d6fe6328edf3b477b670c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:232c0bb9e854a46b17f09014f46be49f48761018c19d6fe6328edf3b477b670c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.11.2-r3` | `sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.11.2-r4` | `sha256:0917717d86a1fc860c25d4fc9092c0e50bbab0ee2ec191199dabe70bfe110f04`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0917717d86a1fc860c25d4fc9092c0e50bbab0ee2ec191199dabe70bfe110f04) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-reference": "ghcr.io/chainguard-images/ko"
      },
      "image": {
        "docker-manifest-digest": "sha256:232c0bb9e854a46b17f09014f46be49f48761018c19d6fe6328edf3b477b670c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "27b0acd466a951aaae7fa62f0866142045ff0a35",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC1neehkBJUJOX5Ba9FqIsG6euFVa/Y5n4wgw61qMEnDgIhALtNUatNdurFOskWvb2vo+JcS0uSYNsq3o/dkJS+8GrE",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2MDAxNmIyNWJjZDBhYjczNzc4NGViMjFmMTUyZWNiMDMxNDliODRkNTA0MzEzYmFlY2I4NjM5Njc2ZGRiOWMwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURLRHJMZVczRHlsc2JqWHhNNmtFR2RoajYzNXY0OGRqRTVML21YT0xXYmNBSWdJSnB6VUh6blFxUVNHc0swVmtkUDhYWEhPMTBoTmtlbmxxcUswSFZYLzhNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVha05EUVhsWFowRjNTVUpCWjBsVlVVd3pWVkExVjFaT0syeEdZMnB5WjFKallYY3JiV2d5Vmt4QmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTmFrRjRUMFJSZVZkb1kwNU5ha2w0VFVSSmQwMXFRWGxQUkZGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZDVm5VeE9VVllTVzFUV25WNGVEVnBTMU0wVldSR1RuQkxhRU5CTW5CTE5EVjNlaklLVDFWWWRqQmthbmt6WlhaTVdEbFVOekZZVFVzeFNGaDRVVVZDWmtRNGRWUnNSMnMzT0VsdE1IcGpjREJxTjFGR2NXRlBRMEZyVVhkblowcEJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZVVUZsbENtUnFkVVZYUkZwTU4zTnNhblZqVGxwa2NVRnZWM1kwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlUwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FWSjNaRmhPYjAxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEVTVE5aYWtKb1dUSlJNRTVxV21oUFZGVjRXVmRHYUZwVVpHMVpWRmw1V21wQk5FNXFXWGhPUkVsM1RrUldiVnBxUW1oTmVsVjNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSloxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlZWa3lhR2dLWVZjMWJtUlhSbmxhUXpGd1lsZEdibHBZVFhaaE1qaDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZExRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSklkMFZsWjBJMFFVaFpRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBRNWQzaE9TMUZCUVVKQlRVRlNla0pHUVdsQlRERk5SbVU1UTFCdll5c3ZiMlZEVWl0S0wwaGpTWE00VDB4bFlWSUtLM1JEUTBkek1HTkZSVWxtVFVGSmFFRktkVXQzZDFaNVZqWmhOa1pMVm1kNU5sY3pRM0psYm5Kc1IzRnpXV2syVnprM1JHYzBlR1ZaUlVkb1RVRnZSd3BEUTNGSFUwMDBPVUpCVFVSQk1tTkJUVWRSUTAxQlN6ZzFaREE0WkdneVVteGpjbWN4TUZCMmJra3ZiVmhDUmtSaWJVRk1SVEl6U0Zod05FTlZhVWsxQ25OVlF5dDZibGxRVmt0U2RUSnlkR2t2VlRKUVluZEpkMkZsTUhWbWR6TlNWR3MzWkZSRFFYUnRjbXh4Y0d0V1IxRjJNbUkzVFVGRmFqRTBhbGt6UWlzS1VtcE9hbEZoV1dWRFMwNDROMmMxV0cxNVFuSk9ja2hoQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666297143,
          "logIndex": 5516991,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "27b0acd466a951aaae7fa62f0866142045ff0a35",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3292633232",
      "sha": "27b0acd466a951aaae7fa62f0866142045ff0a35"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

