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
| `12.1.1_git20220630` `12.1.1_git20220630-r5` `latest` | `sha256:6a14b678c25856e84538e52f60925dc9f783c27dae90957f4bab64e49375eeff`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6a14b678c25856e84538e52f60925dc9f783c27dae90957f4bab64e49375eeff) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:6a14b678c25856e84538e52f60925dc9f783c27dae90957f4bab64e49375eeff"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "46375a0e4de5f077b745c2ad5083fe35a7f266b4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBRjMRdzNWj16NIRbixrUHAomBWUZvCfYM21IRavw0I/AiBYzM2I0UDLOu6sy72V0ZmFrO3vxaa/ZYdm5eTnjJBt8g==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhYjcwNjVmYmQ3NTU2OGMxMTc0ZGM4ZWRlNTI3MTg1MGQ5ZWE0NDI3OWZkNzc2MDc2Y2Q2MzI2MjgyYWU1Y2ZhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURvMFVSR1NlY0ZGb2U1VTZkYzZzTnZVdWdlVkdXU29UZGsrT1p2bmUwMDhRSWhBTmp0YmNPaFlHa09yZVBQZGtUZTVqek9iNHE1ck5saWIxWDMyUFlHZ3hJZiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhscFowRjNTVUpCWjBsVldVaEtNaXN6Yms1RVJsZFpUV0YwYVVaWE5UQXdSVWdyUzNkdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlJFRjZUMFJOZWxkb1kwNU5ha2wzVDFSRk5VMUVRVEJQUkUxNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZDU1RoWFoxbEVMeTg0U3pScFMwTmlieXR1WlRsV01FZHhUVFpRVDNodGRVWmFRM01LT0dwemRGaFFabEY0YmxCcFMycFlWM0Y2TWpWUFJUa3ZVbEpDT0ZOcVNGVk5UVVpuY2xNeVVrWmxNSHBrVTAxS1NHRlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ0VG1WMENrcERNRlZYZGpseFMzSnNjMmd4VkU5WGVYRlNRa1p6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsM1dVUldVakJTUVZGSUwwSkdhM2RXTkZwV1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTWs1cVRGY3hNV015ZDNaTWJXUndaRWRvTVZscE9UTmlNMHB5V20xNGRtUXpUWFpqYlZaeldsZEdlbHBUTlRWWlZ6RnpVVWhLYkZwdVRYWmhSMVpvQ2xwSVRYWmlWMFp3WW1wQk5VSm5iM0pDWjBWRlFWbFBMMDFCUlVKQ1EzUnZaRWhTZDJONmIzWk1NMUoyWVRKV2RVeHRSbXBrUjJ4MlltNU5kVm95YkRBS1lVaFdhV1JZVG14amJVNTJZbTVTYkdKdVVYVlpNamwwVFVKWlIwTnBjMGRCVVZGQ1p6YzRkMEZSU1VWRFNFNXFZVWRXYTJSWGVHeE5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUkZFeVRYcGpNVmxVUW14T1IxSnNUbGRaZDA1NlpHbE9lbEV4V1hwS2FGcEVWWGRQUkU1dFdsUk5NVmxVWkcxTmFsa3lDbGxxVVhkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTVkZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVlFLV2tkc2VtUklTblppUjFaNlkzazVibGt5VFhSaVdGWjZZa1JCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx6UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtVVZJM1FVaHJRV1IzUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldVNVVUSEpUVFVGQlFVVkJkMEpKVFVWWlEwbFJSSFJzUjFsYWIyRmhkMHM0WWtFNE4zWk9ZbWxUTVZCYU0yZ0tObTFTVm5kMGFsUm9aVkEwUVdKUFYyVlJTV2hCU1c1Uk4yTjZVR3RPVjFaUmJqTm1iM0JJTVVaQ1RGbHNNVXAzYmtoWlkyOWlXbTFHTVVKa1Z6Rm5PUXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpuUVUxSFZVTk5VVVJaVmpoNlIyZFdlVFEwZFcxeU1FdG1lSFJWWldsR01qQjFUbWRpVDA5VmFGcG1WbWgxQ2t0blQyRk5kbkJCTkVOT09XNXplVWh4ZVZCRk5sRmtVQ3QxVFVOTlJGRm5aa05FZVZGTVl6SndZMmQxUlVzeFFrWnZibGRSYkdsUmFFNTNlSGRIZG04S2EwbFlVQzk0Y0ZwcmNuTkhkVTlSUkhSNlNrZERWbFJDZWxOalUwSjNQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663547929,
          "logIndex": 3530945,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3079228234",
      "sha": "46375a0e4de5f077b745c2ad5083fe35a7f266b4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

