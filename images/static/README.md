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
| `latest` | `sha256:15e433b8374c1bfbe3049fca2cec1ba828e185159dda8884f999c146c09f8698`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:15e433b8374c1bfbe3049fca2cec1ba828e185159dda8884f999c146c09f8698) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:15e433b8374c1bfbe3049fca2cec1ba828e185159dda8884f999c146c09f8698"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "53492de1e1e5351fa05fffa530cf7874a6212946",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/static",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIGmRRicZGA1r/ehgjs0A8Mw++cfMrlZmqDDSUt6rAKOUAiB06Dln/j1IVGqbDB/jr0k1FRZcnAnUCmJUDVBLPH4TvA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyMjc3NTJkNGI0ZDJlYmNmZmRmZjk1MTE3OGUyMDllN2Y1YzE2NjY4YTE2YmNiZDQxNWIzNTcyMTNmM2E5MmJkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNWYjk2MXpvai91SllwV1JtQmc3ditrWFZxNHVBRTVPR0JJRTVsd3pyVEhnSWhBTkY2VGExR1hudGIxVDMwNmNTeVhaOEdhNHZPL0RPbmpkejJIaGxlVGZKQiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhreVowRjNTVUpCWjBsVlZYSkljVTEyVTNOVlkyVjRaaTlHTms5elZWbEJhRXhWZDNSM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlZHTXhUbXBGZUZkb1kwNU5ha2w0VFZSQk5VMVVaM2RPYWtWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZuVERobWJYazRjWGRYUTB0NlUwaDFjRGhPVm1scksyOXpZalZZTjJ0blVIVjFhM2tLTmtoV2NYaHhZVUZVTHpSRVpsTlZZbUptY0U1SE0zZE9VbXRLVTBGNk0wc3JjMWhEVlc5NmF6RkliVkpxTUZCd1JIRlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUzTWpKQ0NpdFNOSEZXT0c5TFRUQm1Na3N2Y2taS2FWcFZXa1ozZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VGpCWldGSndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRGWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSUldOSVZucGhSRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJjeFRYcFJOVTF0VW14TlYxVjRXbFJWZWs1VVJtMVpWRUV4V20xYWJWbFVWWHBOUjA1dFRucG5NMDVIUlRKTmFrVjVDazlVVVRKTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5aUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUjBkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZURE5PTUZsWVVuQlpla0ZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVtUnBVVTlSUVVGQlJVRjNRa2hOUlZWRFNVSkxlRGRIYUhoRUwybFZWRGxaVEhaWVR5OEtlRFZRVWtkQlltOVhVbUZrYUc5ck0yVTVVV1F4ZDNoTFFXbEZRUzgzWnpFeWN6ZFpkR051UVRsQ2EybEZZWEpwVEUxVFdrZFRXblkyV1U0elVFSnpSQXBzVFdaUVUyNTNkME5uV1VsTGIxcEplbW93UlVGM1RVUmhRVUYzV2xGSmVFRk5ZamRXTDNWQ2IyVlBWbW81Y2xsTk5tbEdZV3hXUjNoalJsUkRkVGRSQ21VM1lqWmpja2hwT1ZodWVHOTNSWHByUVhkUEwybzFRVTF4Tm5oR1pWRjNURkZKZDFWWVVuZE9kemRFWVZGMU5FWkdTa2RTZG5jdmFtRnZka1ZrUWxNS1lYTkVlaXRqY0ZoSlYwRXZjaXR6VWtNeWVXYzBMMGRCUVRBMVZFVXdjMlpyYkVkaENpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668016597,
          "logIndex": 6790903,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/static/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/static",
      "githubWorkflowSha": "53492de1e1e5351fa05fffa530cf7874a6212946",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3430573942",
      "sha": "53492de1e1e5351fa05fffa530cf7874a6212946"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

