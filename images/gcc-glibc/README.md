# gcc-glibc

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/gcc-glibc/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/gcc-glibc/actions/workflows/release.yaml)

Minimal container image for building C applications (which require glibc).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gcc-glibc:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:ecf40834089e0239e549f41ad3f3987395cef53f6f27924840765c78bf4ad983`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ecf40834089e0239e549f41ad3f3987395cef53f6f27924840765c78bf4ad983) | `amd64` |


## Usage

To build the C application in [examples/hello/main.c](examples/hello/main.c):

```
$ docker run --rm -v "${PWD}:/work" cgr.dev/chainguard/gcc-glibc examples/hello/main.c -o hello
```

This will write a Linux binary to `./hello`. If you're on Linux and have the glibc library, you
should be able to run it directly. Otherwise you can run it in a container e.g:

```
$ docker run --rm -v "$PWD/hello:/hello" --platform linux/amd64 cgr.dev/chainguard/glibc-dynamic /hello
Hello World!
```

Note: only `linux/amd64` is uspported at the moment.

We can also do this all in a multi-stage Dockerfile e.g:

```Dockerfile
FROM cgr.dev/chainguard/gcc-glibc as build

COPY hello.c /work/hello.c
RUN cc hello.c -o hello

FROM cgr.dev/chainguard/glibc-dynamic

COPY --from=build /work/hello /hello
CMD ["/hello"]
```

And we can also compile statically to be used in environments without glibc:


```Dockerfile
FROM cgr.dev/chainguard/gcc-glibc as build

COPY hello.c /work/hello.c
RUN cc --static hello.c -o hello

FROM cgr.dev/chainguard/static

COPY --from=build /work/hello /hello
CMD ["/hello"]
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/gcc-glibc:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/gcc-glibc:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/gcc-glibc"
      },
      "image": {
        "docker-manifest-digest": "sha256:ecf40834089e0239e549f41ad3f3987395cef53f6f27924840765c78bf4ad983"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d131e59e82c4c9cac7d62c4e4a3d92121419ea00",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCsDdCFgVqhEEB/w5rEcPQxA2UUbKf2VtBf25VXz+Zy+AIhAM5oTiHVur0B82O42Cmq/hYN0cpSgY5JVKxjhqUr72qP",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2NWI5ZGY2YzIxOTdjY2I3NDU1MDYwYzRlNzUwNTAwNzJjM2ZlZGE2YzQyNzk0Y2ZkNzhiNjk5YjczMDFmM2E3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNVZ08zbW1kTU1ZcDFUbFREMXk1UVQ2SDdzUXo5RmN2KzN0WHBod0dCRld3SWdKdHd6QkZIcmt1ODFFVjhqbllEaGlMdlZMc3ljUGlzdlhRQUZTemRqNjR3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwbFowRjNTVUpCWjBsVlkweHdiSFl4Wkc1WVFrZDJWRTkwUmxrM09HVm9jRzluTUVGQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RWTlJFbDNUbFJKZUZkb1kwNU5ha2w0VFVSSk5VMUVTWGhPVkVsNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZPWjBnemRVMHlNVmRuZFdWT0sxVjBORWgwV25GV1EzQk1hREp6YjNJeFMxVk5NRllLVW1aSmVGWlBjRFZUVjBnMWIxbHplbTVUY1RCaGEwWXpha1JZWkRsbE9XcHNSRTR3Um1oV1VXdHVhbmRIWm05YVJ6WlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZU0dsS0NuQlNjMXBHU0U0NFlUZHdhVUZFYm1Sb2NUWXlVM0pOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5YVJFVjZUVmRWTVU5WFZUUk5iVTB3V1hwc2FsbFhUVE5hUkZsNVdYcFNiRTVIUlhwYVJHdDVDazFVU1hoT1JFVTFXbGRGZDAxRVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFZKV0hsTmVWRkJRVUpCVFVGU2VrSkdRV2xDZGtsNFlrc0tTekpyTW1ZeU5tWjNia2RZS3paaGQzZHRhVTFrZW1aM1YxaERZVk0xVm1WYWMxTTJVRUZKYUVGTVVIVjVjblpvUVZOVk5WTkRSV3hNTkRkRGQxVXpVQW80Y1ZoMlMyZDZUVE5ZUm5seGJIWXdiMkYxYlUxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1OQlRVZFJRMDFIY21OVFJEQXJXbU5VVEZKNWMzTnBNM05NQ2toTWNtcFlLMHh4ZWt0Q00xTlVibTUxVTBOQmRsUkdlRzEwWnpBMVQwNW5Ua0ZQZVhscFRqTmpXU3RKVGtGSmQxcDBXSGhsUXpWRVYzZExabVUyY21VS1NqTjZRbFZZVkhGaGMybGtjRTV0WjNBcmVGWTJjazl4TkRReFEwaFFhWFJ1TVVKdVpHOVVOWE5MVUVOWE1FbGFDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667009124,
          "logIndex": 6076430,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "d131e59e82c4c9cac7d62c4e4a3d92121419ea00",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3349661417",
      "sha": "d131e59e82c4c9cac7d62c4e4a3d92121419ea00"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

