# ko

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
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
| `0.11.2-r3` `latest` | `sha256:2bd274bafa0cfe89d2c90794a561a0d6acfdd4a0ff9fc7d3e698144373c565f8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2bd274bafa0cfe89d2c90794a561a0d6acfdd4a0ff9fc7d3e698144373c565f8) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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
        "docker-reference": "ghcr.io/chainguard-images/ko"
      },
      "image": {
        "docker-manifest-digest": "sha256:2bd274bafa0cfe89d2c90794a561a0d6acfdd4a0ff9fc7d3e698144373c565f8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "cd439e8e783a6738ae08c9d93a274a4055b528b7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHDEUdGQtheGiHnToptVjOwGyCzhshn0eFD9nfFdngyCAiEAjQU+NztlkiqLOvDp5I4bFGQgcG4lTRNjJ7u4GAt6Qs8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMDUxNGZiZTdlNWVmNTZmYTc5YTBiNjlkYmMxNWI1OTJiN2YyMzFjYTkxZjUyODZkMmNjOTU1MzRjZmYxOGM5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ2J1Vk9oYVZTb0hDL1AzZ0U3L0REdkVuaVQzSUw5Zmd5d3Byc0IwSUY0Z0FpRUFpZ1FZaWVlc0F2SlMxNVhVZGtGZjF6cngra3dzMFJBTTVDY2FpV1lZcGw0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwTFowRjNTVUpCWjBsVlptOW5RWFZxYlU1NVFteHRPR2d3YkdGUE0xb3pRMUpoWlhJNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZGVXhUbXBWTlZkb1kwNU5ha2wzVDFSSmQwMVVXWGRPYWxVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMWjBWNGVrdHFWeTlMTVZJNVJFbGtZbkZtUTJJdlVrczFiekZyV1V0dFVVdzVPVEFLYzFvek5HdHZLekp5VVV4MVFXOVpPVXRNWkVWSU1FeHphalF3TmxsWldsVXJNa1pXWTBoR2FITXJWVlV3VTNocU1rdFBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyUmtObENteEdaVE56VUhjdlZtdHliVkZQWTBwd1UzWXpOVWN3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlprSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FrWXpZak5LY2xwdGVIWmtNVGxyWVZoT2R3cFpXRkpxWVVSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHFXa1JSZWs5WFZUUmFWR00wVFRKRk1rNTZUVFJaVjFWM1QwZE5OVnBFYTNwWlZFa3pDazVIUlRCTlJGVXhXV3BWZVU5SFNUTk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOSlIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlJrZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKMGRrMUNNRWREYVhOSFFWRlJRbWMzT0hkQlVWbEZSRE5LYkFwYWJrMTJZVWRXYUZwSVRYWmlWMFp3WW1wRFFtbG5XVXRMZDFsQ1FrRklWMlZSU1VWQloxSTRRa2h2UVdWQlFqSkJRV2huYTNaQmIxVjJPVzlTWkVoU0NtRjVaVVZ1UlZadVIwdDNWMUJqVFRRd2JUTnRka05KUjA1dE9YbEJRVUZDWnpGMVpEZExSVUZCUVZGRVFVVmpkMUpSU1dkTlVUVXdhRGdyVjFZd1ZsSUtXbEI1ZUVwRlJYRlRXRFkyWjJZMWJEVkJUME5wVEhob2JUVk5VbU5wTUVOSlVVUnhhSFZ5TkZVemJVbHJVelJtYkU5cGFFNTBSV1pTT0ZNeVlrOVdOUW93TUVGV2FUUkRiak5FUzBObVZFRkxRbWRuY1docmFrOVFVVkZFUVhkT2NFRkVRbTFCYWtWQmMwaERNa05JZVhOM1psaE1RMHM0VjBsa1l6aDFWVWxOQ2tKd1MyUkNZbGxvYzJ3M2RrVjFSbkJGWW1ZeGRXaE9kamQ1YzNaaFdXaGpNRzFrVFRaTVUzRkJha1ZCTkU5alVWcDRhRk5EU0hkVGVWVXpjRnBTVW1JS2QzUlFla2hVVWpWSmNWbENPWGxXU1c5Uk5sWmtZM2xGTURod1lqQnFUV3BFVTFncldXSlhVV0ZTUW5RS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663689441,
          "logIndex": 3614644,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "2",
      "run_id": "3091518764",
      "sha": "cd439e8e783a6738ae08c9d93a274a4055b528b7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

