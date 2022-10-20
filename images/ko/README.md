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
| `0.12.0-r0` `latest` | `sha256:0cd593c37313ce7cfb5245177cd63727a35384dc3ce07e7e252a36f4938febef`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0cd593c37313ce7cfb5245177cd63727a35384dc3ce07e7e252a36f4938febef) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
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
        "docker-manifest-digest": "sha256:0cd593c37313ce7cfb5245177cd63727a35384dc3ce07e7e252a36f4938febef"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "034fbe0d8306a38a4d7b1a880bc3d3972d7d0f20",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIC5CnYbzmILf3BynIxW+q7DukMZa9lLPZUVUfyEiZtOjAiEA4IA9zS3WkxFU7zP7KDd4yK/i5pWS2OqPbFd4Zp5loFw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwZjIzMjJlNDFjY2JlNDUzOTcwYmI2MzY3NTRlMzQ0MjQ0MzBjZDYzYWQwZjczYjYxZjlhYjdlNDhkZDc3OGJhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRnZVM01FNi9FR0M4Q3o4TENUYzV1S0FqbUw5QzZ3azJoQkhEdU5CVlBBSEFpQUROY1FSRGxCazZDL0xXN09VV0RaVFhibUVKU05IZ28rY2VxTWU2TTRqc2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZWRU5EUVhscFowRjNTVUpCWjBsVlVsbHRObWhXVlUxbmRuQk9iMGRHZWk5d1pETmxTSFI2UjFCbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlJFbDVUa1JCTTFkb1kwNU5ha2w0VFVSSmQwMUVTWHBPUkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY0UzNoTWIxVTFlVzVqWkRCT1dsQXpNR2RQWlVSMFVtTkVSbVU0WWtWdVpVbzRhRElLVEcxemMzVkRiR2xEZWpsSWRWRllUVU5XT1VKNFNrYzJTRUZuU1dNNE9IRkxPRGsyYkV4TVdqVTRUM0IwV1VkT00wdFBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTYm1FeUNtWkRNRGRFWlRWak9VaEtTMlpOVWtWUWR6WjBhbEJCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJkM1RYcFNiVmx0VlhkYVJHZDZUVVJhYUUxNmFHaE9SMUV6V1dwR2FFOUVaM2RaYlUxNldrUk5OVTU2U210T01sRjNDbHBxU1hkTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaeTlOTUdacVRVRkJRVkZFUVVWWmQxSkJTV2RYWkVscFZYRldSMWc1WWtKSVpERXpUWHBUUzFoVlNGY0tNbUpEWVV0T0wxVTNUV2xoUkZwM2VESjZkME5KUkRBNWMxZHBUVGxNYzJ4SFVFdzFTa2hLWTJodWNsUTNUVzVuVTFoNFJ6VmtaWGh4YTFKaVRVY3lNQXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpqUVUxSFVVTk5SSGdyVjNSc2F6Sk5ZbmhDWjBab2JtbENjVE5RUkhsTFpqRm5Za053V2tkdlJIRklOVlUzQ214Vk4yZGtaa01yWWpodlVEY3dhSGR0UlhOdVp6TXJOamRCU1hkSmExVnZUalI1VVVWMmQwcHNVMFpsYkc1bksyOXJhbTl5V0VKVlRXd3ZZVFJTTUUwS1lXZDJVM2N2ZW1wVGVreG1ObHBKTkVkb1oxRmxPWGs1UjBST01Bb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1666232667,
          "logIndex": 5469022,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "034fbe0d8306a38a4d7b1a880bc3d3972d7d0f20",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3286351453",
      "sha": "034fbe0d8306a38a4d7b1a880bc3d3972d7d0f20"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

