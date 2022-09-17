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
| `latest` | `sha256:4799cffb309e85b419ffbda31bc272cdce9e87266dcd91769d5c8ba1423916b6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4799cffb309e85b419ffbda31bc272cdce9e87266dcd91769d5c8ba1423916b6) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:4799cffb309e85b419ffbda31bc272cdce9e87266dcd91769d5c8ba1423916b6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ebb883503d4c6b1a5ddfbcfed1b9dd1b92a5679b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/static",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIF4XPn/j/HSw9sg9YmfZi9lM2vTNg2i7VhJLMkAupX0GAiA/sqke8bBWcrtajiw9OV4lC3ri0ne0pmc15Vcb4/C6lw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2ZDFlZGI3ZjAyYWU1ZmU5NTMxMzBlOTM1MTViZjk0NWQ2MWZlODc5NTRkNDhlM2NkMTAxMTgwOWE3OGU3MjkzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURxU0lUR1Y0Y0JROStGRUFRR1RuV1pBUDV0dys5ZmdyK3kwWkxRQUJZT1p3SWhBT2dxN21pdng0R0ZpVnE5aHUvd0NRODhpOGs5NE9Xd0JOclNqOUtKd1lqMSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVWRU5EUVhsUFowRjNTVUpCWjBsVldrMXJWRFozZUdkTlprMTFkalZqZEdKTmRXUnZUa1E0VGxkQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFbDZUVVJWTVZkb1kwNU5ha2wzVDFSRk0wMUVTVEJOUkZVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZWWkRrNWVsRXZWRk15Ym5Zd2JXUnlZbWx2UTFsRU5HVkhhbnA2WWpseFlWSmxZVEFLT0cxWmFtWlVUbk5OWW14c1JXNUxOak5xZGpCSU1VRk1iWGx3VXpoV1FrcFNZbkJWV1hwU1QwSk9WbkpQTjFGRVZrdFBRMEZyU1hkblowa3JUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUyVFVjeUNrTnRPRXBqTVcxbWRXZHRXblJ5Wkd4RE9IaHRXRVpWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsUldVUldVakJTUVZGSUwwSkdZM2RXV1ZwVVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqTTFKb1pFZHNha3g1Tlc1aFdGSnZaRmRKZG1ReU9YbGhNbHB6WWpOa2Vrd3pTbXhpUjFab1l6SlZkV1ZYUm5SaVJVSjVXbGRhZWt3eWFHeFpWMUo2Q2t3eU1XaGhWelIzVDFGWlMwdDNXVUpDUVVkRWRucEJRa0ZSVVhKaFNGSXdZMGhOTmt4NU9UQmlNblJzWW1rMWFGa3pVbkJpTWpWNlRHMWtjR1JIYURFS1dXNVdlbHBZU21waU1qVXdXbGMxTUV4dFRuWmlWRUZYUW1kdmNrSm5SVVZCV1U4dlRVRkZRMEpCYUhwWk1taHNXa2hXYzFwVVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRhR3haYlVrMFQwUk5NVTFFVG10T1IwMHlXV3BHYUU1WFVtdGFiVXBxV20xV2EwMVhTVFZhUjFGNFdXcHJlVmxVVlRKT2VteHBDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlFqaEhRMmx6UjBGUlVVSm5OemgzUVZGVlJVVlhVbkFLWXpOU2VXSXllR3hqTTAxMll6TlNhR1JIYkdwTlFqQkhRMmx6UjBGUlVVSm5OemgzUVZGWlJVUXpTbXhhYmsxMllVZFdhRnBJVFhaaVYwWndZbXBEUWdwcFoxbExTM2RaUWtKQlNGZGxVVWxGUVdkU09FSkliMEZsUVVJeVFVRm9aMnQyUVc5VmRqbHZVbVJJVW1GNVpVVnVSVlp1UjB0M1YxQmpUVFF3YlROdENuWkRTVWRPYlRsNVFVRkJRbWN3YkVremFFRkJRVUZSUkVGRlkzZFNVVWxuVm0wd09WWlNlbTEwTjIwck1YZFhSR1pEZGxWdFFXRk5UbnBSVWtKalFXa0tPR3haZW5GUVkyRm9OMEZEU1ZGRGRrZFJWSFJ5VlRGNk1rWkliSFJ5YkhSWk9GZEhWRWR0VTBkYVZqWklPRVkyVFd0SU5rOTVUVGN6VkVGTFFtZG5jUXBvYTJwUFVGRlJSRUYzVG05QlJFSnNRV3BGUVd0dVJYZDRVSGc0UkU1RWVGRXpOemhPYzNFeWRIbHRNM1UwYVhwSUszbE5jM2RTTnpsemRXdDZRVEI2Q2pRdldrdDZWVTExZGpWVlFsZHFRMnczVm1RMVFXcENjMk5PTm5kMU1rWmhZMEpUVG5CVWNsSjZaVGxPTXpSaEwyUmtaall6VjBKb1IzbFlkemxzWVhvS1lVNHljRU5xZVhKMFNuYzJPSGsxTkROSmRGQlpkbWM5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663381873,
          "logIndex": 3523926,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/static/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071809072",
      "sha": "ebb883503d4c6b1a5ddfbcfed1b9dd1b92a5679b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

