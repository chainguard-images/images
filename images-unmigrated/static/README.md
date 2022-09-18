# static

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/static/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/static/actions/workflows/release.yaml)

Base image with just enough files to run static binaries!<br/><br/>This image is meant to be used as a base image only, and is otherwise useless.  It contains the `alpine-baselayout-data` package from Alpine, which is just a set of data files needed to support glibc and musl static binaries at runtime.<br/><br/>This image can be used with `ko build`, `docker`, etc, but is only suitable for running static binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/static:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:e577a44fd72b647a34d5d1c4e0686c2f2a6837d4ee985f29b073b03d7e5903a1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e577a44fd72b647a34d5d1c4e0686c2f2a6837d4ee985f29b073b03d7e5903a1) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage


Here's an example Dockerfile that builds a Rust static binary
and puts it into the static image:

```Dockerfile
FROM --platform=x86_64 rust:alpine as build

RUN rustup target add x86_64-unknown-linux-musl
RUN echo 'fn main() { println!("Hello Distroless"); }' > hello.rs
RUN rustc --target x86_64-unknown-linux-musl hello.rs

FROM cgr.dev/chainguard/static:latest

COPY --from=build /hello /hello
CMD ["/hello"]
```
To build and run it:

```bash
$ docker build -t rusty-distroless --file examples/Dockerfile.rust .
...
$ docker run rusty-distroless
Hello Distroless
```

Note the size!

```bash
$ docker images rusty-distroless
REPOSITORY         TAG       IMAGE ID       CREATED         SIZE
rusty-distroless   latest    aff4c01fd4f0   6 minutes ago   6.09MB
```
And a C static binary:

```Dockerfile
# syntax=docker/dockerfile:1.4
FROM gcc:latest as build

COPY <<EOF /hello.c
#include <stdio.h>
int main() { printf("Hello Distroless!"); }
EOF
RUN cc -static /hello.c -o /hello

FROM cgr.dev/chainguard/static:latest

COPY --from=build /hello /hello
CMD ["/hello"]
```

To build and run it:

```bash
$ docker build -t c-distroless -f examples/Dockerfile.c .
...
$ docker run c-distroless
Hello Distroless!
```

It's even smaller:

```bash
$ docker images c-distroless
REPOSITORY     TAG       IMAGE ID       CREATED              SIZE
c-distroless   latest    f3648380711c   About a minute ago   2.88MB
```

For Go programs, we recommend using [ko](https://github.com/google/ko) and setting
the `defaultBaseImage` to `cgr.dev/chainguard/static`.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-reference": "ghcr.io/distroless/static"
      },
      "image": {
        "docker-manifest-digest": "sha256:e577a44fd72b647a34d5d1c4e0686c2f2a6837d4ee985f29b073b03d7e5903a1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d08b81b39c588b5fdef8b56bd72c8a58253935d6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/static",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCzAzXUER0xOMa1iU5ksz76A8D65cDsST6PFRYkNNipdQIgAYDUFxmZre90DauNsjYvKh7NdDuSL2l5aYWMKuUyh48=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0MGFkMzZiMDA3NGQ3MjhkYzkzY2ZkYjg3NDI4NWRmMzhhOWE1MDMzOTZlMTYxZDU4ZWZmNjI1ZWViZTAyY2QxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNzY2ZUS3lnUzJVUzh2MFBsSmxxV2cxQVZUUTJsd2dqUUhLbWM0MnJQVjhBSWhBTmkzbThMTUpTWWFOS21vdWpuR2JwZ0k4Y3VQajdRN3Rjay9leUtZb2NtSSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVWRU5EUVhsUFowRjNTVUpCWjBsVlRHNTJLMlZwTUU0cllYaG9PVkkxVkRFeFltZHpkMmRsTTBsSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFa3hUVlJCTWxkb1kwNU5ha2wzVDFSRk5FMUVUWGROVkVFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhYkZwNVNIbHhjVFJtU201U2JtbFZUWGRXWVVneGFITnRNMUpoUm5Wd05uUjBRbm9LU1RncmJrdDJORTFKV2pSUlFXVjVMMU5oY0RSck1uQkVTeXQ1VUd4MlFtcDNXVmM0UlUwemFrcG9UU3RGYzBveVRIRlBRMEZyU1hkblowa3JUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU1YkZVckNrRk5UR1Z3TURncmVpOW1UMFpXYlZobWFFUlRRWFJCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsUldVUldVakJTUVZGSUwwSkdZM2RXV1ZwVVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqTTFKb1pFZHNha3g1Tlc1aFdGSnZaRmRKZG1ReU9YbGhNbHB6WWpOa2Vrd3pTbXhpUjFab1l6SlZkV1ZYUm5SaVJVSjVXbGRhZWt3eWFHeFpWMUo2Q2t3eU1XaGhWelIzVDFGWlMwdDNXVUpDUVVkRWRucEJRa0ZSVVhKaFNGSXdZMGhOTmt4NU9UQmlNblJzWW1rMWFGa3pVbkJpTWpWNlRHMWtjR1JIYURFS1dXNVdlbHBZU21waU1qVXdXbGMxTUV4dFRuWmlWRUZYUW1kdmNrSm5SVVZCV1U4dlRVRkZRMEpCYUhwWk1taHNXa2hXYzFwVVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRhR3ROUkdocFQwUkdhVTE2YkdwT1ZHYzBXV3BXYlZwSFZtMVBSMGt4VG0xS2EwNTZTbXBQUjBVeFQwUkpNVTE2YTNwT1YxRXlDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlFqaEhRMmx6UjBGUlVVSm5OemgzUVZGVlJVVlhVbkFLWXpOU2VXSXllR3hqTTAxMll6TlNhR1JIYkdwTlFqQkhRMmx6UjBGUlVVSm5OemgzUVZGWlJVUXpTbXhhYmsxMllVZFdhRnBJVFhaaVYwWndZbXBEUWdwcFoxbExTM2RaUWtKQlNGZGxVVWxGUVdkU09FSkliMEZsUVVJeVFVRm9aMnQyUVc5VmRqbHZVbVJJVW1GNVpVVnVSVlp1UjB0M1YxQmpUVFF3YlROdENuWkRTVWRPYlRsNVFVRkJRbWN3TmtKMFN6aEJRVUZSUkVGRlkzZFNVVWxvUVV4bVIyOUVUakpUTTJVcmIzQnZXR2hoUmt4R2VXOW5NSEZtV1hobldqVUtTa3A1WTIxdGJIcERVVGRzUVdsQ1RqZGxhMjF3TDFCVlFYZFFhazltUjFKTWQzTnZaRkpIVGpWaVNWZFlPVWRqVGtOdGIwVkNjMUZZYWtGTFFtZG5jUXBvYTJwUFVGRlJSRUYzVG05QlJFSnNRV3BGUVd4UWIwZENVMmhITUROTFpteG1VMlk0TlVOU0wzWjBSSE4wTWtGa1ExTktjRUpyUm1wSGIxZDNUMjFyQ2k5S1ltaG5jVmxKT1VWblFsRlVkMlkwYWpKVlFXcEJlVXA1Y2pOWk9URXpka2wzVkV0RldrNW5kM0pSVmtwRmJtVlpVRmxyVTNCcFZFOTRSbWRuYzJFS1JsSjJWbmRUUldwMmNIY3pkM1pCTlVWdFNXOW9VV2M5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663469489,
          "logIndex": 3528056,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/static/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075611921",
      "sha": "d08b81b39c588b5fdef8b56bd72c8a58253935d6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

