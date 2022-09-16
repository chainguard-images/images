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
| `0.11.2-r3` `latest` | `sha256:2b2201f745b2032e37496b274942dcdf80dc03962ddf7144ae30b7f22f1341c3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2b2201f745b2032e37496b274942dcdf80dc03962ddf7144ae30b7f22f1341c3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


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
        "docker-manifest-digest": "sha256:2b2201f745b2032e37496b274942dcdf80dc03962ddf7144ae30b7f22f1341c3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "51a65be320f2803f5f5a6a020dfc9f92a8951238",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCD5y/PgoY6A+sd9RtcsjGVPmkyjFjnlyqcVkUU++JXYAIgHA+33XaUzL0rTO9dbFKsrim8PlRfswAwlxU1JOwHHjQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjMTQ4ZDgyN2RlNmMzZGE2ODA0MjBkOWJiNTA0ZGI3YTYzOGViYzM5NGEyZDkwYTc3YmZmNDU2YzBjMTFkNzg3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURvRmhKQWw2SEdiaUlOSGt4d1pMa3JDR1gvR3k0aFVsQUdadkFKQXpPYzVnSWhBSkE1NXhrSFBvN3VWTVJvMnRGMGx6RitNN01HYlNLRS80R3R4bVBpQVJRVyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNWRU5EUVhoMVowRjNTVUpCWjBsVldIZEhhR2hsVFc5TVRrMXNVbEZKU1dwa1V6QTNOMkZPZVN0cmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlJFbDVUMVJCTTFkb1kwNU5ha2wzVDFSRk1rMUVTWHBQVkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV3YWpGME1HdFFlR3RKTmtSdlVFNVBhamxWVm5kc1dVbG1VVkZaVlhKamFtVjBjbVlLVW1aNU0yZExOM1pPVlc1bVVFVllOMkpKU1hoU09WSm9OMmQxZDFwTVlXbE1MMWhQZVZKS00waHZjMlZCUkRaTWMzRlBRMEZxYjNkblowa3lUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ1Y2pkVENtaFVXRkJIZG1KT1IyeDNWbVpST0ZveFNrcDFhRTluZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFoUldVUldVakJTUVZGSUwwSkdUWGRWV1ZwUVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoTWpoMlRHMWtjR1JIYURGWmFUa3pZak5LY2xwdGVIWmtNMDEyWTIxV2MxcFhSbnBhVXpVMVdWY3hjMUZJU214YWJrMTJZVWRXYUZwSVRYWmlWMFp3Q21KcVFUVkNaMjl5UW1kRlJVRlpUeTlOUVVWQ1FrTjBiMlJJVW5kamVtOTJURE5TZG1FeVZuVk1iVVpxWkVkc2RtSnVUWFZhTW13d1lVaFdhV1JZVG13S1kyMU9kbUp1VW14aWJsRjFXVEk1ZEUxQ1dVZERhWE5IUVZGUlFtYzNPSGRCVVVsRlEwaE9hbUZIVm10a1YzaHNUVVJaUjBOcGMwZEJVVkZDWnpjNGR3cEJVVTFGUzBSVmVGbFVXVEZaYlZWNlRXcENiVTFxWjNkTk1sa3hXbXBXYUU1dFJYZE5ha0pyV20xTk5WcHFhM2xaVkdjMVRsUkZlVTE2WjNkSVFWbExDa3QzV1VKQ1FVZEVkbnBCUWtKQlVVOVJNMHBzV1ZoU2JFbEdTbXhpUjFab1l6SlZkMGQzV1V0TGQxbENRa0ZIUkhaNlFVSkNVVkZPV2tkc2VtUklTbllLWWtkV2VtTjVPWEppZWtGa1FtZHZja0puUlVWQldVOHZUVUZGUjBKQk9YbGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMmRaYjBkRGFYTkhRVkZSUWdveGJtdERRa0ZKUldaQlVqWkJTR2RCWkdkQlNWbEtUSGRMUmt3dllVVllVakJYYzI1b1NuaEdXbmhwYzBacU0wUlBUa3AwTlhKM2FVSnFXblpqWjBGQkNrRlpUa1ZKVG5WbFFVRkJSVUYzUWtoTlJWVkRTVkZEUWtndlNGVjFiMkZSZFRKTlVFeGlSblpVYXl0eVUyRkdPRXQyYlhwNVozRjVSV05OZVdJdmJUQUtiVkZKWjA1V05qTndkMGd2Ykc5MFVYbDZVMGhZVTBNdmVrVXpWSEZ3YTFoUFRHTklOVTB2VmpSVk5HSjVVRlYzUTJkWlNVdHZXa2w2YWpCRlFYZE5SQXBoUVVGM1dsRkpkMVZwS3pGcFdsZFplRTFtTjNwTWNuVjJaSGR1U1d4MFRWQjNXa2R2T0ZKQmVuVmpVM2cyVjFsTFpVeFBTbkZ5WVVWamFEUnJWM1paQ2pkU1ptZERkemhzUVdwRlFUUjNXRXRXVkRWUFVESXJaVk52VXk4MU0wVnFTRXRUV2tSeVFURkxSRkp4ZUdGQlFVNU9UbGxyU1c5M1RuSnRNRVZVYnpBS1ZteEhjbkZzY21OaksxVnhDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663295363,
          "logIndex": 3512478,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/ko/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3065001709",
      "sha": "51a65be320f2803f5f5a6a020dfc9f92a8951238"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

