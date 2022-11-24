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
| `migration-20221118` | `sha256:1ac1322f372531b00d40847e6219ad4ec862b0b271432166451d2df2277c8569`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1ac1322f372531b00d40847e6219ad4ec862b0b271432166451d2df2277c8569) | `amd64` |
| `migration` `migration-20221124` | `sha256:f676ea8cd16f94da3c569717153dfd1691e4ccbbb3fd44c3775819950e96db5b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f676ea8cd16f94da3c569717153dfd1691e4ccbbb3fd44c3775819950e96db5b) | `amd64` |
| `migration-20221119` | `sha256:0b4da3de84ff51aaf88c6a95d8d29c56af475514e42c92efdfd3cb2d075fb050`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0b4da3de84ff51aaf88c6a95d8d29c56af475514e42c92efdfd3cb2d075fb050) | `amd64` |
| `migration-20221120` | `sha256:867702b83a83390361b5246e1fdfcd932865dcb0b115aea56618e91130fa8ca3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:867702b83a83390361b5246e1fdfcd932865dcb0b115aea56618e91130fa8ca3) | `amd64` |
| `migration-20221121` | `sha256:354a1aebf04c61e4515ff9d76bdfc6ac55bee1a3c097233526d585098a0ea3c9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:354a1aebf04c61e4515ff9d76bdfc6ac55bee1a3c097233526d585098a0ea3c9) | `amd64` |
| `migration-20221122` | `sha256:d5ea3015b3c2f03e50808ac83b445e05e2762d429ab6d3832ee84ba7dc063a2a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d5ea3015b3c2f03e50808ac83b445e05e2762d429ab6d3832ee84ba7dc063a2a) | `amd64` |
| `migration-20221123` | `sha256:d66c14b131e54a759651e88d1fd1fc1dd0139eef407d57b9b065346abefc80cc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d66c14b131e54a759651e88d1fd1fc1dd0139eef407d57b9b065346abefc80cc) | `amd64` |
| `latest` | `sha256:d624beaae60b10ec342896b1470421eb473549cb3ac3bf1c6ec074d8b460b4fc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d624beaae60b10ec342896b1470421eb473549cb3ac3bf1c6ec074d8b460b4fc) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:d624beaae60b10ec342896b1470421eb473549cb3ac3bf1c6ec074d8b460b4fc"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a2ed7d64a1721db220962043e98b279dc9270f70",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/static",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHumMt2bPJvY7Cg76h90h6AL+7sRg7BdPSwtr9+7SaFzAiEA4+D+X+qpRgcETNjsH3JDXcMh6ha34jz98Je3Ht4jw5Y=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyMDU5MThkODg5MzNlYmU0MTAxMzAzYWMzMzU3ZGMzNWMwNjA5YmI3MTllNWUyZmY1MTA4M2ZmZjk0NGRmZDczIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNXREFhYTFZbTdadndhK2xqV2FxQ0xYZ2tYTitjMTlRV2psNkQ2bnpEckNnSWdBZGZXWXF5RUZRVTMxRWVLN2tDdlNUb2QrYVFsSDRmcWZmNTY0YzN5M21NPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVlYyZG9jMHhUYVM5c1JqVkRka3N4U2tvMU1YUllka0ZWYUc5cmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVU1RCTlJFRjVUbFJWTWxkb1kwNU5ha2w0VFZSSk1FMUVRWHBPVkZVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZWYlRFNFQwRk5iMGhhTDBONFZrcERPRU1yY0RJclN5dEplVTExY25Fd1VFWjVSbFVLZG5jMEsyZFpjMUIwVEVZMFptbGlaRlJKVGxSU05XZ3JLMnhqZG00MFdtVjVWaTlGV1hJeVpGTktVWEp5YjBsQ1NHRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlVyZW1KaENsRjNkVVJKYm5JMVZscEdZMUpwTVhoWmNEZ3ZWVk5OZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VGpCWldGSndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMWxVU214YVJHUnJUbXBTYUUxVVkzbE5WMUpwVFdwSmQwOVVXWGxOUkZGNldsUnJORmxxU1ROUFYxSnFDazlVU1ROTlIxa3pUVVJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YcGtSMFl3WVZkTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGY0hkaVpWUjNRVUZDUVUxQlUwUkNSMEZwUlVFM2FucFNjbVp4Ym5WcVFrTUtPRXBLYjJGSllrNXZkWEJRZUZCbGMzaEZNbWhhVGswMk5WQm5VWEZoVFVOSlVVTk5OMk5JYW1aaVRUTkNXbEZTTDJ4WVZVWlpkVTVETTFkTGVGZGpiQXBsU1ZwU1lUZG9ibGh1VmtOUGFrRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtKTlVYZzJWVVptVjJsellWQmpaVmRNVTBVMWJrMTRlR1pMQ2tNdmExWTVPRXBNVVRZck5DdGtXQ3MzZDBvMUsxVmhTVWQxTDNsblJuRjNWWGR5UW0xTU1FTk5SbUZWY1hOWFdVdFZjRlpqTVhOM1NIQTVVemR4WVc4S2NuQTFVM2xDWVZwTlEweHlVM3BGUVd4a2JURlRMM1ZhVmxwdE9IcDJjM0JVU0hoa1JFTkJjSEpCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1669249588,
          "logIndex": 7723051,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/static/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/static",
      "githubWorkflowSha": "a2ed7d64a1721db220962043e98b279dc9270f70",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3536666482",
      "sha": "a2ed7d64a1721db220962043e98b279dc9270f70"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

