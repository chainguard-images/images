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
| `0.11.2-r4` `latest` | `sha256:7ebb582139f6afea9c3253ba0b528dccfe7d29b1212f223c66b19fff920b5573`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7ebb582139f6afea9c3253ba0b528dccfe7d29b1212f223c66b19fff920b5573) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.11.2-r3` | `sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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
        "docker-manifest-digest": "sha256:7ebb582139f6afea9c3253ba0b528dccfe7d29b1212f223c66b19fff920b5573"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "12ebc736fd32bc2d29c47a4d77cbf88f23475e5f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFumwMm1L1cI2VWsaGgl4AgDY+BM2l2qh6Kd4+txy8lGAiB0W735iZYNkfWneW5fqpZtVOCRwvgDVCBillNAmNS4Hg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3YTVmYzM4MWJjMTFiYzA2NmI1OTM2MzY2MzhhNjU4N2E5ZTY4Y2MyMDMwYzQxNTg5YzI2MDAxZjliMTgyZDJmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUM4R0tmS0wycmFNWlg5bzd5eG5iTDVUci9yZW8rVWFhQkRCVVVxRGsxUW1BSWdXUFhFNlJkQjRXeFJNMzYrMk9uSGdWcW5OM1M1a0toZlYyMFRjWnpoM0ZZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlJIbFpRbGRpTjFaR1FUVlBWa0ZuVEZSMFFYUnpaVEUzVjNNNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFbDRUbnBOTWxkb1kwNU5ha2w0VFVSRmVrMUVTWGxPZWsweVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUY2xweFpXRjZlbXN6ZFhkcFQybHdVVmRwZW5kUmRUbG9Ta2h5Y2pGblNqSkdOU3NLV1VrMFZXUTNWSFJzWWtSbEwyeHpPRlZNZFhOclZtZzVlVVV5VURJeFYzazNRbUpHTTNWd2MzUlhURlZ3Um5SU1ZtRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNTmxSSENrNUJZVFJXU25acWRVcHNLM1o2YzFwcWJHTlJRMlZGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJkNFRXMVdhVmw2WTNwT2JWcHJUWHBLYVZsNlNtdE5hbXhxVGtSa2FFNUhVVE5PTWs1cFdtcG5ORnBxU1hwT1JHTXhDbHBVVm0xTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sM1dVdExkMWxDUWtGSVYyVlJTVVZCWjFJNVFraHpRV1ZSUWpOQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaemc0YVVFeVZVRkJRVkZFUVVWbmQxSm5TV2hCVDJKTFNHcElNa3BRZGl0c1FqTk9aVEIyVEVKdlRqWUtURFp4VEZaQ1NVUjRWVlZLTWtRNFZVd3dlbGRCYVVWQk5sRTFaWEJFU0hOd2FXMXFabTFvZWtST1lTc3lLMDV0ZDBSR2FFNHhUR2hVYVZwSk0wcHZTZ3BsTWxsM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWwzU0hkSVNIWTFPVGM1Y1ZoUFJrbHNNa3BLV1VFeVUydDJXRGNyVkd0NFpUUnhOVFJEQ25VdlEwZGtja1puTTNsS04yRlBXWFUxVFRSSlRXOXFNak41ZDI5QmFrVkJhM2w2VlUxcFVGVlpZekE0VWxsdmFGRlVSMFppZVRoR2RFMUVkWGRqWkhBS1dGTlNVRTlHVTJwb1NsbGhRV2RvY1d4emVrWlBUWGgyUVVsV1IzZG1ValFLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665627491,
          "logIndex": 4999162,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "12ebc736fd32bc2d29c47a4d77cbf88f23475e5f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3239198961",
      "sha": "12ebc736fd32bc2d29c47a4d77cbf88f23475e5f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

