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
| `12.1.1_git20220630` `12.1.1_git20220630-r5` `latest` | `sha256:1a30e5b7fed7c9b9c5813cfb4d76c288df18a1cdeeb80d2a38051ab61a52454f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1a30e5b7fed7c9b9c5813cfb4d76c288df18a1cdeeb80d2a38051ab61a52454f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:1a30e5b7fed7c9b9c5813cfb4d76c288df18a1cdeeb80d2a38051ab61a52454f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "dd06c04a5ab0ff22675be5483fada111147a04c3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEMCHyKfI7YDA611iUBM6t1ULYbhFmT4WPAeY1llKIUhXlICIFX6cRr3WnOmceWaK9AFTlXuocCA7yJhCMVQi13PlD8S",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3NTI0NGM2YmY4MzcxYTU3Njg2M2Y3MzVjMDEyNzFmYWYxMjg0OGFiNzNlZjA3YmNlNmM5ZjIxYTY4MDc5MDM2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSDdIQmlOcVhSTklCYWZSaFBsWUZmZG1RSTZmZDhPT0l1cGZYc2V1QjU2T0FpRUF1U2xWQ1NSYmZ1bUJzbHNidVMyVjlnZjV5RE1jZ2ZsQ0lSRko4a2ZlZDVRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhscFowRjNTVUpCWjBsVlpXMDFNR0YzTUhKMlZVOWpLMHR4UzJ4VWNGbGxhbWxvZFUwd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTmFrMTVUbnBKZVZkb1kwNU5ha2wzVDFSRk1VMXFUWHBPZWtsNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMVDB4TmNuZEthbGRSVFVoelRYQkdVbG93T0V0NFExSXJMM2hSUlZwT1RrcFpZbThLTkM5M2JHOVZaR3h3U0hOdWVTdDRhRUl4VDNwYVNYaDFhV3A1YlZBME1Fa3pSMkpIWTFoa2RsTjRNMnROZVZVMWNEWlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHU1dKQ0NsWjBiMEpOU1Rsb2RYQlRNeXR4ZEZCb2NXUXdkVlJuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsM1dVUldVakJTUVZGSUwwSkdhM2RXTkZwV1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTWs1cVRGY3hNV015ZDNaTWJXUndaRWRvTVZscE9UTmlNMHB5V20xNGRtUXpUWFpqYlZaeldsZEdlbHBUTlRWWlZ6RnpVVWhLYkZwdVRYWmhSMVpvQ2xwSVRYWmlWMFp3WW1wQk5VSm5iM0pDWjBWRlFWbFBMMDFCUlVKQ1EzUnZaRWhTZDJONmIzWk1NMUoyWVRKV2RVeHRSbXBrUjJ4MlltNU5kVm95YkRBS1lVaFdhV1JZVG14amJVNTJZbTVTYkdKdVVYVlpNamwwVFVKWlIwTnBjMGRCVVZGQ1p6YzRkMEZSU1VWRFNFNXFZVWRXYTJSWGVHeE5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUjFKclRVUmFhazFFVW1oT1YwWnBUVWRhYlUxcVNUSk9lbFpwV2xSVk1FOUVUbTFaVjFKb1RWUkZlRTFVVVROWlZFRXdDbGw2VFhkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTVkZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVlFLV2tkc2VtUklTblppUjFaNlkzazVibGt5VFhSaVdGWjZZa1JCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx6UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtVVZJM1FVaHJRV1IzUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldVNUVaVzVUVFVGQlFVVkJkMEpKVFVWWlEwbFJRMkpsZEhvNWFEbElNMkpqSzFnd1VFcDFkMkZMWVdoM2Mya0tkSEJEYUZKelJGZFJjRXQyVm5odlVucEJTV2hCVEV0TlRYUm1UM0J4WWt0c04wdGxPRzVxU2xwWFluaFRkbkZuZFdWUlZIWXZXVmhpUkROT1EyRlFRZ3BOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpyUVUxSFdVTk5VVU5VTVVGdGVXNWpjMmN3UldObmEyaENNbWQwVjA1SmRrUldWRVZyYjNkeU1IQlFaWEZMQ2xkcmFXZHJZMDh4WTNOc1pFcE5NVmxNUkZoWWIyWkNZMVprT0VOTlVVTnRiaTl6VFVGdE9GWm5WWFZUY0RWclIwTXJMMGxTYjNSU01GVnZLekJyWTBnS1IybHlhMmRoTlROdkwxQlJjRFpKU1VZelJXcENZaThyWTFOelVuaHBORDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663284461,
          "logIndex": 3511709,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "2",
      "run_id": "3057018322",
      "sha": "dd06c04a5ab0ff22675be5483fada111147a04c3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

