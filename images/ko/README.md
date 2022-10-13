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
| `0.11.2-r3` | `sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.11.2-r4` `latest` | `sha256:2646062874dd3d07d181c50ae6366e9bb08d6033d5aa5f782f46955c073fd79b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2646062874dd3d07d181c50ae6366e9bb08d6033d5aa5f782f46955c073fd79b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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
        "docker-manifest-digest": "sha256:2646062874dd3d07d181c50ae6366e9bb08d6033d5aa5f782f46955c073fd79b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "70cab73a4c4094a47c57d30eee22e6b33a0ccd01",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICYGXUaF+JlyeYhI89Cn7JNIGqlFSx3wLwe0j/RqIznEAiEAveVX84CgRaaI2zaW5P195nGr0PrU6ZxxcC5XZV+8ZuQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4MzNjNzhkNzFiMGU2MTEwODg5ZDA0MmVkMTYwMzk3ZDg2MTAzZjYzZjQzYTNhNGY3NzUyMWMyNWNhODY5ZmViIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ2hTcVUxOVBlSVo0ZnNRR01kQ01jdHVQTTY3L0c1OG00UlNPV2tNTkxmT0FpRUFpQVdmWWZGS1UzM0FCcWZEK0JPRWFsM0swYWlsMXBRbGNTR290TlFvazY4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVla05EUVhsVFowRjNTVUpCWjBsVlYwaFBRbkZ5U1hCaE9VVlVPVUZ5WTFSSmRHNWxlbFV6U2xSQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRXdUbnBKTUZkb1kwNU5ha2w0VFVSRmVrMXFRVEZPZWtrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZQYTFGRVdqVnROMVF3YkVkTVdFcHZTelZJUkRSV01tWTFOaXREUkdadlVtMXJLemNLTWxwbFlVZFdZMlk0YzFneVRHdEdiVWhsUlZwSmVHaHlMek00UjAxV1dYZ3ZhRkpOWmpNME5VZFhTM1JRYWsxMmFXRlBRMEZyVFhkblowa3ZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUxV213NUNrNVhiazlaUlV4T2JWRnFkSEJTTjJZdlNrMU5hMUpOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlUwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FWSjNaRmhPYjAxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEVZM2RaTWtacFRucE9hRTVIVFRCTlJHc3dXVlJSTTFsNlZUTmFSRTEzV2xkV2JFMXFTbXhPYlVsNlRUSkZkMWt5VG10TlJFVjNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSloxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlZWa3lhR2dLWVZjMWJtUlhSbmxhUXpGd1lsZEdibHBZVFhaaE1qaDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZEtRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSkljMFZsVVVJelFVaFZRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBRd2VHOVJaWGRCUVVKQlRVRlNha0pGUVdsQk1rTmtkVFJYVTBkck16TjZTbkJ0ZFd4eFlVbFhka2xpYzI1WmFHZ0tNMmROU2tOeGVUZFNSMXAxTjBGSlowMURaRWh4V1VScVJsTlFPSEJrYTJ4NlVrbGtOMWRHYUhKRFVHRllhMkZETDAxMVlYazBiamM0TlZsM1EyZFpTUXBMYjFwSmVtb3dSVUYzVFVSaFVVRjNXbWRKZUVGSmExWnlPREpvYVhOUFEzWjBORFZaVjFwa1NUaDZjVlJqVHl0SVlqaEthRFJoTm1wTE4zWkVlRE5aQ21SU1ZGUmFLMGd6VlN0NVJIaHpiblZFWkdRMlQxRkplRUZOUlhNdk9WVnlZbUlyWm5sMGRYY3ZSMkkzZEdSU0wwUnBjRTVPTXpSNVJraG5hbHBTUmxvS2NHVkdSVFp3U3pOTlVUaFJNbEpXZFRVdmVYSXZTRVl3ZUVFOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1665694065,
          "logIndex": 5050751,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "70cab73a4c4094a47c57d30eee22e6b33a0ccd01",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245457622",
      "sha": "70cab73a4c4094a47c57d30eee22e6b33a0ccd01"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

