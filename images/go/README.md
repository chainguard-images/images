# go

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/go/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/go/actions/workflows/release.yaml)

Container image for building Go applications.

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/go:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1` `1.19` `1.19.1` `1.19.1-r0` `latest` | `sha256:b0b729a969cb4ad86b694c12af208a8410eb0c6d8d2ebe25021746ee1184eafe`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b0b729a969cb4ad86b694c12af208a8410eb0c6d8d2ebe25021746ee1184eafe) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.18.4-r2` | `sha256:da4e839a8ab485d9ab3df00a2af1cc32fd580a8de85534792d1e16261dfbf9ba`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:da4e839a8ab485d9ab3df00a2af1cc32fd580a8de85534792d1e16261dfbf9ba) |  |
| `1.18.4` | `sha256:bd5c8dcb24bd85848715673e1eb3e43207a60afc9d57ab7350e0b2b1b3ed6786`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd5c8dcb24bd85848715673e1eb3e43207a60afc9d57ab7350e0b2b1b3ed6786) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.18` `1.18.5` `1.18.5-r0` | `sha256:e65e5a561f2035a8ae8682702a0d9565732c61b874745f4a74c5baa73eb60cc4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e65e5a561f2035a8ae8682702a0d9565732c61b874745f4a74c5baa73eb60cc4) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.19-r0` | `sha256:aa284c7040aadffbff12a55d8a32eb36305f9cc2e77c3010a5e0870bfaa9894c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:aa284c7040aadffbff12a55d8a32eb36305f9cc2e77c3010a5e0870bfaa9894c) |  |
| `1.19.0` | `sha256:3979b72069076e34271c89babd8d785323a247dd70800695b88aa78e5d08a124`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3979b72069076e34271c89babd8d785323a247dd70800695b88aa78e5d08a124) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To build the Go application in [examples/hello/main.go](examples/hello/main.go)
using the host architecture:

```
docker run --rm -v "${PWD}:/work" -w /work/examples/hello \
    -e GOOS="$(go env GOOS)" -e GOARCH="$(go env GOARCH)" \
    distroless.dev/go build -o /work/hello .
```

The example application will be built to `./hello`:
```
$ ./hello
Hello World!
```


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/go:latest | jq
```

Output:
```
Verification for distroless.dev/go:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/go"
      },
      "image": {
        "docker-manifest-digest": "sha256:b0b729a969cb4ad86b694c12af208a8410eb0c6d8d2ebe25021746ee1184eafe"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a82c529878fa8f693de0fe546035c5c42e1b3ebe",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/go",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIEcq6WdU3bV8We5y88Z0O5tQUgOSV2GxFyp8XElRyk24AiEAmjVjMogLWZMdjasHDcA0DfdBGKMLA36vXji6WfR1WcU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5NTQ4YjBjNDdkZmQ3MjgyYWQ0MzQzMTBkYWJmYTdiMmNiNDM1YmQxODhiMjE5OTljNzVjMzE1NTkyMDZlZTk3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNNK1Y4RzV2Z29ZV3YyZVltZ0F6SCtRMlBha29LOTk3RjJTbHY5VTVBM3ZRSWhBS1FzQlQ4K0grSmNpZ21ia0IxS010OGpxL3YydTRSRk5ic1E4R3orenF3QyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNWRU5EUVhoMVowRjNTVUpCWjBsVlEyZzNSV2x0VlZwaFMzSkdVR05NVUZFMVprczVZVWd6YTNsM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTlJFa3dUWHBCTWxkb1kwNU5ha2wzVDFSRk1VMUVTVEZOZWtFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ6VXpkUVNVOUNja2xSWVZaR1Iwd3pOMG94UW14amJWSkVjMFIwVFROblpIVjBTWEFLZFRsTWNYSnBSbUZ1VW1wdmVsTTVRMVJOUkZwSGFYZFZZVzFPT1cwNVREa3ZhMmRySzBjeVRFbEdMekpHZVU5MlQzRlBRMEZxYjNkblowa3lUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5UjJaUkNtc3ZlVXRSWkRsWlNUbEtWVmRDTVc0eU1uUm9iR0ZCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFoUldVUldVakJTUVZGSUwwSkdUWGRWV1ZwUVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTWpoMlRHMWtjR1JIYURGWmFUa3pZak5LY2xwdGVIWmtNMDEyWTIxV2MxcFhSbnBhVXpVMVdWY3hjMUZJU214YWJrMTJZVWRXYUZwSVRYWmlWMFp3Q21KcVFUVkNaMjl5UW1kRlJVRlpUeTlOUVVWQ1FrTjBiMlJJVW5kamVtOTJURE5TZG1FeVZuVk1iVVpxWkVkc2RtSnVUWFZhTW13d1lVaFdhV1JZVG13S1kyMU9kbUp1VW14aWJsRjFXVEk1ZEUxQ1dVZERhWE5IUVZGUlFtYzNPSGRCVVVsRlEwaE9hbUZIVm10a1YzaHNUVVJaUjBOcGMwZEJVVkZDWnpjNGR3cEJVVTFGUzBkRk5FMXRUVEZOYW1zMFRucG9iVmxVYUcxT2FtdDZXa2RWZDFwdFZURk9SRmwzVFhwV2FrNVhUVEJOYlZWNFdXcE9iRmx0VlhkSVFWbExDa3QzV1VKQ1FVZEVkbnBCUWtKQlVVOVJNMHBzV1ZoU2JFbEdTbXhpUjFab1l6SlZkMGQzV1V0TGQxbENRa0ZIUkhaNlFVSkNVVkZPV2tkc2VtUklTbllLWWtkV2VtTjVPVzVpZWtGa1FtZHZja0puUlVWQldVOHZUVUZGUjBKQk9YbGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMmRaYjBkRGFYTkhRVkZSUWdveGJtdERRa0ZKUldaQlVqWkJTR2RCWkdkQlNWbEtUSGRMUmt3dllVVllVakJYYzI1b1NuaEdXbmhwYzBacU0wUlBUa3AwTlhKM2FVSnFXblpqWjBGQkNrRlpUUzlDTUhaRlFVRkJSVUYzUWtoTlJWVkRTVWR0V0dablIzTlVWVlZyWmt4WlMwbG9UVEp5WkZVME5YSnBTalU1YWl0YWJGTlRURFYxYmt4eE56VUtRV2xGUVhkdGFqQm1UMUJ5WTBWUWNYWnRWM0l2T1dsVmEyUldWRWQ0TDBjMlFucGlVamRCWW1wVlFtSldWMnQzUTJkWlNVdHZXa2w2YWpCRlFYZE5SQXBoUVVGM1dsRkplRUZNVkU1MUsyOVRUWGMwVERkbldUUnZha0ZNSzAxaVUwVnRVREZ1UW1sdVZEZHBaVkZqWVRkT1YxZEROR1J0WTJWeFdrOHlaWFk1Q25GUFpVRTJVVGRQT0dkSmQxcFZMME5MZVdkNVkwb3lOME5IVXpWYVdtVnFOMVE1YzNwUFZqUlZhWEV3ZFZKMGRVUmlZbnBvUVdObWJtMU9VR3c1VWprS1QzTXZiakZSTkhOUmEyRlhDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663209809,
          "logIndex": 3504117,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/go/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3057423139",
      "sha": "a82c529878fa8f693de0fe546035c5c42e1b3ebe"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

