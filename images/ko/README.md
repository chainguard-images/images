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
| `0.12.0-r1` `latest` | `sha256:22d41e415559b66136dd419e319df52d2c60d2e029e5bedfc055454bfaf8be7a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:22d41e415559b66136dd419e319df52d2c60d2e029e5bedfc055454bfaf8be7a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.11.2-r3` | `sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.11.2-r4` | `sha256:2ca08ad880640dfc889a872786674323c0047cdc76fe5afc958ee90659297509`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2ca08ad880640dfc889a872786674323c0047cdc76fe5afc958ee90659297509) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.12.0-r0` | `sha256:a6b1c0876bf8ed88d9b58141f25ee6aa5199bd1b71d8b14e8a8c660d26e7256c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a6b1c0876bf8ed88d9b58141f25ee6aa5199bd1b71d8b14e8a8c660d26e7256c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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
        "docker-manifest-digest": "sha256:22d41e415559b66136dd419e319df52d2c60d2e029e5bedfc055454bfaf8be7a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "3c1a906bf52f12018ebe10f7b0e4d0bf94e84cc9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDHPJpwKOOakr3cMg61MPcwPTnkIVTw1TKGL9Q9XM6ZeAIgCUUOgIMCvtPFeu1rOszwBXyhDT6Q7MStMallqVULC1A=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyYzE0ZDdjZGMzYTQ0YmYwN2NiOTM3NDZkNmU4OTZhNzI0MGZlZDY3MGNmYmE4NzUzM2RmNmZmZmM2MjgzMWUwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNKMzA1ZTI1Zm1pakNxVlB0VWxFUDFXVXkyQ3JFcmJiVTdQT25DbzRxYldnSWdYaURQL0dPYkxXd3ZUV2JBYVVJdXAzNHJ3bXIrRExxdXNDcnFVRWs3U25nPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhsdFowRjNTVUpCWjBsVllrRkJiVlFyUlRNelJ6WnVZbmx0ZFVkUWFHTkpTRVZ0Ym05SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRGTlJFVXdUMFJKTlZkb1kwNU5ha2w0VFZSRk1VMUVSVEZQUkVrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1ZERaSVQxbHVSekJTTldWS09TOXNXVUV2ZFZGWFFsSktRMHBZT0d0alZUWkZiM0FLTlc5QlVVWlNlRE5VTlVaTUszUldSRFpvV0VoMk4xbG5PR056ZUhVdlRqVjJZWE5yYzFwS2JFczNNMXB1Y1dablNEWlBRMEZyWjNkblowcEZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGTWpoMENrRkdhVlIzY25sbVkzWnFVbGRMVEU1M1RFaEhPVk5SZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJkNldYcEdhRTlVUVRKWmJWa3hUVzFaZUUxcVFYaFBSMVpwV2xSRmQxcHFaR2xOUjFVd1drUkNhVnBxYXpCYVZHY3dDbGt5VFRWTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sbldVdExkMWxDUWtGSVYyVlJTVVZCWjFJNFFraHZRV1ZCUWpKQlRqQTVUVWR5UjNoNFJYbFplR3RsU0Vwc2JrNTNTMmxUYkRZMENqTnFlWFF2TkdWTFkyOUJka3RsTms5QlFVRkNhRWhxTlU0ME5FRkJRVkZFUVVWamQxSlJTV2hCVUdKRGJWWTBabU5tZVRBMWFsZEhSR1JDZGt0dWVqRUtaWFJQWXpWdFJDOUVPR2x3TVhnMWRURnRRVXhCYVVKa1VFNTFkekZyT1dsa1YxaE1jSFZ5TDFCWmR5dERhMGszUVdzMFNIYzRhelJwVnl0RmFFcEhRZ281VkVGTFFtZG5jV2hyYWs5UVVWRkVRWGRPYjBGRVFteEJha0l4YlhsU1VGTktkV2Q2UjFsM1ZuQjFabFYxWlRGV1JIVlRiRTFZZEVadmR5OWhNa2xzQ210aVJVcDRVbXRXU1VOQ1dYRXpRVEEyTlRGTU5WcG9OWE0xUlVOTlVVUXJUblZyTUdKYUszbEZWemc0UVVkSksxYzRlalEyVkM5V1dVdFBhVEpZVkZjS1pGRnViRzQyYTBGRmNXNW5ORVZhY0ZKMmJXOVNUa2Q0UlhBNGQwbFpPRDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1668476927,
          "logIndex": 7095639,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "3c1a906bf52f12018ebe10f7b0e4d0bf94e84cc9",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3466714691",
      "sha": "3c1a906bf52f12018ebe10f7b0e4d0bf94e84cc9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

