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
| `latest` | `sha256:19efdedc103133ff88ea3ec75d000d3cf83e012bbcfe6a43883e64d4feaa44fd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:19efdedc103133ff88ea3ec75d000d3cf83e012bbcfe6a43883e64d4feaa44fd) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:19efdedc103133ff88ea3ec75d000d3cf83e012bbcfe6a43883e64d4feaa44fd"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "c7bd209c45b7ca1212f7cce900025b4759a786c8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/static",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGxkD4wOWZ2+SfAFeXuEytEpBQkkjNBf9P+Pg/PuHK+FAiEAsvLP1oRIXLhjy43L0U6kOFmsgGs/QkMWJ6XuGEtF4mQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2ZmFiNWJkZjU1ZGVkNzI1NmVlNzk1ZWEwNmI2MzQyOGE0ZDM0MmY3ZWUxYTliZDc0MDlmNWM0Y2RmNmZiYmUzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUMybEhxc3p0U0N6eU5GMlBGbXZ1MzFobkxHZEVxN2RBdFdCWG1qcVY1aWNnSWdBZG1CVytrTjNFemhYQ1IxR1NCVjl2SnVZVGlYV3VzSitQaHlJeDhqK1dNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlZHY3dNR0prYjNsVWVtNXdRVmc1Ukc5UmJtMVZMMWRIZFVsbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTmFrVjRUWHBCZWxkb1kwNU5ha2w0VFVSRmVVMXFSWGxOZWtGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV5TURkM1VXSmpRaTlPUkROSmNERnlOU3QwT1hkdlRXOVVOek5wY0hkNVJUTTNSVmNLVTJaMWJXSnlieko0YmtaQ1l6VkRNbVEzUTA5cFRHSlZXbUZWT1dFNU9XcHRZVGhFYVN0RFYyODNjRzQ1VjNKRFZEWlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZLWTJWYUNqUlFVVmxXT1RSaWIxQlFUV3R3YlRCRFZqRjBhMmd3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VGpCWldGSndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRGWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSUldOSVZucGhSRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJocVRqSkthMDFxUVRWWmVsRXhXV3BrYWxsVVJYbE5WRXB0VGpKT2FscFVhM2ROUkVGNVRsZEpNRTU2VlRWWlZHTTBDazV0VFRSTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5aUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUjBkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZURE5PTUZsWVVuQlpla0ZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XV3RIUTJselIwRlJVVUl4Ym10RFFrRkpSV1YzVWpWQlNHTkJaRkZCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlVFOURla2QxUVVGQlJVRjNRa2ROUlZGRFNVUk1ibkZHY1ZSVE1uZFVhRk5zTVVoSVpWRUtOV1pCVEVGb2VVZHVlRFYyV1VkNGJHVTVkUzl1VFRCUlFXbEJSazVOWlV4aVNGaEJTMDQ1YmprM2JFaEphaXN4V0dWM1JHdHBRMU0yU0VkTk9IcHhLd3BQYjBwcU5FUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFYUktNR2R6ZFZsbk5Xc3lNekpRVGtsT05rOXpNV3RFY0c4elptcHpjbkpUQ25kNlpHSlZTWFJhUlhCSmFrRllTSFo2Y1ZGSmFUVXZVVGQ1UVhjemNrNXZRV3BCV0dKUVdsaE1RM2x5VEdoek4yVk5PWGhKV25NMVR6WnhialV4WTBnS1ptTkxibFZFZDI1RlJHWmxPSEZuU3l0emRYWTJiRE4wTUZZM2IwY3pSemRZY2swOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665609203,
          "logIndex": 4985830,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/static/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/static",
      "githubWorkflowSha": "c7bd209c45b7ca1212f7cce900025b4759a786c8",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3237932376",
      "sha": "c7bd209c45b7ca1212f7cce900025b4759a786c8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

