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
| `0.12.0-r0` `latest` | `sha256:33bea8c5999e76a62f7f3be1dea662f6a7606eee45e72b8c5ff061260ef2e5bc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:33bea8c5999e76a62f7f3be1dea662f6a7606eee45e72b8c5ff061260ef2e5bc) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.11.2-r3` | `sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:93226d747d17e7088140652ee698b488416f594d082b5e047eb20c1d23a65078) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.11.2-r4` | `sha256:2ca08ad880640dfc889a872786674323c0047cdc76fe5afc958ee90659297509`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2ca08ad880640dfc889a872786674323c0047cdc76fe5afc958ee90659297509) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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
        "docker-manifest-digest": "sha256:33bea8c5999e76a62f7f3be1dea662f6a7606eee45e72b8c5ff061260ef2e5bc"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c3d8be9c4253caf57424a8938a591b650a06fb49",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDv+L+0PG3sCTfCunhG9xhMW6zvlPngZf9egy2issibSAiATSCEBrTSLxZ9kaW8+/KX1NLvpLZRegZyEtAFjUELP9w==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiNGZkMzYwZDJhMTA5NWJlNGJjYjc2NDYyMmM2M2UwZGY5NmViOTE1Zjk4ZjQ5N2M5Y2Q2NGNmNjk4MTIyMTgyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQldyV1hCaytSdHBFU0MwNGtLaDYreG1VVkYvZWI1aDdZcWZzRC8wOFZrT0FpRUE3cHFsUWs5ckFvc1JjRWM1T0hPSkpSK1d5amFOV0FqU3JzSlI1bWJVdENRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhseFowRjNTVUpCWjBsVlNIWnpXVGROZVVwcE1VNHJNMnhPUkRGRFVtcFZWVWRUWkU5RmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RGTlJFbDVUMFJGZDFkb1kwNU5ha2w0VFVSSk1VMUVTWHBQUkVWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZPUzFaSlJrSlJhV3cyU1VsTVVEQXZObEpCWlhvemFrcE5TRWxSYkhSdGJIb3JRV0VLYkhkb2REaGlRMkprT0U5YWFreHROalZzYTAxalZubG5RbFpNWjI1QlVGRTJiM3BPU2l0MWJtNXpOSGh0TWpRelpqWlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwVmxwV0NreHhka2xWUm5scWRsaFFUamw1VXpCSGRqWkROVWwzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJocVRUSlJORmx0VlRWWmVsRjVUbFJPYWxsWFdURk9lbEY1VGtkRk5FOVVUVFJaVkZVMVRWZEpNazVVUW1oTlJGcHRDbGxxVVRWTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sM1dVdExkMWxDUWtGSVYyVlJTVVZCWjFJNVFraHpRV1ZSUWpOQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNhRUY2TXk5elVVRkJRVkZFUVVWbmQxSm5TV2hCU2pkTlFua3hZMG81ZW5KbU4yaEhVMVZCVVVJdldXZ0thRWx1YlRKNlVubzNTbkZRWXl0Nk0ySlFTMHBCYVVWQk1XWnFNR3MzUVRGQldHOU9jemNyTm1kSmVGbG9kMEY0ZFZONmIzRlJRMjFFVTFVMVlrMXplUXBUZEZWM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGUlFYZGFaMGw0UVU1YU1XVXpTbVU0YjFCWUt6aFJNREJMV21oQmJIVmtTVTB6ZEVsS1FYZEpSVFp6Q2tSaVpDOXRhbGh2T0c5VU1tWlBUalJNU1c1c1pWTk1Rbmx6Unl0QlVVbDRRVkJzUkVScGREbGlUa2wwVWtWcWFubEVhVzFpZFZrMlVqZ3ZSM0JXVkVFS01sTjJWVFpKY1ZONlQyWm9aMVEyYlZCTlpVdDVTVE50VDNvM2RtRnJVR2Q0ZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666664911,
          "logIndex": 5806257,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "c3d8be9c4253caf57424a8938a591b650a06fb49",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317707322",
      "sha": "c3d8be9c4253caf57424a8938a591b650a06fb49"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

