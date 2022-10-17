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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:543729d5df0f6d0af77700d1c7f014fb48c87f8f12742a862eafb9873a940862`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:543729d5df0f6d0af77700d1c7f014fb48c87f8f12742a862eafb9873a940862) | `amd64` |


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
        "docker-manifest-digest": "sha256:543729d5df0f6d0af77700d1c7f014fb48c87f8f12742a862eafb9873a940862"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6a9f0b85b7e72239afacedec34d09ebf87b124e1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBh+YxwpBvq5x8a4BBa/qIYfYkyeC43QIw/cnbDOv7JRAiEAwULvmt5IPsFRZMJZwK3BOX0Tmtwp4B0p2I/Cw8yBnC4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZWUyMTAwMmU1Mjc3OTRhNzc0YWI0ZjhiNGQ1MDczNWE5YTdhYTY0ZjlkMTIzMjg0NjZkMTg3ZGIyZmE0MmZlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQVU4RlgzL2gzZjdoK3U1RmVFY1B5R05VTTBDcjlpSlk2VzFNeGZueXBrcEFpRUF3cXh0QWRiVytaaWV3akdhdUx6YlBPLzFDM1hvSzBCVEoxTTJaK0pOa0VjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwbFowRjNTVUpCWjBsVllrMTJMMDlhYld4ME1qbG5TMUoyTW1wcVZGVXZTbWxDYW1RNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFa3dUbnBKZDFkb1kwNU5ha2w0VFVSRk0wMUVTVEZPZWtsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZNZVVaWlkycHpaMng0YUVSdFpubFhXbTh3TUdKT1QydEZjVEJ0TDJsd1pHZGxiVVFLTTBweVNFUlFaMHBIWm1kdlpYSm9NVkZRWVdjemN6WXdUa1ozTnpFdmNWSXhWbHBOTjNkVGRuSlViMFZsYmpZNVQyRlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2ZERFM0NtNXRkRlpwZWxsTmJqWnBhWGN6V1U5NkszcGlkUzlyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5T2JVVTFXbXBDYVU5RVZtbE9NbFV6VFdwSmVrOVhSbTFaVjA1c1drZFdhazE2VW10TlJHeHNDbGx0V1RST01rbDRUV3BTYkUxVVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFEwT1dGMGMxRkJRVUpCVFVGU2VrSkdRV2xCZVRkMVZUSUtkblJXWlRSeFltUTRlRkpyUkhCa2FuWkJZMDV6UkhCeEwzcExVazU0YmtOdU1saEdPR2RKYUVGTVNuVjVOWFZTYUd0MGVWVndOVTFqWW5sSGVXSmFOZ29yVFc1ek1tTlBNM3BDY1RjNU1UZFpZVXBzY2sxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW10QlRVZFpRMDFSUkV4Q1VrbEVhRmgzZUc1Sk1VOW9jSFZpQ21WblJGTXhNRkpJVFVkV016YzRhamRaTjFOM0sxWnpTR1ZQWTBneU5uQm1aRlpVT1N0cVoxZGhhMEp6TlhvMFEwMVJSRGxOVmpkeWRrUmthM05OTDFFS1VWbGxhVlZ1Y1VrME9YTndVbkEzVmxCNmFGUlZha3RSUTFkUmQySkZkbkV6TmprM2FURllZa2ROUkRaUU4yeFpSM05SUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665974844,
          "logIndex": 5251046,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "6a9f0b85b7e72239afacedec34d09ebf87b124e1",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3262003713",
      "sha": "6a9f0b85b7e72239afacedec34d09ebf87b124e1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

