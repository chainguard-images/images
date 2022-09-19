# gcc-musl

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/gcc-musl/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/gcc-musl/actions/workflows/release.yaml)

Minimal container image for building C applications (which do not require glibc).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gcc-musl:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `12.1.1_git20220630` `12.1.1_git20220630-r5` `latest` | `sha256:9c9a28447628210c65f5f29e1a376ac1c564607d9df032b019376968e0da8d2c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9c9a28447628210c65f5f29e1a376ac1c564607d9df032b019376968e0da8d2c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/gcc-musl:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/gcc-musl:latest --
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
        "docker-manifest-digest": "sha256:9c9a28447628210c65f5f29e1a376ac1c564607d9df032b019376968e0da8d2c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "aa186b2f534e981dc0a42902a3632153c70856bf",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHv6J3LcT4vyolgvkH5mLbmIHhwVUjbZAYO0lbh2H03BAiAPdJinOJmKulnfYVSYf3VRitJmsOaLY0PMfpSVa0XsVg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2NzNiNjAxMTMyYzdiZjBiMzgxNmU0ODVmNWI5OThhZGZhN2MyOTQ3MWYxMzcxYzU5MDEwNjFhNTZjOGU5YjkxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURTTUJqQllsa3Z4V2R1bHZiZnJsdzhLdTB4RmlBNURic0VLYzRHcVJmUnRBSWdVL2NINDdUUTBsSGlINUl0Q3lJK01MRFF1Wlp6NnZ5Wmw3Mlk0ejcrMXFFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVSRU5EUVhsTFowRjNTVUpCWjBsVlQwTXJObWhsWTFoMU1WVk9NbWQ2UmpsemJsQm9WbGxhU1hOWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDNUMVJKTTFkb1kwNU5ha2wzVDFSRk5VMXFTWGhQVkVrelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6YzAxMFpGcDBkVXA0VWtwcVYzY3JZbFpPWjBSek5tdzBOMkVyT0RacGVETlNURThLTVdWR1VtZ3ZaelZWV20xbFFtZGxaamN3YTFsWE4zZGlSREo0VG13d1VrUk1SekZuZUZORlRrTldTSEowZVhGNFNUWlBRMEZyUlhkblowazVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwUW5RekNqVnBkRGd5WW1OeFpuZGlTMFZ3WlZwcFIxcDRUa2hKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsM1dVUldVakJTUVZGSUwwSkdhM2RXTkZwV1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTWs1cVRGY3hNV015ZDNaTWJXUndaRWRvTVZscE9UTmlNMHB5V20xNGRtUXpUWFpqYlZaeldsZEdlbHBUTlRWWlZ6RnpVVWhLYkZwdVRYWmhSMVpvQ2xwSVRYWmlWMFp3WW1wQk5VSm5iM0pDWjBWRlFWbFBMMDFCUlVKQ1EzUnZaRWhTZDJONmIzWk1NMUoyWVRKV2RVeHRSbXBrUjJ4MlltNU5kVm95YkRBS1lVaFdhV1JZVG14amJVNTJZbTVTYkdKdVVYVlpNamwwVFVKSlIwTnBjMGRCVVZGQ1p6YzRkMEZSU1VWQ1NFSXhZekpuZDA1bldVdExkMWxDUWtGSFJBcDJla0ZDUVhkUmIxbFhSWGhQUkZwcFRXMVpNVTE2VW14UFZHZDRXa2ROZDFsVVVYbFBWRUY1V1ZSTk1rMTZTWGhPVkU1cVRucEJORTVVV21sYWFrRmpDa0puYjNKQ1owVkZRVmxQTDAxQlJVVkNRVFZFWTIxV2FHUkhWV2RWYlZaeldsZEdlbHBVUVdoQ1oyOXlRbWRGUlVGWlR5OU5RVVZHUWtKT2EyRllUakFLWTIwNWMxcFlUbnBNTW1ScVdYa3hkR1JZVG5OTlFqQkhRMmx6UjBGUlVVSm5OemgzUVZGWlJVUXpTbXhhYmsxMllVZFdhRnBJVFhaaVYwWndZbXBEUWdwcFVWbExTM2RaUWtKQlNGZGxVVWxGUVdkU04wSklhMEZrZDBJeFFVRm9aMnQyUVc5VmRqbHZVbVJJVW1GNVpVVnVSVlp1UjB0M1YxQmpUVFF3YlROdENuWkRTVWRPYlRsNVFVRkJRbWN4WmsxclJrMUJRVUZSUkVGRldYZFNRVWxuUzJWWlZYZzBSRVJOUm1oaU1reGFlbGRoVEdGbE9XcHRRaTlNTUN0WGNEWUtkV1JxU2xoSGQyVmlZWGREU1VjeVNWcDNWRlphUW10M05qUjBiQ3RWZFZKR1IxWklXbGh1WVdSS1VFVjFWR1ZIUVdJMk9FcERjMmxOUVc5SFEwTnhSd3BUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVkZEWjFCa2VXcDJabk5LWTB0dGJHaGpjbGwyVFdwUlRWVkZjek16TWxOV1JXZHdUbTltU1RjdmEySjFOMmxVQ25wc1kxWk9iWFJIVlRrNVVXeHhkR3RPU1d0RFRVaGhOMmhEUWs5a2EzZFVablEyVkc1dlp6aDZWMmg1VjBJME9XVlJjWEpMTURocU9WQXJWbTl1TTFVS1QySkViWGw1U2k5NWNGbEVWMFkzTTNGYVl6UkRaejA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663625387,
          "logIndex": 3564202,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085951960",
      "sha": "aa186b2f534e981dc0a42902a3632153c70856bf"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

