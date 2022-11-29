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
| `migration-20221125` | `sha256:ee02fb5083e8db0066c8711ab24d6a2115d223e4375a42d2822743751b840042`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ee02fb5083e8db0066c8711ab24d6a2115d223e4375a42d2822743751b840042) | `amd64` |
| `latest` | `sha256:b74a5e7a36382582394981c3cc6b33e85ca69545936678b4df35ec262c8d5cdd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b74a5e7a36382582394981c3cc6b33e85ca69545936678b4df35ec262c8d5cdd) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration` `migration-20221129` | `sha256:c57d4c0b8053de0c64258d9647194fdaa912440f25fc769fbf0413015780dbbc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c57d4c0b8053de0c64258d9647194fdaa912440f25fc769fbf0413015780dbbc) | `amd64` |
| `migration-20221123` | `sha256:d66c14b131e54a759651e88d1fd1fc1dd0139eef407d57b9b065346abefc80cc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d66c14b131e54a759651e88d1fd1fc1dd0139eef407d57b9b065346abefc80cc) | `amd64` |
| `migration-20221121` | `sha256:354a1aebf04c61e4515ff9d76bdfc6ac55bee1a3c097233526d585098a0ea3c9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:354a1aebf04c61e4515ff9d76bdfc6ac55bee1a3c097233526d585098a0ea3c9) | `amd64` |
| `migration-20221122` | `sha256:d5ea3015b3c2f03e50808ac83b445e05e2762d429ab6d3832ee84ba7dc063a2a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d5ea3015b3c2f03e50808ac83b445e05e2762d429ab6d3832ee84ba7dc063a2a) | `amd64` |
| `migration-20221124` | `sha256:f676ea8cd16f94da3c569717153dfd1691e4ccbbb3fd44c3775819950e96db5b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f676ea8cd16f94da3c569717153dfd1691e4ccbbb3fd44c3775819950e96db5b) | `amd64` |
| `migration-20221126` | `sha256:883f179b66f97cb6b541a2135e1a4a11b289444192375abb9e7ea6db6e4a15b3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:883f179b66f97cb6b541a2135e1a4a11b289444192375abb9e7ea6db6e4a15b3) | `amd64` |
| `migration-20221127` | `sha256:4896035b8a10778331ee638b04fb1228076fc2be5b1a49f649a1f5a7fe6883ec`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4896035b8a10778331ee638b04fb1228076fc2be5b1a49f649a1f5a7fe6883ec) | `amd64` |
| `migration-20221118` | `sha256:1ac1322f372531b00d40847e6219ad4ec862b0b271432166451d2df2277c8569`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1ac1322f372531b00d40847e6219ad4ec862b0b271432166451d2df2277c8569) | `amd64` |
| `migration-20221119` | `sha256:0b4da3de84ff51aaf88c6a95d8d29c56af475514e42c92efdfd3cb2d075fb050`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0b4da3de84ff51aaf88c6a95d8d29c56af475514e42c92efdfd3cb2d075fb050) | `amd64` |
| `migration-20221120` | `sha256:867702b83a83390361b5246e1fdfcd932865dcb0b115aea56618e91130fa8ca3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:867702b83a83390361b5246e1fdfcd932865dcb0b115aea56618e91130fa8ca3) | `amd64` |
| `migration-20221128` | `sha256:ede9dd1943566d9009ff24bcde5e3c968775b5d3c3ec66ad991ae681e87f9055`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ede9dd1943566d9009ff24bcde5e3c968775b5d3c3ec66ad991ae681e87f9055) | `amd64` |


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
        "docker-manifest-digest": "sha256:b74a5e7a36382582394981c3cc6b33e85ca69545936678b4df35ec262c8d5cdd"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "70aa084e21c1f1f9f8c7c5ceb6aff8e452164f24",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/static",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD3jfHS6KzAamkt8WHsSdKMd6X5sUtsCerCMLBm8mO3AgIgBCG4B1xi+XHxKOriEf1SiN1/+ET2bSSEI6GpwuiTYk4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmMDNlNWJlZDVkZDlkYWE4ZjcwM2Y2NmY0YThjOTQxZTQ0ZWUxMzA3ZTk3OGI5ZTcxMTNiYThjMTNiMGY1MjhmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNxcFhMQ0MrOWs0NWZCYnl5MU9WZjBMRVQvbkdiVFEzWStzK1FoUWt3VWN3SWhBSUVKczJaeGE1SlY4T2ZVRFlmbWY3eHdGYnh0d0twbGFyMmhpT2N1ZHRaQyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlNtSnFTazV2Y2xSclRGZ3ljM1JDTmpCQ1VHdHlMMm81ZW05QmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVU1RWTlJFRjVUbFJGZUZkb1kwNU5ha2w0VFZSSk5VMUVRWHBPVkVWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZyTnpjMlR5OTZjU3N4V21GMmQzRnlSRnBzVFRkYVdXRnBhbVJOTW1sdVJrWnZaekVLUVZwSGRWZHRlbXQ0Ulc1UlZVZDJjRFJ1ZEhsRlYwOXRiRzFEWTJkcGExVm9RbGhrVjJGME1XWmxRM0Y2TVU0MlZUWlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZIZW14MkNtTnFiRGhhUWs1MlJISm5UM1ZEUzFoWE9UUlpUWE13ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VGpCWldGSndXWGs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDU2UW1oWlZFRTBUa2RWZVUxWFRYaGFha1p0VDFkWk5GbDZaR3BPVjA1c1dXcGFhRnB0V1RSYVZGRXhDazFxUlRKT1IxbDVUa1JCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YcGtSMFl3WVZkTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGZDAxWU9FUlJRVUZDUVUxQlVucENSa0ZwUlVGdWFHVkdlV2RHZUhZdldYRUtRMHBKTkdseWFrTXJiVUZtV0ZNdmVqbFdXakJqUVdJdlVVVkJSbE52UVVOSlNISlJlbFZDUTBKM2JuWTNOV2xaWVZKM1VtNDRUMk5oY2xreFZuQlpWd293Y1dWaVlXdzBlVTFuTnpCTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OVVVSU09IZFdaVlIyTWpRclVrMHhWSGx5UkhWbWVISktaM05QQ21ZellVUk9abnAwYm1SR1psQlFUR0V6T0U0MUszQkJlR1poY1VkR1FtTXhaRFl6YzFwVlowTk5Sa2hKYVRkdk9HODVNVFIzUmxsamNuRTVVMlJoU25FS1RsUldORlpEUVROelNWb3ZXV0ZLWldrMlZYUldZV3d6VTB0bFMxTlRZaTlPUTNaSU5IRkxaSFpuUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1669681535,
          "logIndex": 8048881,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/static/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/static",
      "githubWorkflowSha": "70aa084e21c1f1f9f8c7c5ceb6aff8e452164f24",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3569824022",
      "sha": "70aa084e21c1f1f9f8c7c5ceb6aff8e452164f24"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

