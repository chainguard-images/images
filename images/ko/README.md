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
| `0.12.0-r0` `latest` | `sha256:6e6eec123613e18ad0b9914ac9dcd7ffe2378f19002ccb9c18932c16d99860dd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6e6eec123613e18ad0b9914ac9dcd7ffe2378f19002ccb9c18932c16d99860dd) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
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
        "docker-manifest-digest": "sha256:6e6eec123613e18ad0b9914ac9dcd7ffe2378f19002ccb9c18932c16d99860dd"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b86d1c8aa984711877224e845181337381dd63ff",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCpa0vgY+KRzIPlaGDJ65g0BeUHXM9CbVhKTyc2AdipSAIhAPek8cGCYefC/EE2xhBiEBsMdLBMRPDfPq/R+AQTmRlL",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2NWJhYmViZGE4NDYyY2FhZjQzODU2M2UyZTQ1NWVlYTE5YTdlNWQ2ODc3ZTMyY2U0ZWUxMjc0MGViNjNjOGJiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSHErNWsrZG9CQmIrbzA4ZzFFWWxTUkpjYkdqM3NTM3VkRUc4b2UreXBXR0FpRUExNmxNOEdPODJOQnEweW92cFhjUGFWNXF5d2ZLRUV4OUFqeWJmNUFuRWMwPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhseFowRjNTVUpCWjBsVllXcHdXRk5qWW1sUlIzSktXbk4zVEdkQ01uZ3ZhRGhVTUROTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRSTlJFbDVUbXBKTlZkb1kwNU5ha2w0VFVSRk5FMUVTWHBPYWtrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZoUkhvdlVIcE1iREpNWkVwQ01rVTVUalIxVDFSaU0wbE1OMnBaS3pBeldHVXZOV1FLVTB4aFlsRXpUMlF3V2xVMVIxWlZXRnBZVlhSRU4yMVhXVE51VWxkd1MxUldXSEJPT0V4ek1GUlhWVTVxWlc5c2RHRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU1Y0RnNUNqRkdjR1YzUm1Gd1JrZHlkWHBtT0dWV1NtVlhSVWQzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJocFQwUmFhMDFYVFRSWlYwVTFUMFJSTTAxVVJUUk9lbU41VFdwU2JFOUVVVEZOVkdkNFRYcE5NMDE2WjNoYVIxRXlDazB5V20xTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sM1dVdExkMWxDUWtGSVYyVlJTVVZCWjFJNVFraHpRV1ZSUWpOQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaeXRxY0RoWU9FRkJRVkZFUVVWbmQxSm5TV2hCU21JclVscEZaSGt3VlVwYWFHSjJPRzR4UmxsU1NXUUthWGRIYUZGemJEVlVNWGRVTDFoU1UwZHFRalZCYVVWQk0zQk9LMjAwWVhaQ09IWjJLMVJ3ZDNabVpHNWpOSEozU2xSSVNVc3ZNMG94U0hoMmNHOW1aUXBKUmpCM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGUlFYZGFaMGw0UVUxT1dXRnVWa296TVRsa1VtSklZMXB1YkRWNk5FVnhVRUU1TVdZeldWcFBabnBMQ2sxMlZGRTNPUzltZVV4eFZHbEtTRWxQZVZWR1VtSmFPRzhyT1RjMGQwbDRRVTVaVm5GQlUzTmlNSFpTYjJWV2NUZFNUMDVUUmxsaVdVb3hMMFZKYW1RS09XcFJNRTkyWjBGNlRVRmpUbVJRVEdGeE1tVlNTbFJtVm5CNFlWVlNiMVZzUVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666060024,
          "logIndex": 5320395,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "b86d1c8aa984711877224e845181337381dd63ff",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3270125254",
      "sha": "b86d1c8aa984711877224e845181337381dd63ff"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

