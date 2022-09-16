# gcc-musl

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/gcc-musl/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/gcc-musl/actions/workflows/release.yaml)

Minimal container image for building C applications (which do not require glibc).

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/gcc-musl:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `12.1.1_git20220630` `12.1.1_git20220630-r5` `latest` | `sha256:f06990db40794251c6f530ad2731d923849e6f96f9a2bb71b936ca59aa603ac5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f06990db40794251c6f530ad2731d923849e6f96f9a2bb71b936ca59aa603ac5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To build the C application in [examples/hello/main.c](examples/hello/main.c):

```
$ docker run --rm -v "${PWD}:/work" distroless.dev/gcc-musl examples/hello/main.c -o hello
```

This will write a Linux binary to `./hello`. If you're on Linux and have the musl library, you
should be able to run it directly. Otherwise you can run it in a container e.g:

```
$ docker run --rm -v "$PWD/hello:/hello" distroless.dev/musl-dynamic /hello
Hello World!
```

We can also do this all in a multi-stage Dockerfile e.g:

```Dockerfile
FROM distroless.dev/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc hello.c -o hello

FROM distroless.dev/musl-dynamic

COPY --from=build /work/hello /hello
CMD ["/hello"]
```

And we can also compile statically to be used in environments without musl:


```Dockerfile
FROM distroless.dev/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc --static hello.c -o hello

FROM distroless.dev/static

COPY --from=build /work/hello /hello
CMD ["/hello"]
```


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/gcc-musl:latest | jq
```

Output:
```
Verification for distroless.dev/gcc-musl:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/gcc-musl"
      },
      "image": {
        "docker-manifest-digest": "sha256:f06990db40794251c6f530ad2731d923849e6f96f9a2bb71b936ca59aa603ac5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "790b2b7ba429061fe5bf5fb0adf2de0b21b40fac",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDDtP+X2T76BdjBJBjUCJq5Tjg9AIz4tKIi4mK1PuD0GAiBZ8oUM7XQzET8UTKRqTcIG3mYYveM7FrUby9sl7CQXBA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5NTc2NmViN2ZjMzNmMDQxOGYzZTRkMTk1NTVkMjNlNjBjN2Y4YmE4MzI2MmE2ODJkNGMxMmM3M2M0NDAzNjQ0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNZTncvbHN0NGlXM0RvdlUyRjNoNWgwNEZWZi9LWm1BUURBNVBhb1R3NHRnSWdaQnRoeHhxZGlxTTdXNmxlb01MZFhndTVydFg3OWtTRVpmMWhoOTEyT0pJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhsbFowRjNTVUpCWjBsVlprRmpRalI1TTFJdlNHY3Zaa0pCZVZaM01DOVJUVkJNVGxoVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlJFRXdUVVJSTkZkb1kwNU5ha2wzVDFSRk1rMUVRVEZOUkZFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZPYkU1clVHdGpVa2htY201U1RYSndaa0pIYlUxUFpVaFdhMnhXUTI0NFpXRlZSR3NLVlhaUlVVODVXVGR3YzFaVVFXcFZhamtyVFdKS2JFaGhlbEJYWVZkQmFIVlBWVVJyVG1Sb2VWTjNaazFtVUdsWVFrdFBRMEZyV1hkblowcERUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV2ZFUwd0NqYzBiWEJLZWtWRlZtYzRZVWxEVFU5QmFWSm1jRlkwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsM1dVUldVakJTUVZGSUwwSkdhM2RXTkZwV1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTWs1cVRGY3hNV015ZDNaTWJXUndaRWRvTVZscE9UTmlNMHB5V20xNGRtUXpUWFpqYlZaeldsZEdlbHBUTlRWWlZ6RnpVVWhLYkZwdVRYWmhSMVpvQ2xwSVRYWmlWMFp3WW1wQk5VSm5iM0pDWjBWRlFWbFBMMDFCUlVKQ1EzUnZaRWhTZDJONmIzWk1NMUoyWVRKV2RVeHRSbXBrUjJ4MlltNU5kVm95YkRBS1lVaFdhV1JZVG14amJVNTJZbTVTYkdKdVVYVlpNamwwVFVKWlIwTnBjMGRCVVZGQ1p6YzRkMEZSU1VWRFNFNXFZVWRXYTJSWGVHeE5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUkdNMVRVZEplVmxxWkdsWlZGRjVUMVJCTWsxWFdteE9WMHB0VGxkYWFVMUhSbXRhYWtwcldsUkNhVTFxUm1sT1JFSnRDbGxYVFhkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTVkZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVlFLV2tkc2VtUklTblppUjFaNlkzazVibGt5VFhSaVdGWjZZa1JCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx2UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtUVZJMlFVaG5RV1JuUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldVNUVkbUpHYWtGQlFVVkJkMEpJVFVWVlEwbFJRMlZ2UkZOMlEwTmtVMkZPTlhGVFZVbHJXalUxUW1ZclNERUtSekI0Um1WdlFXWkRNV053TkhsTFRUZDNTV2RaZDBOQlNFMXpSbGhVZEZCS2RXNXRabmhaTTFFeFVWcEpXbmRKVUZKeU9HVm9aMHBxWVRKMWJYRTRkd3BEWjFsSlMyOWFTWHBxTUVWQmQwMUVZVkZCZDFwblNYaEJUMU51U3pONVlXTm1Oa2t5YTJKUk5VaGxXVU5NUmtJMVRteFhNbXczV21GMk1rMUxWMmRRQ2t3d1pGb3pSSFp1ZVdkeWNuUXhlRGxoUVVOT1ZYSklUVFYzU1hoQlMzcHVlRlZpUW1GS1oyZDVSa2N2UVV4bFYxZFZVUzgwWkVOb05TODNOVzlyU0hFS1ozRnRZblpKUkZscVptNUdURzFaTm1rMmNUVmxZbTlEUjFOWFpXaG5QVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663288893,
          "logIndex": 3511980,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3064657791",
      "sha": "790b2b7ba429061fe5bf5fb0adf2de0b21b40fac"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

