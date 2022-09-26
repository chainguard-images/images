# gcc-musl

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/gcc-musl/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/gcc-musl/actions/workflows/release.yaml)

Minimal container image for building C applications (which do not require glibc).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gcc-musl:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `12.1.1_git20220630` `12.1.1_git20220630-r6` `latest` | `sha256:4f4e4a0ccee64f7e43dfc02eded6db7192a0dfa5457ac1953550a17fe643231f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4f4e4a0ccee64f7e43dfc02eded6db7192a0dfa5457ac1953550a17fe643231f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `12.1.1_git20220630-r5` | `sha256:908fa1f99f90faf71209ccd87700153bc8546c03bcb2aecea20e4a048a5f885d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:908fa1f99f90faf71209ccd87700153bc8546c03bcb2aecea20e4a048a5f885d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To build the C application in [examples/hello/main.c](examples/hello/main.c):

```
$ docker run --rm -v "${PWD}:/work" cgr.dev/chainguard/gcc-musl examples/hello/main.c -o hello
```

This will write a Linux binary to `./hello`. If you're on Linux and have the musl library, you
should be able to run it directly. Otherwise you can run it in a container e.g:

```
$ docker run --rm -v "$PWD/hello:/hello" cgr.dev/chainguard/musl-dynamic /hello
Hello World!
```

We can also do this all in a multi-stage Dockerfile e.g:

```Dockerfile
FROM cgr.dev/chainguard/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc hello.c -o hello

FROM cgr.dev/chainguard/musl-dynamic

COPY --from=build /work/hello /hello
CMD ["/hello"]
```

And we can also compile statically to be used in environments without musl:


```Dockerfile
FROM cgr.dev/chainguard/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc --static hello.c -o hello

FROM cgr.dev/chainguard/static

COPY --from=build /work/hello /hello
CMD ["/hello"]
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/gcc-musl:latest | jq
```

Output:
```
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys

Verification for cgr.dev/chainguard/gcc-musl:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/gcc-musl"
      },
      "image": {
        "docker-manifest-digest": "sha256:4f4e4a0ccee64f7e43dfc02eded6db7192a0dfa5457ac1953550a17fe643231f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "698f9e89acdf9aa1ead9f8e1392efbfa97ff322a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIA21KXGRqr4FE5ORZYj56MnMUgYgdxPUBIKZt3UOtv3UAiEAguNCW+jscuNQzvfTAuAvC919aquwxIMKkm7J5QMUbfo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhMDZkZWM5Y2Q5YjczYjdmMGFiMzM5YTExOTc2NGU1MTcxZGFhMTEyNTAyN2Q2MmQxMTE5ZmJhMmFhNmQxYmM0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRjkvVUhGR2xsbXJ3TG1HWGxiMENiUENJc00yKzVLMFlndzZZM3dvQUdmSkFpRUFtMzlXUVFLSkN1WDJtOXFWN25pb1VuQUk2UDVlRWdBUEtXeWR1c25kWUJ3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwVFowRjNTVUpCWjBsVlIxaHpNVWhXVFVSS2NsaHlUMWw1V2tndk9GUkZLMUYzZFZjd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1RKTlJFRXdUVlJOZUZkb1kwNU5ha2wzVDFSSk1rMUVRVEZOVkUxNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUxUmxOcksydEJiRlZrUnpCcWQwUXpOSGxMUWxwSVVVUjNWMmgxUlRKMFFUWlVUWFlLVVRKcVIyRldURk54UnpCd1MyYzBjM2xtUm5KRE1qbDFiemg2ZUVneVFVRjZaakppT1c0MWJDOXFVRmg0VkU0d1pYRlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU0YkdORENrcEJaRFU1ZERJeE5GSlVSMmgxTTJSRk1USkhjSE00ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWnpKUFZHaHRUMWRWTkU5WFJtcGFSMWsxV1ZkRmVGcFhSbXRQVjFrMFdsUkZlazlVU214YWJVcHRDbGxVYXpOYWJWbDZUV3BLYUUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NbVJxV1hreGRHUllUbk5OUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwVVZsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTTjBKSWEwRmtkMEl4UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtY3pZems0YVdOQlFVRlJSRUZGV1hkU1FVbG5XRFl3T1RCNVNHOEtNVnBpVVVOSVRYWXdVVU5JWTBoUFN6SlNUa0ZXUlVrM2NYRlNNWEF3WlhGV1IzTkRTVVF4YjBsTWVtRnRWVEJDTDJKeE5FRkhjM1ZhZUVOR1dVdEZLd3BUUldKWlVrOW5ZakYxU1RkaE5GTkpUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlZMEZOUjFGRFRVRnViMDU1YnpGeVp6TkdUbEJoVkdFMFJ6ZExXVnBhQ2s4ck9XdzNWbkJEYW10alFXRnRZMXBCS3pSVVZsaFlUVFlyWjI0NVVGUjVkMHROWTNnemVWbEhRVWwzU0ZndlRrbDZkSGszY0ZaS1VIZFBWek5sYkhZS1JWVXhMMWxyYkdZMGRsVnhXa2xzUkVaM05ETkVTVTluTnk4MldIRjZRbXhPWmxSTFoweDBUblpRVUZnS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1664152914,
          "logIndex": 3971954,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3124309021",
      "sha": "698f9e89acdf9aa1ead9f8e1392efbfa97ff322a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

