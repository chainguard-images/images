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
| `12.1.1_git20220630` `12.1.1_git20220630-r5` `latest` | `sha256:7facbc80657a62294adf8ed5ff22128d01ffbf8fc4c19a1f1eb0eb0be5fd83b8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7facbc80657a62294adf8ed5ff22128d01ffbf8fc4c19a1f1eb0eb0be5fd83b8) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:7facbc80657a62294adf8ed5ff22128d01ffbf8fc4c19a1f1eb0eb0be5fd83b8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "a0a4e9a6a3c86bbbdba51468fd118b1299e3e48a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIE4NXVJ2ipKw4BLdWtgFQ0vIj8flDasPHhzHgXzdKx0fAiEA/qxYZFwZeolyoHnQcHybUBPMsyUkVTEMj+kM5XSRStQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMDAxMDUwMDExNTIzM2FhN2Q5OGNkZWY2NWZhYjMyYzhkNGY4Zjg4NTg1MDg3N2NiYjg3YTU2NjU2YmFjMTMwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR25JMjdESEs3a1Y4WFZNdURyUlloOHRlYlAvVFQyU1NaNmdnNUwrdFRtQkFpQlVWWHlpVUVUbzhXbGNDTHlHbThLU0d4L0JPeEprVnp5em9KZktFY3pBaHc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVha05EUVhsUFowRjNTVUpCWjBsVldqZzFSazl2VkV0blpYWktSM1Y0ZWtsR2RFNDJWR2MyUzBObmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRCTlZHTXdUa1JKZDFkb1kwNU5ha2wzVDFSRk1FMVVZekZPUkVsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ4V25jMFMwMTFOVTVXU1hKdlozSjFTMHRqUlhSQ0szbDRSRUpzY0VWdFZraFRUamdLVmpWR01qaHBja0YxVVRrMGN6RkJZbHBTYTFabFJtbElZMjVYUzJOTlZHWTJXRzVLT0hkYVRpdFFiRWhQVkVwNVNYRlBRMEZyU1hkblowa3JUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTYVRkc0NtcDRObXBLWW5GbE9EaFhOMFF3YkRKSFl6TlVObEp6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsM1dVUldVakJTUVZGSUwwSkdhM2RXTkZwV1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTWs1cVRGY3hNV015ZDNaTWJXUndaRWRvTVZscE9UTmlNMHB5V20xNGRtUXpUWFpqYlZaeldsZEdlbHBUTlRWWlZ6RnpVVWhLYkZwdVRYWmhSMVpvQ2xwSVRYWmlWMFp3WW1wQk5VSm5iM0pDWjBWRlFWbFBMMDFCUlVKQ1EzUnZaRWhTZDJONmIzWk1NMUoyWVRKV2RVeHRSbXBrUjJ4MlltNU5kVm95YkRBS1lVaFdhV1JZVG14amJVNTJZbTVTYkdKdVVYVlpNamwwVFVKSlIwTnBjMGRCVVZGQ1p6YzRkMEZSU1VWQ1NFSXhZekpuZDA1bldVdExkMWxDUWtGSFJBcDJla0ZDUVhkUmIxbFVRbWhPUjFVMVdWUmFhRTB5VFRST2JVcHBXVzFTYVZsVVZYaE9SRmswV20xUmVFMVVhR2xOVkVrMVQxZFZlbHBVVVRSWlZFRmpDa0puYjNKQ1owVkZRVmxQTDAxQlJVVkNRVFZFWTIxV2FHUkhWV2RWYlZaeldsZEdlbHBVUVdoQ1oyOXlRbWRGUlVGWlR5OU5RVVZHUWtKT2EyRllUakFLWTIwNWMxcFlUbnBNTW1ScVdYa3hkR1JZVG5OTlFqQkhRMmx6UjBGUlVVSm5OemgzUVZGWlJVUXpTbXhhYmsxMllVZFdhRnBJVFhaaVYwWndZbXBEUWdwcFoxbExTM2RaUWtKQlNGZGxVVWxGUVdkU09FSkliMEZsUVVJeVFVRm9aMnQyUVc5VmRqbHZVbVJJVW1GNVpVVnVSVlp1UjB0M1YxQmpUVFF3YlROdENuWkRTVWRPYlRsNVFVRkJRbWQ2TUdGRFZrMUJRVUZSUkVGRlkzZFNVVWxuVVRGSU1tVmFOME5IZUZZMGRtMXFlR1ZxZEhob1RtTklTRnBYVTJSa1lXOEtWMGh2YmsxRWQxcDVRV3REU1ZGRVFXd3dWRkZwTTNKMmNYSTRZMVZYUVVJM1RHTjRMMU5CUkdRNVkwMUdSM1YyZDJGR01rNUdOVlJWYWtGTFFtZG5jUXBvYTJwUFVGRlJSRUYzVG5CQlJFSnRRV3BGUVRseVZ5dHlNMnBrTDBrd1MwUlJMMHhYVFRacU16QTJkRXN4ZUZWRVJWUlRTbkpQYm5reGFucEVRVnBKQ2tWWlNXODBRV2xRYlVkcmJGRm1RbGhCZUhBNVFXcEZRWEZYYTB4UVIxRnphV3d6WXpJdlkzaFBNRGREV1V3Mk9WSnJSM1J3TnpSVFJGQktjVmhTYUZrS1RFOU1abWhsV0VkR2MxWnZXWEUyTVhacmRUaDRTVmRFQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663177482,
          "logIndex": 3499188,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3054885710",
      "sha": "a0a4e9a6a3c86bbbdba51468fd118b1299e3e48a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

