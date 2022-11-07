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
| `0.12.0-r0` | `sha256:a6b1c0876bf8ed88d9b58141f25ee6aa5199bd1b71d8b14e8a8c660d26e7256c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a6b1c0876bf8ed88d9b58141f25ee6aa5199bd1b71d8b14e8a8c660d26e7256c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
| `0.12.0-r1` `latest` | `sha256:d775c5d10c4df7767e27d6ac577cdbd1222eef2e571974c9e46ca8653b858b02`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d775c5d10c4df7767e27d6ac577cdbd1222eef2e571974c9e46ca8653b858b02) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
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
        "docker-manifest-digest": "sha256:d775c5d10c4df7767e27d6ac577cdbd1222eef2e571974c9e46ca8653b858b02"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "3757cf6b53c86a775d81660be35029022f2d4bbe",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCuf6dLBsDMSeRwnkmJK6V3aJ1lRk3KzwFcDwOkgcvlcQIgQcXECh96Qt5iyDKEUFk6oxo8PKdkXljRQ9zrN8MzalY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0ZWY5OGE4NjI2Y2Q5MTkzMGRkNmU1MjYxNGQ4ZjJjMGNiZWU3MTY3YjdmY2E0YzFmM2ExNjdlMDFhZTZmYWNlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQWVCQWtpWEpnaGF5VkorNDZTV2VLd0s3VUYrTm1wTm53YWdnVmN5NlVRUEFpRUE1c3JuOVl5QnJVWUw0TGREc05aUE9BRUE3SE5sWUN0VGpqdUVRR09VdlR3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhscFowRjNTVUpCWjBsVlRqUk5iRWRXU2xkVk4wTkNaRmcxZFRodlZYY3pXV3BKVHpaemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFVXhUWHBCTkZkb1kwNU5ha2w0VFZSQk0wMUVTWGROZWtFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTVG01MVNsaDNkME5hWjJGQlVtRklSMUV2VUdGaWRVZDNkMHRsUkN0U1EzQnFjR29LY0ZwelEzWnBRMGRCU1VwMFpFUktORFYwVEV4bFJIUm9ObFF2T1VkV1pqSnNkWHBSTWtKMVRVVmhVbE4xTDI5UU1IRlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5ZWxCaENpOUNiek4yUVhSRk4yNWFSVEEyVUdaNE1sTndSa0pGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJkNlRucFZNMWt5V1RKWmFsVjZXWHBuTWxsVVl6Tk9WMUUwVFZSWk1rMUhTbXhOZWxWM1RXcHJkMDFxU20xTmJWRXdDbGx0U214TlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlRqQTVUVWR5UjNoNFJYbFplR3RsU0Vwc2JrNTNTMmxUYkRZMENqTnFlWFF2TkdWTFkyOUJka3RsTms5QlFVRkNhRVV2UzIxV1kwRkJRVkZFUVVWWmQxSkJTV2RrYVRCSFRWUkpXazVVVGxFMFUzSlNZa1JRYUdNeVNHSUtMMEYxVlVJMFUxRXJjR1ZJZVRSM1EyTkZkME5KUm1sUWJWbEVNazFOVVdwdlNEZDNaRzFZTVdOMWFGRlVjbmMwVVM4NVpERjBXa1JTZEdJM2MwTnRPUXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpyUVUxSFdVTk5VVU13UjBVNWRXZ3lVV3BZWlVGNFRFeFZSR3RIWlhGVVQwb3hVV1p5TjJST2JscGlNVEF3Q25CWFZ5dHNaM1JsVmpkTVRtcFBVa1Z1ZVRoT1Qyd3hUazVsWTBOTlVVUk1ibUpDVkhWMWMxTnVkRWhGY21SblJqUlZWRmx5WWtwV2NraGxiMGhtY0V3S2QybzJOMEoyZFVodFJERlpNU3RHU1VOVlZVNDJSMHBQV1dwM0sybE9XVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667786009,
          "logIndex": 6652188,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "3757cf6b53c86a775d81660be35029022f2d4bbe",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3406959242",
      "sha": "3757cf6b53c86a775d81660be35029022f2d4bbe"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

