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
| `0.11.2-r4` `latest` | `sha256:0917717d86a1fc860c25d4fc9092c0e50bbab0ee2ec191199dabe70bfe110f04`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0917717d86a1fc860c25d4fc9092c0e50bbab0ee2ec191199dabe70bfe110f04) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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
        "docker-manifest-digest": "sha256:0917717d86a1fc860c25d4fc9092c0e50bbab0ee2ec191199dabe70bfe110f04"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "0721e01d728c536c1fc3ea4d25fd8db86c53c9d6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDGdlp7wQ2CdGIfdwrDDcLezl5RbqFnpJ77gpmCJt4vWAiAUd3DZQceq3MCgqhNAD1jYcmv1DOGelVEQamnS0+L7gw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNDk0Y2NmYTdiZTA4MmY5Y2Q1Yjc2N2QwNDM0MzI5MWUwZTFhMDk5OTAzMmM2ZWZhZGQwZDgzYTc1ODZkZjY5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURmaDh2a0tFV2UrVUpCOVEwWmpiRVF3ZVJHUEc2emRZU044T2VqTkRuWDBRSWdDMng4alF0OWFCS3dDV0V4Q2VLdG8zUCt5M1hzanZaazVsVlYwWUNrVFZBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVla05EUVhsWFowRjNTVUpCWjBsVlRTczVjbk5ZYWs0M1ZURjJNemhvSzBVMFQzRmlkR1F2UjJJNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlZGa3hUbFJCZVZkb1kwNU5ha2w0VFVSRk0wMVVZM2RPVkVGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6TUVGak56VlVabmhVU1U1dGRUSXdOMkpCVkhNM1YzVnlSMnAyTVdacEswWTFjbUlLV0ZWaE9Xd3hkbEpuZVVKWlRYazFZV2NyYW1VM2RqUm1MMmhuYzNaM01XbFRWSFZvWXpOaWMycEtiRmxRUm1sUWRtRlBRMEZyVVhkblowcEJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6WlVjMENuQnJiVzlRT0VGb05GRkZia0Y2Ym1oMFRXcGxaRlIzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlUwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FWSjNaRmhPYjAxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEVRVE5OYWtac1RVUkdhMDU2U1RSWmVsVjZUbTFOZUZwdFRYcGFWMFV3V2tSSk1WcHRVVFJhUjBrMFRtMU5NVTB5VFRWYVJGbDNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSloxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlZWa3lhR2dLWVZjMWJtUlhSbmxhUXpGd1lsZEdibHBZVFhaaE1qaDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZExRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSklkMFZsWjBJMFFVaFpRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBRMWREZERNRkZCUVVKQlRVRlNla0pHUVdsRlFUZEdNa2MyZVdaa09UVnJabEYyYTNORVUyaEJWVXRoYkhZellsVUtWazVCU1hOUEsyWmtjbGsySzJrd1EwbEdMM2RrVVUxdFNWVXlWV3RsZFdVd1RrbHplalZYVjFJNVZtSTJSbFF2Vld0NGJEa3JSbGxxUkZobVRVRnZSd3BEUTNGSFUwMDBPVUpCVFVSQk1tZEJUVWRWUTAxUlExaDZRVTFyUmpsRFFuZGtjMWRoZDBoeVJEZGxjbVZ2YzNVMGFIcHVLMEkxYmtsVGNXcHZaeXRhQ205SldHUnVTbU5OZVdKUEszVmhhblpLV0VwRE9DOXZRMDFEZVVKM05TOVpTbTEyUkV4c2VYUkVVV3R3VTNCdGRWUXdlRnB3T0d4bkt6QjJVazVwWWtnS2VHSkJkMDFwT0hadllsaFJhWFU1U2t0eVp6WnlORGxMVTNjOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1666025737,
          "logIndex": 5291071,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "0721e01d728c536c1fc3ea4d25fd8db86c53c9d6",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3267004577",
      "sha": "0721e01d728c536c1fc3ea4d25fd8db86c53c9d6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

