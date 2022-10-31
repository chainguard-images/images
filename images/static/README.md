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
| `latest` | `sha256:f62521b319caef384dfa7fa42109549f81a188e2ef8d3b27e351c76334725723`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f62521b319caef384dfa7fa42109549f81a188e2ef8d3b27e351c76334725723) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:f62521b319caef384dfa7fa42109549f81a188e2ef8d3b27e351c76334725723"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "97b852b4c00b30cf8264b85bd9c51ce2a4772fa6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/static",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCD9HFuJE5wNXE92ePoZfXqC8NRVjGxS+seljyjw1QZ8AIgGE6XhB9OAZg4QxoYEbYdBCrDUPqrcIEVEwwIDF394+M=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNzg5YWVjZGY5OWIzZmU5NzM3YzM2ZTk2MzBhODdhY2Q4OTVlMDllNjA4NTE2MTg0NGY0NDkwZmQxZjllZTZlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ0dybkxTMGdJcXpMUjI1SVM4YTloOVU1dlJzaXNydG9HOVN2c0h4REt5VkFpRUE1bXNTWGpzYkwzQnlGNzRJT2NkY1FIemVtVDc2eUJlUGttN3NYOXZKdmlFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwSFowRjNTVUpCWjBsVlMxZ3ZUVFp1Tmtkc1VVODRXRUowUkZoRVFWRnhURWh6V1cxdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTlJFbDVUMVJWZVZkb1kwNU5ha2w0VFVSTmVFMUVTWHBQVkZWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyYjBFeFZGcDNZVk53YWpjdk1EWnZaMHh2WldOVVpXWkxNamhxTkhKblJtVkVjazBLZG1sSGMwTmxWemhaTlRCT05VSkRSMnBNVWxZd1FWcFJUa0p4VjAwMEszWkdZV1kyY1hnd05WWk1kbU5zWVZoVFowdFBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1Wm5rM0NtdE9lbTlrWVdkTFNWWk5NVmRCYTNNeGRIZzBkak5aZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VGpCWldGSndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDlVWkdsUFJGVjVXV3BTYWsxRVFtbE5la0pxV21wbmVVNXFVbWxQUkZacFdrUnNhazVVUm1wYVZFcG9DazVFWXpOTmJWcG9UbXBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YcGtSMFl3WVZkTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRGU3prck0zbDNRVUZDUVUxQlVucENSa0ZwUVRrMVpUUnNiMm81Vm1WRWEwd0tUSG8wU0VzM2RrVmpiVFJXUlRkb1oyVjNXWHBFWTFCdFltWnNVWGxSU1doQlRTdHFUbE5NWWtWT2FrSlFNVGRhT0U5aVExcFdUa0puVG5KSWNVWnNVUW96YTNWa1RFd3ZUMDFxZG1WTlFXOUhRME54UjFOTk5EbENRVTFFUVRKclFVMUhXVU5OVVVSYWRGcEpRVlZUWjJWUVowOVFhemxrYkc0eVJUWTVSMGN2Q25CaVdrRXlhblZCU2xOYVlYSldiakZUYkROWGNqQXJXRWxxTmpkclRtNWxTVmM0Ym1WemIwTk5VVU15TmtoYVlqWTFWVEZoZW1WMllWZHJhek13VmxFS01YQjBUMjAxVkZGME0xRkJWMkZGZEdkMFNVbFJlVkExZVdkTGMydDNNWEJFTWpWdVZHOWphSGRvZHowS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667183411,
          "logIndex": 6194070,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/static/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/static",
      "githubWorkflowSha": "97b852b4c00b30cf8264b85bd9c51ce2a4772fa6",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3358124174",
      "sha": "97b852b4c00b30cf8264b85bd9c51ce2a4772fa6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

