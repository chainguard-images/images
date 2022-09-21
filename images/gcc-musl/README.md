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
| `12.1.1_git20220630` `12.1.1_git20220630-r5` `latest` | `sha256:75fb7ced0005a5fa14cfc5fc5606e9a1cb8f64f40cb1f4421a257817873a1786`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:75fb7ced0005a5fa14cfc5fc5606e9a1cb8f64f40cb1f4421a257817873a1786) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:75fb7ced0005a5fa14cfc5fc5606e9a1cb8f64f40cb1f4421a257817873a1786"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "50a1edafb929ac415e3115c16625f0df723d14a9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCwjSSc/CFCesFk9PHnv5PZq2lOcnf3FPs4XxxY5nlZ6AIhAMm1oTGgceBmKQfoH6wxAaRfNAxL1jBnVQrUUpGXKrEk",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZDZjYjA5ODQ0MDg0Y2MxNjExOGU3MDdiNWFjYWRlZWExMjRhNzBlMGM0NDc3MzkwZGZkODllNTRlZmNjYWU5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ1p1YlZzWHdXVE5QbnA1R3E1YXo1eThITythaXFZdzRDL1lhaURDQmR3eUFpRUFpK3ZhMmQ2VlYrQVVseloySjlwSzZEa29EOXBaM01Vb3VYaWZweWUxVzhjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwWFowRjNTVUpCWjBsVlVUWnNTRTluTjJKMlkwSnVPVGh4YzBzdksyNXdaMjVsUmxOUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJFRXdUV3BKZWxkb1kwNU5ha2wzVDFSSmVFMUVRVEZOYWtsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSYURBMVUyUlNjMDFMZERKUmRuSmlNMEYwVm1Ob1RWSnVTelJsWlRneGJubHdhMjhLYkhSUUsyUlJkMGhSVW05dFNXcFlSaXRRWWxscVRqRldPR3R4WlROck9YWkxWMEppUkRsNWNHeHVXSGhuT0Vjd1ZYRlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYxVEhKYUNtaEZVVFZDU0ZKaFMyUTFaREZSZGxjM1dFNU9Ubm93ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWnpGTlIwVjRXbGRTYUZwdFNUVk5hbXhvV1hwUmVFNVhWWHBOVkVVeFdYcEZNazVxU1RGYWFrSnJDbHBxWTNsTk1sRjRUa2RGTlUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NbVJxV1hreGRHUllUbk5OUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtY3hNU3MzTkc5QlFVRlJSRUZGWTNkU1VVbG5UMFJ6UWtGM1Z6TUtRbTVoY3k4NVpWbEpUbGcyTkVGaWQyMTVTakF3TUZCWU4wZDFjVWd6VG5weWNXOURTVkZEU2l0b0wxUnBRV3Q0WTJ0aVJrVnJUbTU2VjFoS1VWQTJRZ295VEhKblQzZFNRMFJ4U0RNMGRHeG1TRlJCUzBKblozRm9hMnBQVUZGUlJFRjNUbTlCUkVKc1FXcEZRVEpTVFhWWFVWSlRVR0pzV2k5clZUTXZkbll3Q2xOSGJHeHdkRTlMWlhNMmQySkRabTQyWTAxYVdEUXdUMUpMTVc5YVVqRlVNV2RaV2xweVZEZHRVRmRWUVdwQlYySmxNbGxhV2xNd1lpdDNORGxHZEdVS2N5OW5kbWhFV0hWMVRYZHhkMElyVFRSaGRXUmhjMDV4WldOVk15dHVRblZGYzBaQ1EyaDZVRGRDSzA5bGNUQTlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663720962,
          "logIndex": 3640885,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3094419831",
      "sha": "50a1edafb929ac415e3115c16625f0df723d14a9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

