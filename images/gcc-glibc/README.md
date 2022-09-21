# gcc-glibc

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/gcc-glibc/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/gcc-glibc/actions/workflows/release.yaml)

Minimal container image for building C applications (which require glibc).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gcc-glibc:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:9d5637091f29724797c383b07a0cb9ede1383a14f6f951232b7ec7693b81c5e6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9d5637091f29724797c383b07a0cb9ede1383a14f6f951232b7ec7693b81c5e6) | `amd64` |


## Usage

To build the C application in [examples/hello/main.c](examples/hello/main.c):

```
$ docker run --rm -v "${PWD}:/work" cgr.dev/chainguard/gcc-glibc examples/hello/main.c -o hello
```

This will write a Linux binary to `./hello`. If you're on Linux and have the glibc library, you
should be able to run it directly. Otherwise you can run it in a container e.g:

```
$ docker run --rm -v "$PWD/hello:/hello" --platform linux/amd64 cgr.dev/chainguard/glibc-dynamic /hello
Hello World!
```

Note: only `linux/amd64` is uspported at the moment.

We can also do this all in a multi-stage Dockerfile e.g:

```Dockerfile
FROM cgr.dev/chainguard/gcc-glibc as build

COPY hello.c /work/hello.c
RUN cc hello.c -o hello

FROM cgr.dev/chainguard/glibc-dynamic

COPY --from=build /work/hello /hello
CMD ["/hello"]
```

And we can also compile statically to be used in environments without glibc:


```Dockerfile
FROM cgr.dev/chainguard/gcc-glibc as build

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
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/gcc-glibc:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/gcc-glibc:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/gcc-glibc"
      },
      "image": {
        "docker-manifest-digest": "sha256:9d5637091f29724797c383b07a0cb9ede1383a14f6f951232b7ec7693b81c5e6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "292859981b6d7a5c7c1f875e190ea2b1678fdcc4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICdZ95MMzKr4J0f2zRdRgICffg3mxAHxJAh+IBt8zxRFAiEA8VLbwL5SbmgvTI2X+A3Qlg/x4mcn5nZ+LAeN+fyaGfU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3YmJlNTgxMjYzZmVhYjFlMTQyNzg4ODA5OWQyNjJkMDQ1OWYwYzhhYzBlZDQyYmQ2YTg2NWZkZmRjMDAzOWVmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJREc1NUhnVGNVVVR6UzRiSFZGbmhXN1pUbGpwUVhrR3JUTkpHbVlHclY5cEFpRUEyTFBCVGpTaVJSakgwMmpKenIwb0FlckJxTWM4YXk0b1BKOGxCaHNjRFlZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlZHc3phM1Z0WWtjM1luQnRSM2RqV0U1SlRYVTNhM1Y1WTNGbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlZHZDNUMVJSTUZkb1kwNU5ha2wzVDFSSmVFMVVaM2hQVkZFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUxWW5wTWVpOHphMnBITTB4dVRuVXJOMFE0UTBoaFoxSXJablJNTDNkaGVEVllXallLVHpVMlYyWnllVU42TldweE9XUm9lWFpCWm5SbldGRkxVRUZXTkN0UVZXbEhSMkoxYUVsMmNFcHVXa3A2VVhWRlIyRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ0V2tWRENqa3JaWEZwWmpWNmVqTk9jME5aWkdWWk9WUlNhR3hyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JXZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVVmpTRlo2WVVSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5lVTlVU1RST1ZHczFUMFJHYVU1dFVUTlpWRlpxVGpKTmVGcHFaek5PVjFWNFQxUkNiRmxVU21sTlZGa3pDazlIV210Wk1rMHdUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRGEwZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVY3lUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eVpHcFplVEZ1WWtkc2FWbDZRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsT2FGQmtTSEJCUVVGRlFYZENTRTFGVlVOSlJEWkpjbmhWTTJJMVFtOEtNVmN6ZVZaclQzb3dRMnh3VmxNMFMzZDFZV05wTVc1WWRYZDZUMWRQU21GQmFVVkJlRVJJWVc5dUwyOVBZVkl5WVROVGFFMVJNRlZFVHpKck1GVlZjQXBOVW10ck1UVmlMMWg2ZWpkM0swVjNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsNFFVcE9TRk4zVVZNMWExY3pRaXN3TkdGUWNIY3JUM0ZXQ21KVU1GSm1URGRZVkZJNVZWRnlURXhxTVdSM2FtUklUR3RzTTNoSWRsTmxNMlpvUzFodFExRk9RVWwzWlVKb1FYRTNWbloxZVU5c2JWTTBiV3d2Y0hNS1JsRkhkMGxrU0hKaFdISTBNblZzVlVaek5FOTRjVmhCYnpkblMwaDFhSFp3VFd0dFFtSk5OelppTDFFS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663783788,
          "logIndex": 3691818,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3100086357",
      "sha": "292859981b6d7a5c7c1f875e190ea2b1678fdcc4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

