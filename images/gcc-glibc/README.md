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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:1518f2cec7f4c5a13b575fc90ac290df9c88ef718e63fd3b0e6eddc69a180f0a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1518f2cec7f4c5a13b575fc90ac290df9c88ef718e63fd3b0e6eddc69a180f0a) | `amd64` |


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
        "docker-manifest-digest": "sha256:1518f2cec7f4c5a13b575fc90ac290df9c88ef718e63fd3b0e6eddc69a180f0a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "895c6c56d265ce773e92ee4ab819f6c74d16810e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDvTOsSpJwX7Z1uZCj+ecsE6cmcn2Or4Z5gFhUroDNYgwIhAJkyoFKNP6EIT5OcrgVQA5g0nIu2N13PF0yeKK6Ra1yX",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNjNhMDkwZTUxNmRjNGVjYmQ4YTYxOGNjMDBkZTUwYTcyNTA3NzQ5ODVmNDMxMzk5NzQzNzY5YThjMDFiYjFmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ1MxOWorWDNZeHlWNGkrY3lKTTByTXZmT1BKR0ZtdXVkUmtKeGFSWmhLNEFpRUFzSm8xN1AvM1BYZXFyR29henJMeTZNUVR0WVk5VnVncWFia2hnYzlXQ0dNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwbFowRjNTVUpCWjBsVlNqRjRSMjFGTlRKdFVrWjZUbUZ1YzFWcWN6Tk9Semt5TXpSM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFa3hUbFJGZUZkb1kwNU5ha2w0VFVSRk5VMUVUWGRPVkVWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZCWVdaSk0ySk5VMlZ1VFdKVVJqSkxjRzlOWm0xNGJGZEpkVWtyVW13dmRIY3hhVGdLVW5sVmNVNTBXblJRTlZOb2F6Sk9PSHBoUzJNcmVHTlZia3hwYW01RVJrY3ZNbmRRY2pOWFZtbExVVlpuUm1wR1FuRlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4YUhGbUNqSm5WVFpxZW5Gb1dGaElaMGw2YmxsMFFtOTFibXhyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5UFJHc3hXWHBhYWs1VVdtdE5hbGt4V1RKVk0wNTZUbXhQVkVwc1dsUlNhRmxxWjNoUFYxa3lDbGw2WXpCYVJFVXlUMFJGZDFwVVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFEzYVhGV2VXZEJRVUpCVFVGU2VrSkdRV2xDWm0xTVZEVUtWVTFXZEhGM00zUmtkbGg1ZFc1T01VeFdOaloxUWxjeWFsUlhOazFwWld3MlJtUTJOM2RKYUVGS05YTnpOM2hKSzNWMldDOVdlbXRLVTI5NlQxZDRWZ28zZUZkdmFWQldTbk4xUlVsakwzUmlNaXRtU0UxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW10QlRVZFpRMDFSUXpsUlpsVm5RalJuYlVOSEwyVmxjRGR2Q2tGU01rb3dVblJpTmtWbmEwcExPV2t4VUV4alN5dFVVVlkwYWpkWVVXSm9VVWRMTlZCVlVVOHZhekZ5VG1KTlEwMVJRMUJ6U2xselkydDRkaTlSYW1zS1dWRjZjRzR5ZGtwWk0zZFROVnBJZEhSTFRYQkVkVGRQYTFOdWVHbFNPRW81T1VaUVJqbHZhekJpVG5BMGVWcHFiRkpWUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666148118,
          "logIndex": 5403605,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "895c6c56d265ce773e92ee4ab819f6c74d16810e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "2",
      "run_id": "3278390159",
      "sha": "895c6c56d265ce773e92ee4ab819f6c74d16810e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

