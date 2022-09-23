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
| `0.11.2-r3` `latest` | `sha256:15c84146b45dbd11283f9d3020f76a9246c2fd514cd1e50fbdd7aac76f2cfc14`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:15c84146b45dbd11283f9d3020f76a9246c2fd514cd1e50fbdd7aac76f2cfc14) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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
        "docker-manifest-digest": "sha256:15c84146b45dbd11283f9d3020f76a9246c2fd514cd1e50fbdd7aac76f2cfc14"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cc400b05c682e4f4949b25c85bb1a3d37775398c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHrOueUa1CfkK17t4iKqXPPSIn6OXix1awms2muiNxyAAiEAuw6yMiHTZzi/b0miIG8q12xOPXqYnEPCj5oI2gY5HbU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxYzBhOWFjNDYzNGQxNDdhMDYwNTMzNDg0ZTVlMTMyM2NiMzJjNWQ3ZjQ4NjVjMTUzZTMxMTk3ZDVlYjBiZmI2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRmdwd3E4MDNJUkR3cjdPa0Z0Z0NyVzV2R0Z2VnFkaVhFb1BxNTd5UjhHUkFpQjBxaHFWV2dSRzgxR0JDbi9WR1FGa0lheWhnZlRITmt2TnN2b2gzTkpBK0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhscFowRjNTVUpCWjBsVlRIbGtVamhKYW5KM1JuTXpiV1JhU25GRk1tbEZkbnBOWjJaWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFbDVUbFJWZUZkb1kwNU5ha2wzVDFSSmVrMUVTWHBPVkZWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZZUM5dWFFUkhia1JEVTJOcWJrdE9OR2wyTHpFNVFsZzJOa1pyUkdWM1ZtMVVhVklLT1d0dlJrdHVUa2xSZVVoRlYwOWlPVVJXYUdkVFUwOXZlREJxWlZSMVRrUXllRk5QVTFscGVGa3Zha1J0TTFOMmVHRlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRVm1VeENtNWlhRkEwVGtOVU9YSmhlbTVrTDNkQlpuWTNja3RKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJocVdYcFJkMDFIU1hkT1YwMHlUMFJLYkU1SFdUQlBWRkUxV1dwSk1WbDZaekZaYlVsNFdWUk9hMDE2WXpOT2VsVjZDazlVYUdwTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5KUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmtkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREowZGsxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekpuY1Zsb2QwRkJRVkZFUVVWWmQxSkJTV2RHVFM5SlIzTXZRVXgzY201VE1rOXBSMjl1SzNacFV6TUtRVFpWU0RaT1VrMVJibmxTVFZCdGFVZG5UVU5KUjJWalJIZHJiMEZEZDJ4YWFsVkZNMGQwSzBWcE1rWmlObmR0TjNObVkyRnNZMDVRWWxCRFNEVXZSUXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpuUVUxSFZVTk5VVU4wYkM5dFpYVm5SM0pMVGl0bk1XZ3dObTlJU3pCVmJVTkhUa1pWWkVOQ05YVmhibmRuQ2psNEwzaEtSblZYTHpoUmRsUkdWRU5XYlRaWVYxcGtMMDFqVFVOTlFqUTRaVmhYU2k5U1pWTTNNblVyTWpaR2MzcGlVVmx6TkZBd2QwcFFNbVpwVWpJS2NuQTRlR3hWVkRWd1UwbG9RMkZYYVhjM1kwWlpOWE5GVDNVMk5GaFJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663899973,
          "logIndex": 3783265,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3109997035",
      "sha": "cc400b05c682e4f4949b25c85bb1a3d37775398c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

