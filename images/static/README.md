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
| `latest` | `sha256:07f37d5a18cc49080464f0f854e3400d461dbbccc2c7b96e6d8ead3695b82959`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:07f37d5a18cc49080464f0f854e3400d461dbbccc2c7b96e6d8ead3695b82959) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:07f37d5a18cc49080464f0f854e3400d461dbbccc2c7b96e6d8ead3695b82959"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "248c29c359ff44909876e0fea213aedd0ee3edc2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/static",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFebvj+Oi+uG832qWOaYG1HfP64LC0pOfyUUDguZsFl8AiEA9KnmFYGvsP8VpESOQDFnNKXEfwKc4oqeRF3A94sluVU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5NDg5NzJiNTBmNGJlZDRiYjJhNTcyMjA0YTU5MjI1NTc5YjM1ZjU0MmIzZTU3NmJiNmEzMTc0MTQ4MDQxNWU0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSHdoOFQvUkljK3BvQW9Bb01zWTIxbk1aQUxTUmlMV1JNK3ZIK0pNNnNLQkFpQll0L09VbUlSY1JUMDYyNkFnMjVZZm1LcWhjVkltTm1jK2JrVXhiRDZwa2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwRFowRjNTVUpCWjBsVlUwbDJTMFZNVTJKMFoxUlZkME4xYVVsSGVuSlZSbHA2T1RCSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRSTlJFbDNUMVJCTlZkb1kwNU5ha2w0VFVSQk5FMUVTWGhQVkVFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ5SzBoVVUyaHBkRWh4TVZGVlVXY3JPR1pQVW1Oc2ExZzFkMXBqUld0MVlWZFJWMVlLYnpGWGJWWnhhVXhRZGs1d2RrVkpSVU41VVZsRWVVRnJibkUyT0RGTVZ6ZzRXRzFZU0VKcU1sWnZSSGxvVEd0UlUwdFBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZLT0dOS0NsUnhOVnB6YmtaVVNVa3lVemhVVVZocU9FNHZiM2hKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VGpCWldGSndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFxVVRSWmVrazFXWHBOTVU5WFdtMU9SRkUxVFVSck5FNTZXbXhOUjFwc1dWUkplRTB5Um14YVIxRjNDbHBYVlhwYVYxSnFUV3BCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YcGtSMFl3WVZkTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFNrSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NITkZaVkZDTTBGSVZVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFZEZad09HdDNRVUZDUVUxQlVtcENSVUZwUVZrME5qSjZVelZEUmxkQlNGQUtURVZQUlROM1ZHVm1WVEpPY0hKb2NITnpOR3RFVVZwdlpIbG9Va2RSU1dka1p6aHNjR2xYUnpKUFMxUnRVM1JoWVVFdmRsQlZXblJpVlVkdGN6Ukphd3B2UVZaUFIxQXZOekl3TkhkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVVGQmQxcFJTWGhCUzNKcksydFNUV2x2UVU1UlJVcGhha05CVUZCTGNsVXliMFpKQ21OT2JqUTRkRkJZTkZOTE5IZEZUQzlzVVVjcldFTlZkVnBsUzB0NlJUWTBibmhyWmxCUlNYZEJhMlIzTm5rNU9WZzVSMmMzWm1Sa1EyZEtVVmROYWtzS016ZHpiR2Q0UldVNE9FVjFkblZDWVdaVFNXYzJkVGhxUmpoRVZVSnFXaXRoUmxoWksxQnBWZ290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665194989,
          "logIndex": 4667638,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/static/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/static",
      "githubWorkflowSha": "248c29c359ff44909876e0fea213aedd0ee3edc2",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3208753444",
      "sha": "248c29c359ff44909876e0fea213aedd0ee3edc2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

