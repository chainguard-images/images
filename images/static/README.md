# static

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/static/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/static/actions/workflows/release.yaml)

Base image with just enough files to run static binaries!<br/><br/>This image is meant to be used as a base image only, and is otherwise useless.  It contains the `alpine-baselayout-data` package from Alpine, which is just a set of data files needed to support glibc and musl static binaries at runtime.<br/><br/>This image can be used with `ko build`, `docker`, etc, but is only suitable for running static binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/static:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:bc4d594556627d08e5382c0a9fd39e4cda28b2d49b8adcba503270e77a213945`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bc4d594556627d08e5382c0a9fd39e4cda28b2d49b8adcba503270e77a213945) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage


Here's an example Dockerfile that builds a Rust static binary
and puts it into the static image:

```Dockerfile
FROM --platform=x86_64 rust:alpine as build

RUN rustup target add x86_64-unknown-linux-musl
RUN echo 'fn main() { println!("Hello"); }' > hello.rs
RUN rustc --target x86_64-unknown-linux-musl hello.rs

FROM cgr.dev/chainguard/static:latest

COPY --from=build /hello /hello
CMD ["/hello"]
```
To build and run it:

```bash
$ docker build -t rusty-cgr --file examples/Dockerfile.rust .
...
$ docker run rusty-cgr
Hello
```

Note the size!

```bash
$ docker images rusty-cgr
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
rusty-cgr       latest    aff4c01fd4f0   6 minutes ago   6.09MB
```
And a C static binary:

```Dockerfile
# syntax=docker/dockerfile:1.4
FROM gcc:latest as build

COPY <<EOF /hello.c
#include <stdio.h>
int main() { printf("Hello!"); }
EOF
RUN cc -static /hello.c -o /hello

FROM cgr.dev/chainguard/static:latest

COPY --from=build /hello /hello
CMD ["/hello"]
```

To build and run it:

```bash
$ docker build -t c-cgr -f examples/Dockerfile.c .
...
$ docker run c-cgr
Hello!
```

It's even smaller:

```bash
$ docker images c-cgr
REPOSITORY   TAG       IMAGE ID       CREATED              SIZE
c-cgr        latest    f3648380711c   About a minute ago   2.88MB
```

For Go programs, we recommend using [ko](https://github.com/google/ko) and setting
the `defaultBaseImage` to `cgr.dev/chainguard/static`.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/static:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/static:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/static"
      },
      "image": {
        "docker-manifest-digest": "sha256:bc4d594556627d08e5382c0a9fd39e4cda28b2d49b8adcba503270e77a213945"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b323437fb0a43c76aed8d44d3f2cecf877273182",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/static",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCr0PeDVbIfJbS41xR5Tr3m+4jOuqi16U7eAC8UdV2KpgIgW0elz4pkfcBcGuIkO7FegLGoy5EAhwtu319kQ2b+I0Y=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhYzE5ZmVkYzc1NjQ3OGNlMDM2NzJkNDcyODljMjQ4YTQ5NzUyNTVkOWQyMDI3NTc5MjM0ZmQyNjBmMzYwOTljIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQnpLbzhCMzVLRkZqUUpKYjlreXR5VUd1U25zMEE5Y21OT1J4NkdVQW95U0FpRUFuUVRBdFM1YVVwZGlmOTFTMEEyMXNCM2pERlRhdFh1ZGZTcHV0OGlmbXZ3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlFsRXlRVU5ZUTJndlkyMTVTMlJMV1dscFkweElSVTE2UVhSRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlJFa3dUVlJOZWxkb1kwNU5ha2w0VFVSRmVVMUVTVEZOVkUxNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY1TUV0emEwVm9WRk5NUkcwNFJWbHNRalIyYjJKS1dua3lUaXMzWTBKYVUxVnRRemNLUVhGS2Mzb3ZaRkF4Ulc1RGJHb3paMWxsVG1keVdWZFlkRVJYU0hOSE1tSXdXVTk0VFdrclJVeEZNbmhHU2toRE1tRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTVTNCeENuRnhVbnBJVFZCQ1RsbGxTRmhYU1cxMFQwVnZaMFJOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VGpCWldGSndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMWxxVFhsTmVsRjZUakphYVUxSFJUQk5NazB6VG0xR2JGcEVhR3RPUkZKclRUSlplVmt5Vm1wYWFtY3pDazU2U1ROTmVrVTBUV3BCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YcGtSMFl3WVZkTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFZVdoSFZHOVJRVUZDUVUxQlVucENSa0ZwUlVGNFdEYzVWbloyZGxSblQxa0tTMFVyVFZWQloxTmhaRmRGSzFwT01TdDVWekV6YlZWclVuSm1PRzF0U1VOSlNIUkxXaXRWVFVoSE56TndSbWh2YjNGeloxQTNhRzFrSzNOb1JUTm5Md3BqWVV0S1VIZExlbmR6V0hGTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OVVVOdGVtSnNja2M1WnpnMU5YWkthRzB4YzBwVFNuWlNPSEZNQ2tWVlJDdHhOMnQwVGt0SlRraFJORGRzVWpKUFRVeGFURWhrTUdkVlVXOUNTMUJWZFRGUU1FTk5Ra05TWlZKbFFVWTFWVEo2VkZoc2JESnlTRmhtZVU0S01tUTVTbmdyYW5CTmREVjVRVzE0TjFaR1EycEJabWRTV0d4dGRtaHFWVmR1VUVvME5IUlJjMkpCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665542512,
          "logIndex": 4934785,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/static/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/static",
      "githubWorkflowSha": "b323437fb0a43c76aed8d44d3f2cecf877273182",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3231638556",
      "sha": "b323437fb0a43c76aed8d44d3f2cecf877273182"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

