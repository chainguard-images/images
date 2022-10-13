# gcc-musl

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/gcc-musl/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/gcc-musl/actions/workflows/release.yaml)

Minimal container image for building C applications (which do not require glibc).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gcc-musl:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `12.2.1_git20220924-r2` `latest` | `sha256:7f9de88dbef484b8ec59a17a2681637d24502f0d836e229b55749e1f4705bcc3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7f9de88dbef484b8ec59a17a2681637d24502f0d836e229b55749e1f4705bcc3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To build the C application in [examples/hello/main.c](examples/hello/main.c):

```
$ docker run --rm -v "${PWD}:/work" cgr.dev/chainguard/gcc-musl examples/hello/main.c -o hello
```

This will write a Linux binary to `./hello`. If you're on Linux and have the musl library, you
should be able to run it directly. Otherwise you can run it in a container e.g:

```
$ docker run --rm -v "$PWD/hello:/hello" cgr.dev/chainguard/musl-dynamic /hello
Hello World!
```

We can also do this all in a multi-stage Dockerfile e.g:

```Dockerfile
FROM cgr.dev/chainguard/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc hello.c -o hello

FROM cgr.dev/chainguard/musl-dynamic

COPY --from=build /work/hello /hello
CMD ["/hello"]
```

And we can also compile statically to be used in environments without musl:


```Dockerfile
FROM cgr.dev/chainguard/gcc-musl as build

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
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/gcc-musl:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/gcc-musl:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/gcc-musl"
      },
      "image": {
        "docker-manifest-digest": "sha256:7f9de88dbef484b8ec59a17a2681637d24502f0d836e229b55749e1f4705bcc3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "68ee1d03912652da7ae3d2d2eefcfcd39c0dd652",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCmK51PUn45+UrnGjvim/bYXzjPSlNbJpcivbHuq38VOQIgSPbuSPnr5+lQt7KC3l3ap8gOSWCigREIAlGD5wufEKg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxNGM3NDFmMGU1ODg3MTA1MzVkZTIyNTI3ZmE5NzJlNjgwNjcwNTRmOThmZGI3M2VlZTJkNjk0ODk4YWY0Zjc4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUM1Q2kwQmdoUVdiSUJQSGVnY1BmOUdUR3B3NEVWeU1TcnQxT2x0dVpORVlRSWhBSTNIT05yWGpCTTAyZGFNTGZMLzhTMUxGZER1elFhNGt2MlhhK0Jzb204SyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlRWVXpTMkpuTUd4aWNUUnpTV2R4TXpkV1JIbHRNVlp4YXpGbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRjVUbXBWTkZkb1kwNU5ha2w0VFVSRmVrMXFRWHBPYWxVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6TVc5VlV5OXJjQzlvT0VkclVIa3JXR2t6VkZSVmJUbFlhbXc1YTA5NVNsTnNZa2dLYjFsamFqVm9Na3RvYmtrd1VYbHJWRWRHVjBVNFkwcHlNRFpXUldzeWFuaE1lakZWUldwSUwxQm5ZMVEwZEZkRVluRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZEZVhSTENtMTJXa1JLVlhRdldVMVZSMDVaYWpGeWFtOUhPVFl3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGVFFtZHZja0puUlVWQldVOHZUVUZGUTBKQlVuZGtXRTV2VFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUlpORnBYVlhoYVJFRjZUMVJGZVU1cVZYbGFSMFV6V1ZkVmVscEVTbXROYlZac1dtMU9iVmt5VVhwUFYwMTNDbHBIVVRKT1ZFbDNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDB0QldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUllWa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZGxveVRtcE1WekV4WXpKM2QwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFTUhka1lsTm5RVUZDUVUxQlVucENSa0ZwUlVFMlprbFRSSEptZVRnelZ6WUtjelZ1U1ZKWFF6bElXRU42UzJrMlNWRkVNakJOZUVoQk0wcHZWVkpqUVVOSlNGbGlaSGRMWkRjMk1IWlNTVmQ2Ym1WMVVrdERSbEJ0TkZacVVIVnZTd3BuVjNoM2FERldiaXQ2UzJoTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OVVVOUmFGUlhkWGgxYmtOcmFUTjZSREl6ZVZkTVQzaENiRkJrQ25salJsTTBkbWhzZHpndlVuRXZWVXBFWkM4MVJFdEtlSGhHVlVsRmRVMTJSbU5SZUdsWVJVTk5SVXhYVjNSRFdVUlNVekZpVEU5U1VpOTZjV3BuVEZnS1lrRk5VR3B3Y1VoVllsQnVLemw2YkVVd1ZWUlNiWGRpT0haSVltbzNSVTlLVnpndk0yVTVjV1JSUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665692838,
          "logIndex": 5049560,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-musl",
      "githubWorkflowSha": "68ee1d03912652da7ae3d2d2eefcfcd39c0dd652",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245451220",
      "sha": "68ee1d03912652da7ae3d2d2eefcfcd39c0dd652"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

