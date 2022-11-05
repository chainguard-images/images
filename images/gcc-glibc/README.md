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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:b4b0446b4c7dcf7097bcfec3a0809c9b7bd2d8af9f3ea2db9119c664a5c67af7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b4b0446b4c7dcf7097bcfec3a0809c9b7bd2d8af9f3ea2db9119c664a5c67af7) | `amd64` |


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
        "docker-manifest-digest": "sha256:b4b0446b4c7dcf7097bcfec3a0809c9b7bd2d8af9f3ea2db9119c664a5c67af7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "31e229142b25f3fa9a11119259e2d4f3c072c4a7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHRJqT/LM3nEwuUJ4GCCAZVOlHJjqQsC+VsnhJT3oqDKAiEAuggYoxQovGomaYpE6QTUvmbBL8d6qZxGudfCDMvDFWU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzY2I3MWE1NzRjNGUyN2E3NTFiNDhkZTlmN2RiOTlkZGM5MjQ3NmIxY2RhNTQ2MzRkZjQ4ODc4NTNhY2MwMWI0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ2lMRk9Fd253Wi9MZWdSZ0x4OVM2N0Z5MnYyK1dQa2RuME9GR0lsZitEVEFpQUs3aEo0RXJFTllCdXRDSnhvNGZOYXI2LzV4MzRDRm43aENKTzN4a2ZsOHc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwbFowRjNTVUpCWjBsVlZ6ZFdaRWg0TkZaUk1WbzRka2R3ZWxGblMyaHZUR3M0YzNKcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRGTlJFbDNUbFJCZDFkb1kwNU5ha2w0VFZSQk1VMUVTWGhPVkVGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZRYms1RUx6Tm9UbFJUY0ROdk9IRkdLMkp4Y1VWUU1DOVdjVEpzSzBWUVp6azRVMDBLZGprM1RXaGtjMGg2TTJwSmQxRTFUVXQ2WWxoS2R5OTNSelJ2Y1VjNVlXWlBVRk50V1RSb1NFVmFRbGxIVFVwVFdEWlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzTlhGc0NqVk1TUzlGY0VjNVZXUjVhVGxsUTFGUllVUndUbWswZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5TmVrWnNUV3BKTlUxVVVYbFpha2t4V21wT2JWbFViR2hOVkVWNFRWUnJlVTVVYkd4TmJWRXdDbHBxVG1wTlJHTjVXWHBTYUU1NlFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFUTlVNSGRoYzJKSUNrVlVTbXBIVWpSamJWZGpNMEZ4U2t0WWNtcGxVRXN6TDJnMGNIbG5Remh3TjI4MFFVRkJSMFZTV1drNVVIZEJRVUpCVFVGU2VrSkdRV2xGUVd4cFVEZ0tiVzlCTWtSQ1JuTkRha1pEYVRGcFVFMUxOQ3RVVldGWmNucERRek14UVV4S2VucHBUVzV2UTBsRmVGaG5NV1JSVHpoV1JXOXZZMUF6ZWpkM1dsRk5kd295U1V4M1ZVcDRUalV5UldKM1FreFJkelJEZEUxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1kQlRVZFZRMDFSUkZwaVQzZE1lR3hDZGpJM2FYRk9hWEpKQ214dWJHcENNbFZsY1ZaVGJreFllWG9yUXk5cFZEWkZVRFJFV0hCNVNrbEVVRXBXU2pKMWQxUnVRblYyYkVGM1EwMUhNR3B0ZUVwaFMyTTFOVWN5TDFjS01uRmlNVkpYZUdKUVlWTjZXbXhCY2pWTVZtWmtaREE1TlVkUE0wNDBkbGQ2YW1oMWJHNTNZMlpqY2pGTlp6TnROVUU5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667613904,
          "logIndex": 6532294,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "31e229142b25f3fa9a11119259e2d4f3c072c4a7",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3398265319",
      "sha": "31e229142b25f3fa9a11119259e2d4f3c072c4a7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

