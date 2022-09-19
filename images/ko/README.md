# ko

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/ko/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/ko/actions/workflows/release.yaml)

This is an image that contains ko, go, and build-base.<br/><br/>This image is designed for use in situations where you would like to use `ko` with codebases that have C dependencies where `cgo` must be used. In these cases, staticly linking against musl instead of glibc results in smaller binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/ko:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `0.11.2-r3` `latest` | `sha256:a222a59d140c656fa25e4e407cb7ce634ed335838fd52308f7f6635e604ad93a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a222a59d140c656fa25e4e407cb7ce634ed335838fd52308f7f6635e604ad93a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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

All distroless images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-reference": "ghcr.io/distroless/ko"
      },
      "image": {
        "docker-manifest-digest": "sha256:a222a59d140c656fa25e4e407cb7ce634ed335838fd52308f7f6635e604ad93a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "26faa9ed3a6b012152ea27f1f66e46de476d6c88",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQClOKTAqw9bTJrPIaTCgIz7R3UtAn0oN19XNZXMh13fnAIgWZeQi/QJ7KUjV4f5VWjzSA0I3Mc9Wz6lFSa8i657SbY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1ZThlZjA0OWEyNGY3MTk3MWJiMTllNjM0NWFkZDBlOWU0ZDNiOTRiYjk1ZDRkZDEzNWMyYTQ3YTllNzljZjgwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRzZ3NzVTTkM4d0daODFrZGN2VktSNFRCZUpQRjBhMkZ4S1VPN0hLYlhMcUFpRUFvNGptVWRBN1laWFlyVk1mQ2VyODBtd0pBVGgrWm51OEdwajhzY3NsS1FnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNWRU5EUVhoMVowRjNTVUpCWjBsVlkydDBVbTRyTURoSFlXRnNiVXhMYzJGRVJuUXlaVTVqWVVOUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlJFbDVUbnBWTVZkb1kwNU5ha2wzVDFSRk5VMUVTWHBPZWxVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyUVhGNGFIUTBSMEZqZFdKTGFHWXpSM0JpVTJFdmVuZGpNR1Y0TjA0eVRsQlpjMlFLWlN0ek1rOVZWR2RPWW1oa05uUm1WRmxUYWpsU2VtTm5jaXMyV1RoRFFrNUVZa2xPUzFOVlJUWllPRWw1VkZaa2RYRlBRMEZxYjNkblowa3lUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZpV1RKSUNsRkpWMHRCVW5oQ2QyaFNVelptZFVsWFExbG5jRlE0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFoUldVUldVakJTUVZGSUwwSkdUWGRWV1ZwUVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoTWpoMlRHMWtjR1JIYURGWmFUa3pZak5LY2xwdGVIWmtNMDEyWTIxV2MxcFhSbnBhVXpVMVdWY3hjMUZJU214YWJrMTJZVWRXYUZwSVRYWmlWMFp3Q21KcVFUVkNaMjl5UW1kRlJVRlpUeTlOUVVWQ1FrTjBiMlJJVW5kamVtOTJURE5TZG1FeVZuVk1iVVpxWkVkc2RtSnVUWFZhTW13d1lVaFdhV1JZVG13S1kyMU9kbUp1VW14aWJsRjFXVEk1ZEUxQ1dVZERhWE5IUVZGUlFtYzNPSGRCVVVsRlEwaE9hbUZIVm10a1YzaHNUVVJaUjBOcGMwZEJVVkZDWnpjNGR3cEJVVTFGUzBSSk1scHRSbWhQVjFaclRUSkZNbGxxUVhoTmFrVXhUVzFXYUUxcVpHMU5WMWt5VG0xVk1FNXRVbXhPUkdNeVdrUmFhazlFWjNkSVFWbExDa3QzV1VKQ1FVZEVkbnBCUWtKQlVVOVJNMHBzV1ZoU2JFbEdTbXhpUjFab1l6SlZkMGQzV1V0TGQxbENRa0ZIUkhaNlFVSkNVVkZPV2tkc2VtUklTbllLWWtkV2VtTjVPWEppZWtGa1FtZHZja0puUlVWQldVOHZUVUZGUjBKQk9YbGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMmRaYjBkRGFYTkhRVkZSUWdveGJtdERRa0ZKUldaQlVqWkJTR2RCWkdkQlNWbEtUSGRMUmt3dllVVllVakJYYzI1b1NuaEdXbmhwYzBacU0wUlBUa3AwTlhKM2FVSnFXblpqWjBGQkNrRlpUbFJyZEdOa1FVRkJSVUYzUWtoTlJWVkRTVUZVSzB4RVRuTm5aRFUzYTB4a2JXbFdla2QzYkRaVGRtUmFXbUprVUhSd1ZXb3ZlbVFyY1dob1ZrSUtRV2xGUVRaRVFTc3dkbE5RV1VKNmExSnhXVGxaZHpKRVdWQnJUWHBRSzNGcVJIVlNjWFU0TlRjeGFDdG5jR2QzUTJkWlNVdHZXa2w2YWpCRlFYZE5SQXBoUVVGM1dsRkpkMHBDY2pKRVdFd3hiRWRFTUROSldtTnVUVWhCY2pjNVYyRktaa2wzVWs0M09FZFZTemhEY2pKT01XWm9ZamxOZGpoa2JWQXhiVGhLQ21WclkzRXJXbU5XUVdwRlFYSnRRV0ozWjJsalR6UjNkbVZxYVU4NE5VVnlWelpJTTNOd1MwNHJNM1I1UlZkbE5scGhlblJOYXpscWEwRnpTSFZRTjFVS09FbG5RemRUV2xFd1RGRkJDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663554492,
          "logIndex": 3531462,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/ko/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3079540410",
      "sha": "26faa9ed3a6b012152ea27f1f66e46de476d6c88"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

