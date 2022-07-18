# gcc-musl Image

Minimal container image for building C applications (which do not require glibc).

This image is rebuilt nightly from a [GitHub action](https://github.com/distroless/gcc-musl/blob/main/.github/workflows/release.yaml).

## Get It!

The gcc-musl image is available on the GHCR and distroless.dev registries:

```
docker pull distroless.dev/gcc-musl:latest
docker pull ghcr.io/distroless/gcc-musl:latest
```

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

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

## Signing

All distroless images are signed using [Sigstore](https://www.sigstore.dev/). This can be verified
using the [cosign](https://github.com/SigStore/cosign) tool:
<details>

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
        "docker-manifest-digest": "sha256:6e9bc073c518925155bc954a77a68f0adb59a66cf9ce3f1ab676bb6568b1096e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGSrAaVFVW4SVYq43vrLBdlmfyg6Bbi150UvgSVLkWyPAiEA2cDXOR/j83ZdIL03ss17pl804fEjlNf7M4pMGSsrJUU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0MTU0NTQ4YTkwOWM1ZDU0ZGM0YWFmNGU0YmI5ZDZkM2NkNzdmNjZiNGFkOGQ1MTU3MmVlNDUzOTFhZWRjY2MyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSHQxZklldGc4WUV5ZHFzM2hrMlpqM3hsejh3cVc3ODZVWjVuWjE1RlVZb0FpQWZZU3lBbnh0ejBOTmJwdWxwbGNJYi8yYWROR25jRWVodjcwWlNCWUowWGc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVSRU5EUVhsUFowRjNTVUpCWjBsVldWQXZhbk5OYlZGaWNYZDRTbmt6Ulc0NU4zRnRkMkpRY2taSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDU2UlRSTlZGRXhUbnBCTVZkb1kwNU5ha2wzVG5wRk5FMVVWWGRPZWtFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZtVTFGSk5USndZbXh5YkVwUlJURXJWblZHUkU4MFMxRmtTSFV4YTJoRFUxSnZWbkFLTmxkWU1WaHRUVGhSYzNWYVVFbE1TMk14UWpKMFNrcDJTM1pFU2pCTFJuWkdaWE5VWTNKVFRVNWpZek41Wm1WV1pYRlBRMEZyU1hkblowa3JUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZrVW1ab0NrWlRSSGR3TTNCQmRVdHNNSGMyTkVkblZVcEZWRTVaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsM1dVUldVakJTUVZGSUwwSkdhM2RXTkZwV1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTWs1cVRGY3hNV015ZDNaTWJXUndaRWRvTVZscE9UTmlNMHB5V20xNGRtUXpUWFpqYlZaeldsZEdlbHBUTlRWWlZ6RnpVVWhLYkZwdVRYWmhSMVpvQ2xwSVRYWmlWMFp3WW1wQk5VSm5iM0pDWjBWRlFWbFBMMDFCUlVKQ1EzUnZaRWhTZDJONmIzWk1NMUoyWVRKV2RVeHRSbXBrUjJ4MlltNU5kVm95YkRBS1lVaFdhV1JZVG14amJVNTJZbTVTYkdKdVVYVlpNamwwVFVKSlIwTnBjMGRCVVZGQ1p6YzRkMEZSU1VWQ1NFSXhZekpuZDA1bldVdExkMWxDUWtGSFJBcDJla0ZDUVhkUmIwNUhTVEJQVkdodFdrZFplVTVFVlRCYVIwcHBUMVJrYUZreVdteE5la1pyVGpKUk0wNVhVWGhOVjFadFRWUkNhVTU2UVRGWmVrRmpDa0puYjNKQ1owVkZRVmxQTDAxQlJVVkNRVFZFWTIxV2FHUkhWV2RWYlZaeldsZEdlbHBVUVdoQ1oyOXlRbWRGUlVGWlR5OU5RVVZHUWtKT2EyRllUakFLWTIwNWMxcFlUbnBNTW1ScVdYa3hkR1JZVG5OTlFqQkhRMmx6UjBGUlVVSm5OemgzUVZGWlJVUXpTbXhhYmsxMllVZFdhRnBJVFhaaVYwWndZbXBEUWdwcFoxbExTM2RaUWtKQlNGZGxVVWxGUVdkU09FSkliMEZsUVVJeVFVRm9aMnQyUVc5VmRqbHZVbVJJVW1GNVpVVnVSVlp1UjB0M1YxQmpUVFF3YlROdENuWkRTVWRPYlRsNVFVRkJRbWRvU0ZGR1NHOUJRVUZSUkVGRlkzZFNVVWxvUVV4VmFHcGxNbFJ0U0ZOR04xbERUVlJSVmk5alRESlVRUzlYVUdWQ2JHWUtOMkU0YmpsaWNEQmFPR1JRUVdsQmF6SmtUek16T0hwNVExaDRUbFpTVkRSTVZraFJVelZpVUN0SFNEbFVjbU42VkROV1UwbEdOMVp5YWtGTFFtZG5jUXBvYTJwUFVGRlJSRUYzVG01QlJFSnJRV3BDWnpjclJrUlhZM0p2TWxwcmRGRlJOVzlyWjNBME4xWmpWV055UlVKaVdVVndPSFZHZGpkWU5pOXZhMGxhQ2xCa1UxZHhNWEZEUjFsbVFqaGpaamh5YXpSRFRVaDRSbXd3WlZFMVpUbGpZMEU0VW5aVk1FNVdWelJEY0dZeGJuWjBVMEpJT1UxVk4xaEpaRVYwSzFBS2RsQmpObFZDY0dGWVNuVTVTRXMzZWxGRVZXdERkejA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1658156266,
          "logIndex": 2972987,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "2691422543",
      "sha": "4b498fdf2454dbb97acfe31d7d75d11ef10b705c"
    }
  }
]
```
</details>
