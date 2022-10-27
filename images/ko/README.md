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
| `0.12.0-r0` `latest` | `sha256:0f5c610c8f1dc60c7bbeb5b05b7b701cd46ee18107f02ff1466611180feeb778`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0f5c610c8f1dc60c7bbeb5b05b7b701cd46ee18107f02ff1466611180feeb778) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |
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
        "docker-manifest-digest": "sha256:0f5c610c8f1dc60c7bbeb5b05b7b701cd46ee18107f02ff1466611180feeb778"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "58fd0d663c746220b109dee63c00a55f30376d65",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCeWGwUf6u7MZt7wxEnE+cnsp+F5dTgEGBXDAlAaFV8aAIhALx1t+N7SZk3erQ1zLF/11jC8fQRokiTohDV6P2tR+qg",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1NjQ0MzYzNmI1OGQxZTQ4YTc2ZWUyZjU3MzJkYjcyMWJlYjdlNzlhOThmZWUxOTAwNzU4MTAwYzg2MmJkZDNlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQysrbGVId25nUVBIWnhYUlA4T05NSTdpdUE1MFpUQnlHeHQvVzZqek4rVUFpQXY3KzlrZktjbmNnQVdpNldZZkVmc2hweG1ya1RLb25BcTNXQVE2QVBEaFE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhsdFowRjNTVUpCWjBsVldWcHBTVWgxWWtoTGMwaFZkbmRMWVVWRWNYTjNWWEUxUmtVd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1ROTlJFbDRUMFJGZWxkb1kwNU5ha2w0VFVSSk0wMUVTWGxQUkVWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ2VldkclUzTTRVbXRGVEVGWFN6SXdVeTh6VG1jeFduSXZjbVkyVVhWQ1lsRlJWaklLZEd0TGFUVmljSEJJV1hCbGJGVkxZVVJ3YjBjNU0yVlNLMGRTY0V4TWJHMXRRblY2WTJ0Wk4ydG5SMFZVVkV4S2RUWlBRMEZyWjNkblowcEZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY0WlVKdENuWmtiRmx0UmxoMFNXUlNia2x6TmtoeFIxUnhZV0pyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJjeFQwZGFhMDFIVVRKT2FrNXFUbnBSTWsxcVNYZFpha1YzVDFkU2JGcFVXWHBaZWtGM1dWUlZNVnBxVFhkTmVtTXlDbHBFV1RGTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sbldVdExkMWxDUWtGSVYyVlJTVVZCWjFJNFFraHZRV1ZCUWpKQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNhRUpqTjI1SFJVRkJRVkZFUVVWamQxSlJTV2hCVG5sNGVVSjRVR05rV25KV1dUQXlNM2d3TjA5dFMxTUtWalpyZHpWRlYyeHNTM3BXV1V4RmVVTXhXWEJCYVVJMWNFUTVSVmd4VVRCd05VZFRhRTF1TjBZelNXaERaRTVTVkZsT1RrOVRZVkprZFZKRFJHVjZNZ3BsZWtGTFFtZG5jV2hyYWs5UVVWRkVRWGRPYjBGRVFteEJha1ZCYVU5aWNDOUJWelkwY0RSRVlrcFZaRWgxYzJ4dU9XUlhXVEJoVlZSR1NsSTNhVTR2Q2xoSkwyVnRhWFJQWXpkT05XdHlNMWh0T0hGNFUwZzRNRWMwWWpKQmFrSm5ibXhRVG5SdWRURlJMMUZqUlZZemJrVXJNbEJ2Wm5aU2JtWmtTbWdyVXpnS2RrcFZOek12ZFhwRU1YTTBiakFyTkd0TVIwSjFSQ3R2TVZScVZFZFJaejBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666837114,
          "logIndex": 5949113,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/ko",
      "githubWorkflowSha": "58fd0d663c746220b109dee63c00a55f30376d65",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3333921011",
      "sha": "58fd0d663c746220b109dee63c00a55f30376d65"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

