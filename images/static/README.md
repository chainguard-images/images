# static

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/static/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/static/actions/workflows/release.yaml)

Base image with just enough files to run static binaries!<br/><br/>This image is meant to be used as a base image only, and is otherwise useless.  It contains the `alpine-baselayout-data` package from Alpine, which is just a set of data files needed to support glibc and musl static binaries at runtime.<br/><br/>This image can be used with `ko build`, `docker`, etc, but is only suitable for running static binaries, such as with `go build` with `CGO_ENABLED=0`.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/static:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:f3c59f6f175ee9a9f4fec46a24c86a41b10abdc900a74f823e0c9ece19089afc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f3c59f6f175ee9a9f4fec46a24c86a41b10abdc900a74f823e0c9ece19089afc) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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

## Users

The image has a single user `nonroot` with uid `65532`, belonging to gid `65532`.


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
        "docker-manifest-digest": "sha256:f3c59f6f175ee9a9f4fec46a24c86a41b10abdc900a74f823e0c9ece19089afc"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "3a6536e1ab7fa2f748ba2b14068ad1d0370bbc0d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/static",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEIBhZkicuSB+qz1kDm7DnzVTmrLKV6pVNU5CkGK8Ln5AiBCmZxeIYsH489eESyN08hPKPjKcuAx9hDRcf1myCuqPg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5NzRhMzhkZTcyZGQzZjhhZTVjNGY2ZDJmYzUwZWI5ZmIxNDQyMDRhNGMwOTk3N2ZkMTI1YjJjOWZiYmU1YzUxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR1M5c2NGZHc1YlVGMnJqS0Z6eU41bDltN3BsTGJCN2llcks1ODBMNndackFpRUF6ZFNvWHdyM3Y3MVI1T1hEeXc2bk05RmlyTGZxRUE4ZFR1V3gwYW9OS3JNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwSFowRjNTVUpCWjBsVlR6UklSRnBoUmk5UU5VY3hZbUpVVVhGbFNGUTJVME5xTmtOSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRCTlJFbDNUVlJCZVZkb1kwNU5ha2w0VFZSRk1FMUVTWGhOVkVGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6WTJSU01tOWxORFZQVVRFclNuVk9aazU2Um1OTUt6RjNiVVJLUjJZME1WVjJTRWdLTTJaQldFbzNZWG80YkhScGNXaFFaV3h1WW5sVE16SndNRXA0VkZkRVEwb3lUak0wV0ZoVWEzTlRWME0yT1ZWaWJuRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU1WjBFekNpOVhSbXhyTWpWa1lsSXJVU3RNVkhOc01tMUpjMXBSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VGpCWldGSndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDB5UlRKT1ZFMHlXbFJHYUZscVpHMVpWRXB0VG5wUk5GbHRSWGxaYWtVd1RVUlpORmxYVVhoYVJFRjZDazU2UW1sWmJVMTNXa1JCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YcGtSMFl3WVZkTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGWXprMVdYSlJRVUZDUVUxQlVucENSa0ZwUVhwdlVFaGtPSFJ6TUZCYVpUTUtkRGRTUTBSM1dIUm9VamxOY0ZwTWNEQlZVVFJ3VGt0MFZsWXhablJSU1doQlRIUnBRVWhKUkhGa1lXaENUbmh4V1RSTlltTjZZWFpUVGtkVGJ6TndZd3BIY1dKR1RWWkVhWFpNTmxCTlFXOUhRME54UjFOTk5EbENRVTFFUVRKclFVMUhXVU5OVVVSWVZVSm1ZazVDTW5SaVYwSTNaVE5MUjAwNGJsQkhUbGhYQ2pOVE1FZFlTVlJIYms1dFdUZE1hM2xHVm0xNk5EQXpjbE16VVZodmVVZE9hbk12Y0daSVJVTk5VVU4wWWtVMmNVWlVaeXRKTldSNWRFeFlaMnB2WnpNS1pGRk5iMHQ2TUd0cWRtSnFVV0kxWVdOSVNtb3JaMmd5YzBocVJFWlNTa3B3Y1c5cFVHZHhTM3BJT0QwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668391295,
          "logIndex": 7024774,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/static/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/static",
      "githubWorkflowSha": "3a6536e1ab7fa2f748ba2b14068ad1d0370bbc0d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3457944391",
      "sha": "3a6536e1ab7fa2f748ba2b14068ad1d0370bbc0d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

