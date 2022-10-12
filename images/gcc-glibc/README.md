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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:0fed2685761bdaeee4d4765b1d64d0db3eca48acd61ec782f5d16ac2c3f9c3c2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0fed2685761bdaeee4d4765b1d64d0db3eca48acd61ec782f5d16ac2c3f9c3c2) | `amd64` |


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
        "docker-manifest-digest": "sha256:0fed2685761bdaeee4d4765b1d64d0db3eca48acd61ec782f5d16ac2c3f9c3c2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "30f98d130e6316829088b7e2459a5b0e7c07e61d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICuJRfLkEJvNCl3/ddrxHtasrouX+JzAvJLamTfp0a0dAiEA+EZ0KM+omzz5Jtfwdgfwwmn99XvsFiZDz+R2CZmEwYY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyMDkwMzkyMDVkNGQxNGY4MDk0MGJlZDU4N2MwZDY1ZDE3OGM0YjhkNWUzMGUxNDliZjI5OWJkM2YzYzliODgzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSERJYjFIZEwvdVVacmtiYUtYbWlkUjc4aTBaTCtSUnVqdFJ6bEdYbUJOZ0FpRUFqV05UbExWSnBVOWV5aDRQLzRvU1lVaFY0d2tjc253VmM3ZlJaNURHTDNZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlRXWjBZM0ZyUlVWUmRXNWhha2RJYWpGNmRrazBOSE5ZV21NNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlZFMTZUbXBWZVZkb1kwNU5ha2w0VFVSRmVVMVVUVEJPYWxWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZDYTBOYVdYWnFNRGN4VlZOWE5tTnJjVmRvVm1WWGNISlFZbVZGV2s4eU0yazNkblVLTWpKUVREQnRNM1ZKWjJOdVUwRjFkakF5VlZsa1JUY3lkRVZETDJSU2EyeE9aRGxNY1N0SE9FRlFSemN2ZEd0WmNtRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZMTVRsYUNsWlpOVFpsWlRKWFZtdzRXbUZ1Um1vMVIzbFNjMmwzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JXZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVVmpTRlo2WVVSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5lazFIV1RWUFIxRjRUWHBDYkU1cVRYaE9hbWQ1VDFSQk5FOUhTVE5hVkVrd1RsUnNhRTVYU1hkYVZHUnFDazFFWkd4T2FrWnJUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRGEwZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVY3lUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eVpHcFplVEZ1WWtkc2FWbDZRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUVRXRlpjbVZCUVVGRlFYZENTRTFGVlVOSlFYaEJjVXBtTld4NllqRUtkelZoVEc4eFJXeElaRlp2V1ZFeVZFdG5NSEZ0WkdsUldqQk9iWEo0UnpsQmFVVkJOakpCVUVoeGNWVnRUMU12YlZkTmRIcFBkVlJ4YUN0dlMzUkRkQXB0UzAxdFZHOU9XVVprTTB0TmJtOTNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsM1JHTlBlbE5DU1RoTVJVcE1lbVV6YjA5MlRFOVZURFpSQ21wcE9WWkNTR3RJYVV0SFJWZDVTVVUyVVRZclRuUXpTVVpJTUZVd05GWlVRMlZsUjIxeU0xWkJha1ZCZDNGelNrRlVOVXhQZWpOVmQwRTBVVEJVV0ZZS1V6aEpUbXRWVXpoR1ZtWTJlalFyY0dKd2RtWlRTamh2U0RFMVozVk5TWFozYkhKYVJVVlZSR3dyVWtvS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665581816,
          "logIndex": 4965291,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "30f98d130e6316829088b7e2459a5b0e7c07e61d",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3235115893",
      "sha": "30f98d130e6316829088b7e2459a5b0e7c07e61d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

