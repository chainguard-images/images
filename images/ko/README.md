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
| `0.11.2-r4` `latest` | `sha256:9b5b97e6ff8c6dac1a9d1bbb00be7ebd2497a0d66bbf0fd8fc45fc69bbda578d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9b5b97e6ff8c6dac1a9d1bbb00be7ebd2497a0d66bbf0fd8fc45fc69bbda578d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
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
        "docker-manifest-digest": "sha256:9b5b97e6ff8c6dac1a9d1bbb00be7ebd2497a0d66bbf0fd8fc45fc69bbda578d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f07a8b7aae8daa4a0224a842caa01ed731c67d72",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCVlFKhVRHVo1CwI7rVnZj/oKYpezKQaYYuqkDmtiYV9AIgVLiofiPQKEGuTYG/RnBAd4R4TjvwMqYPvjB/Tax2HU8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5YjRiMWFjY2FhYThjZGZlMjI4OTQ5MzAwYjNlMTg4NmI0ODI3NzNlOTIzMzQ4OTRlNzJmOGFkYjIyNjE1NzA0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRjg2TXhncXYwc2ZrTDhDVWl2UjBtZlFLdFFEbXNudnhoRFR1QnF6bklsL0FpQUFqM3YzaFZNOWNJUVBCQ2xrK3pWVkRKN3VyWnlMM0xSNDhHWGRmWm1pYlE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZWRU5EUVhscFowRjNTVUpCWjBsVlZWZHBibmhzZDFwamVtNHpUM1ZEYzA5RVJrcGhSRmxKY2sxWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRCTlJFbDZUWHBWZDFkb1kwNU5ha2w0VFVSRk1FMUVTVEJOZWxWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU1ZFhWQldVaDFZMjh6ZUdzeGRFcE9ha3RNVld4eVlrNDVORUpIYWpSRk9EVnZaWGNLYTJkd05saEdTVTVqY2psS1ZGQkZaR0l5YjFSSlVsTTRZbXMwZUN0emNFbG5NalV5VG05SVNUbG9SVkZVUWpVNE1UWlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ2UlM5MENrSjJLelJTVTI1bllYY3JkVUZxZFdSVVRFTkNaR3RWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJodFRVUmthRTlIU1ROWlYwWnNUMGRTYUZsVVVtaE5SRWw1VGtkRk5FNUVTbXBaVjBWM1RWZFdhMDU2VFhoWmVsa3pDbHBFWTNsTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaemxTV0ZCWE9FRkJRVkZFUVVWWmQxSkJTV2RUZG5CeEsxbzVTM293VmtkdmJrbG5Va3RpUVVSdk0wc0tkRko2WWtOQmNIRnBaV05MVTI1cVNWcHJiME5KUnpVeFprRmtPVzluWWpCME0ySTNTRzVEZW1Wc1VtVTBSbGxXTjBkd2NVNUVLMVJHSzNWRlZVRm1iQXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpqUVUxSFVVTk5TRnBTZGpSb00xWnhXRlZxVmtWaVRYVXJlRnBwVGxCalpYVlBUMDEzTURVclRtbFlTelZsQ200MVZGTk9Ra0ZFTDJoVlVVTnRPVFZpTnpaa1JVeENUM2RuU1hkWEszVlllVFU1ZVhZd1oySnFWRzR3VmpONlIwWmFOU3QxTVZSUlprVmtPVXMwWkVZS2JIQnhZamxxT0hsVlFWaEphSEppWTNFNFJVa3pUMFl3YUVOSWVRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1665714851,
          "logIndex": 5066188,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "f07a8b7aae8daa4a0224a842caa01ed731c67d72",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3247033057",
      "sha": "f07a8b7aae8daa4a0224a842caa01ed731c67d72"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

