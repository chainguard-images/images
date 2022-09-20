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
| `0.11.2-r3` `latest` | `sha256:238fcbe7fbfad235839cb5abcdb205a2b0ddb5321e3ad2e2250d37d53951c401`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:238fcbe7fbfad235839cb5abcdb205a2b0ddb5321e3ad2e2250d37d53951c401) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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
        "docker-manifest-digest": "sha256:238fcbe7fbfad235839cb5abcdb205a2b0ddb5321e3ad2e2250d37d53951c401"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "554e22be93638e3cfc030f48fe1ac495a7ceb951",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDiPixdTsvBJ5OA+VXupEqupF1bqufnxQhybmxVKHJxjQIgf0pemYxuZ7Y4eg6RdsnRkD8LKlLBbWRSepgT0iY+Upk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5OWE3MTFhMjQxNzA3NWNiNmNhM2E4Mzk0YzdlZGNlZmYxMmY1M2Y4ZTkzMjZiZDUzZDQ1NjBiNjQ5ZjNkYTMxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURQNWFLa3NMVUJGVFlsdU55MkpzUU5SZWJDTks4N2FTNzVaM0xIZlhUTzRRSWhBTHBCSklTUmoxMEhWVHRHSkc2SWdMU2xCTWVpS0hyRUFwanVjOUh1b01ITCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZSRU5EUVhsaFowRjNTVUpCWjBsVlUxbFFjVXRtUVRkNk5VTTNLekExVDA5UWRIQjFTMDlMWW5abmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHZDNUVlJKTkZkb1kwNU5ha2wzVDFSSmQwMVVaM2hOVkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU1VG5CeFduQnVSM2xxTDIxa1ltaENhRXhLUWtSTEt6TlVXV0pLWjJGaGMwWk5lR3dLVkV0UmMxRlROVE5oT1RCV2RFSkZaMjVwZDFGUGR6aHNNa3AxWVZkd1FsZzVjVVp3V1hvdlZqTnplalZZYkd0MVZ6WlBRMEZyVlhkblowcENUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZaVVhBMENsVkNXRmRWWTJka2RXeDZkMFkyTkhvd1oxRmFjemxuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwQldVUldVakJTUVZGSUwwSkdiM2RYU1ZwWFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5ZEhaTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlUwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FWSjNaRmhPYjAxRVdVZERhWE5IUVZGUlFncG5OemgzUVZGTlJVdEVWVEZPUjFWNVRXMUtiRTlVVFRKTmVtaHNUVEpPYlZsNlFYcE5SMWt3VDBkYWJFMVhSbXBPUkdzeFdWUmthbHBYU1RWT1ZFVjNDa2hCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkSloxbExTM2RaUWtKQlIwUjJla0ZDUWxGUlZWa3lhR2dLWVZjMWJtUlhSbmxhUXpGd1lsZEdibHBZVFhaaE1qaDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZE1RbWR2Y2tKblJVVkJaRm8xUVdkUlEwSklNRVZsZDBJMVFVaGpRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSWVFTOW9lVUZCUVVKQlRVRlRSRUpIUVdsRlFUbGlhVGxqTDFKYWFtVmtiMUpDTWsxd1psUnNhMjQwU0M5dVkzb0tWbmt6YlV0cWRHMHdURXN6ZG5sUlEwbFJSRVJaWWxBeGFFaFhUamhETkdGNWJFTjRUbUYySzFoWmRpdEZla1pzYnpjd0sxcEZhV1pxZHpGSk1YcEJTd3BDWjJkeGFHdHFUMUJSVVVSQmQwNXZRVVJDYkVGcVJVRXZTMHhSUmxSS2ExTmxPWGROWW01elRHSm5VSEpETUVsbVdqWkdlSFpUTTJaSEszWkthazlWQ2l0RGRWcFBTMU0xTTJSTE5XcGpLMmhxV1cxYVJ6SlpVRUZxUVdWMGVWUnJVV3gwZVhGSmMwNDBUMkZHV0dWeGIyNXpRVTB5Um5FMWVEWjVZMnAyYmprS1pITjJhMFZUU1ROQ1JGVlBXSEpLYldOb2F5OXlhSFEyUWtWelBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663696907,
          "logIndex": 3620890,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/ko/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092334248",
      "sha": "554e22be93638e3cfc030f48fe1ac495a7ceb951"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

