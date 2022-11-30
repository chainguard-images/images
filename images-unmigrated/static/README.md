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
| `migration-20221119` | `sha256:0b4da3de84ff51aaf88c6a95d8d29c56af475514e42c92efdfd3cb2d075fb050`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0b4da3de84ff51aaf88c6a95d8d29c56af475514e42c92efdfd3cb2d075fb050) | `amd64` |
| `migration-20221121` | `sha256:354a1aebf04c61e4515ff9d76bdfc6ac55bee1a3c097233526d585098a0ea3c9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:354a1aebf04c61e4515ff9d76bdfc6ac55bee1a3c097233526d585098a0ea3c9) | `amd64` |
| `migration-20221123` | `sha256:d66c14b131e54a759651e88d1fd1fc1dd0139eef407d57b9b065346abefc80cc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d66c14b131e54a759651e88d1fd1fc1dd0139eef407d57b9b065346abefc80cc) | `amd64` |
| `migration-20221127` | `sha256:4896035b8a10778331ee638b04fb1228076fc2be5b1a49f649a1f5a7fe6883ec`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4896035b8a10778331ee638b04fb1228076fc2be5b1a49f649a1f5a7fe6883ec) | `amd64` |
| `migration-20221128` | `sha256:ede9dd1943566d9009ff24bcde5e3c968775b5d3c3ec66ad991ae681e87f9055`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ede9dd1943566d9009ff24bcde5e3c968775b5d3c3ec66ad991ae681e87f9055) | `amd64` |
| `latest` | `sha256:c6cbd5dbfee400a6d19341b6e0bf97f643e0f78d1ec50e5060920f427d2ff4d0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c6cbd5dbfee400a6d19341b6e0bf97f643e0f78d1ec50e5060920f427d2ff4d0) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-20221124` | `sha256:f676ea8cd16f94da3c569717153dfd1691e4ccbbb3fd44c3775819950e96db5b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f676ea8cd16f94da3c569717153dfd1691e4ccbbb3fd44c3775819950e96db5b) | `amd64` |
| `migration-20221126` | `sha256:883f179b66f97cb6b541a2135e1a4a11b289444192375abb9e7ea6db6e4a15b3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:883f179b66f97cb6b541a2135e1a4a11b289444192375abb9e7ea6db6e4a15b3) | `amd64` |
| `migration-20221129` | `sha256:c57d4c0b8053de0c64258d9647194fdaa912440f25fc769fbf0413015780dbbc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c57d4c0b8053de0c64258d9647194fdaa912440f25fc769fbf0413015780dbbc) | `amd64` |
| `migration-20221118` | `sha256:1ac1322f372531b00d40847e6219ad4ec862b0b271432166451d2df2277c8569`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1ac1322f372531b00d40847e6219ad4ec862b0b271432166451d2df2277c8569) | `amd64` |
| `migration-20221125` | `sha256:ee02fb5083e8db0066c8711ab24d6a2115d223e4375a42d2822743751b840042`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ee02fb5083e8db0066c8711ab24d6a2115d223e4375a42d2822743751b840042) | `amd64` |
| `migration` `migration-20221130` | `sha256:8aaa05585cd20e24e4bdf13850714e28ef8ab0ceacf794110c0b81ad3f397fab`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8aaa05585cd20e24e4bdf13850714e28ef8ab0ceacf794110c0b81ad3f397fab) | `amd64` |
| `migration-20221120` | `sha256:867702b83a83390361b5246e1fdfcd932865dcb0b115aea56618e91130fa8ca3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:867702b83a83390361b5246e1fdfcd932865dcb0b115aea56618e91130fa8ca3) | `amd64` |
| `migration-20221122` | `sha256:d5ea3015b3c2f03e50808ac83b445e05e2762d429ab6d3832ee84ba7dc063a2a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d5ea3015b3c2f03e50808ac83b445e05e2762d429ab6d3832ee84ba7dc063a2a) | `amd64` |


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
        "docker-manifest-digest": "sha256:c6cbd5dbfee400a6d19341b6e0bf97f643e0f78d1ec50e5060920f427d2ff4d0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d22db8f7f03e3f675b50019895348353ab8fac1a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/static",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHUsxiBZ7atgpX/af8mP6biGmBn6nPNF+014QrZLX4HfAiEAt9YalyIFQ3nGSfCWuOgvFA072+IEh9HJrS60oaJMYAM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMTYyOWNiMGM2ZGIwZThmNWQwZTQxNTE5YWI2ZjE1YjBmZWVhOGE4YjkxZmI3MTgxNjg1MjFjMDYyMzc5NzhmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRnhubHdZVEd5WVNxM0VoZ3d0WlNIbXFnbnFnMi96c3ZzOE1xVkhQR0hBaEFpQWFtNjBIRHJnWkNaeGpHU09iYnZOa1Exd05OU3M2bFhEVnpMaCtyMUNtREE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVlJtZzNXR1JwVldoU1RXeGpOa3hVYW1reVJGQmFjaXRCZGtoemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVVFhkTlJFRjVUbFJOTWxkb1kwNU5ha2w0VFZSTmQwMUVRWHBPVkUweVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ4Y1c1Qlpra3ljVms1VVdwUE0zVnNjR3RaYzFaQk9XNTNNMjVrTmxsVE4xbGhhMUVLWWtVeFJVZG1hRUZzT0RsM1RqZEZNRkJ3UVZsUWNGRm5NVGdyTWsxcVdGTkZMMlF5VlRjM1dVWkNSMFV2YUdGM1QwdFBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZxUTBvd0NpODBURGR6V0M5VFltNVVjMlJhWlRSdmRsQXZRMGxCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VGpCWldGSndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMXBFU1hsYVIwazBXbXBrYlUxRVRteE5NbGt5VG5wV2FVNVVRWGROVkdzMFQxUlZlazVFWjNwT1ZFNW9DbGxxYUcxWlYwMTRXVlJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YcGtSMFl3WVZkTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGZUdWNU5rcDNRVUZDUVUxQlUwUkNSMEZwUlVFNWFFaFNTbk5WT1dFMWNsSUthWGRtS3pkWFN6QlBZbVJXYVN0T2VGaEtLMnBPYzBKRWFVdFBWVFJuYjBOSlVVUlJXRGhZVGt4WlVqVmFWa2h6TTJKSmRWWjNha1V3YkVjMldDdHNNQXB0VGpseE1VSXdZbTVFYWpCeWVrRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtWQmNHRlhZeXR2UVVzNGVXbGxMMWxQTW1GU1RFMXVhR1p2Q2pKTVozazROSFI0T1d0S1FVTllWemR6VW5aRUwyZ3ZMMUoxZUVOYU5raDRVMWx3VGpkNmNWaEJha0V3Y2taaE9Xd3dWRVJtSzB4SVIyVnJRVFpOYkhvS1lTOVNhRXhoT1haSmNXNDNSMGhFY2tkVlp6QldRMGxQVTJocGFtWkJPV0pDVVUxSVpreGpNRVJhTUQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1669767969,
          "logIndex": 8122898,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/static/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/static",
      "githubWorkflowSha": "d22db8f7f03e3f675b50019895348353ab8fac1a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3579161163",
      "sha": "d22db8f7f03e3f675b50019895348353ab8fac1a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

