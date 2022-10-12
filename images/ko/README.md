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
| `0.11.2-r4` `latest` | `sha256:f2a35014e41c8dd1df867660950d584c03a6f35ec0da387fdebe1b7b1a2ccf98`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f2a35014e41c8dd1df867660950d584c03a6f35ec0da387fdebe1b7b1a2ccf98) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
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
        "docker-manifest-digest": "sha256:f2a35014e41c8dd1df867660950d584c03a6f35ec0da387fdebe1b7b1a2ccf98"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "425ffef0526e3dc34ab73c664d6ff6b0b1dd7de0",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHs9woDm4h2A4vNcfi1XbqhJuUn7TeCde3N3Y2jMuxtmAiBvgKFmBDGc3GVN/qCZKlU2teTszyL3DEHuxjPI078tuQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5MDhhMDUyYzY1YzFjOWY4MWJlYWY2ZDdkMjQ4NTRhY2Q0NTQxNGFhMzc1NjI0Yjk0MDNlNTEwNTQ5YmVmMDdmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNZMWtKVWFha1pxSHVETmJMd2lKTW9mdjV2bDRTUzdvTzFDTkcvampLOUNnSWdKT3VGYWM0YW1OVE0rSnlQUEdVUGRtdkRwbVNWYXo1L3BmWFRmdHUwbERVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhscFowRjNTVUpCWjBsVlZUZENSelV4Y1d0emIzTXZWU3N5S3pneVFtaEdSRmRsUnpoTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlJFa3dUbFJCTUZkb1kwNU5ha2w0VFVSRmVVMUVTVEZPVkVFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU0ZG1sM1FpOHpZM1ZFZW0xMU9UQkZNbGswVG5FelFVZzBjelYxYVhwcVdrRmxVMU1LYUVaRGNtUlpiRTVXYlZNM1lUSmpkbW9yV2xVMFVVRjNja3RJYTFSYWVtTkpRa2hqY21nclpuaERSVlpwY0hFM1RHRlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1UjNjMkNuSXdhMWRvZUhoMlVIWjVUR1pGY0hCWE5VMXFjVmRyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJjd1RXcFdiVnB0Vm0xTlJGVjVUbTFWZWxwSFRYcE9SMFpwVG5wT2FrNXFXVEJhUkZwdFdtcGFhVTFIU1hoYVIxRXpDbHBIVlhkTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaemh2VlhwWWQwRkJRVkZFUVVWWmQxSkJTV2RtWm1SdVRUVTRiME5OWjNWNmJtdHRUelpqWmxKVVZpOEtOVGxRWVVreFNteHRWVmR4VGtaU1ZEUm1PRU5KUkdNMlIzUkVWVEp2TkZKQ1NEVnlhbE5yTm5sSVpqaG1NSGhrUVZoYVpVeEhZV0ZPWjFBcmFFVnVRd3BOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpuUVUxSFZVTk5VVVJCZFU4dmRGVnFVSGxtTDFFeEwwaDJPWEV6WkRKT2JWbzNlVWhKUzAxSk1qSmxiek4wQ25aeVlUUk5TakZQYWpkNFMzcHdabE5zVWxncksxQmxaVWRuT0VOTlJqQkplWHBSZWt0Mk1ETmpWSFozUlUxUlEyaDRXREZZTUUxeFdtRkVTblZwT0ZrS2QzVjNZMjFrUjJsSGNFTXlVMnhpVTBwaFIwMTJTWGh4ZUdFellXZG5QVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665542721,
          "logIndex": 4934968,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "425ffef0526e3dc34ab73c664d6ff6b0b1dd7de0",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3231580669",
      "sha": "425ffef0526e3dc34ab73c664d6ff6b0b1dd7de0"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

