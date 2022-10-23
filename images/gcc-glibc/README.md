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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:4a877e48a3aac0a156e913bdddf3f473907156687b1dacc1b9fc535e2613725e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4a877e48a3aac0a156e913bdddf3f473907156687b1dacc1b9fc535e2613725e) | `amd64` |


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
        "docker-manifest-digest": "sha256:4a877e48a3aac0a156e913bdddf3f473907156687b1dacc1b9fc535e2613725e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "46b23506329add8b01533190132aebcf335d6da2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEjQhEEF9kQ+qHf0sTGLU3cC4MarF0cmYHYNf8/R98TAAiBkXieZ6Qw44t5DcPuiTgkasgGysXHN7iiMq+gpznbkWQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMjhmNzc1MDA0MjhjNzFlOWZkMWMxZjQ0NjQ0MjQ3MmU1M2FmYmQxNWUwMjk4ZGMxYmE1NDBmZmJmNjgzODk4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNna2JRNXpVMXBFYnZ3RXhhbFNSSTBraUp6dTAyYm54RmF0dStJbVJNUzRRSWhBTTRORFFZc1hCRmM0TEZ2eWFjc05WUDBCSWdvaUpxM2p6VjlmQ3lhbmttNSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwcFowRjNTVUpCWjBsVlJrZ3JTbGRUWWxjck5WcDVVa0ZTTTNka1JHcG5kMlZXVlV0amQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hwTlJFbDZUbFJGTlZkb1kwNU5ha2w0VFVSSmVrMUVTVEJPVkVVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0U2tKR1FtbENXWFpHV2pKcFkyWnZSV3cyVERONksxZDRiRTAzZFhaVVJXRjZkWElLVGtnMWRtbFlTa0ZHWWxCR1EyYzFRbk5JT0dkU2JrMXZhMWxHYTBwak1HdGFkakF4ZEZSNlprRnNZMVZNT0U1MVkzRlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYxY1hsVENuQnNOVmRTTXl0elYxRjVXVGs0U1daVmVIY3JXR0pGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5T1JGcHBUV3BOTVUxRVdYcE5hbXhvV2tkUk5GbHFRWGhPVkUxNlRWUnJkMDFVVFhsWlYxWnBDbGt5V1hwTmVsWnJUbTFTYUUxcVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTVFtZHZja0puUlVWQlpGbzFRV2RSUTBKSU1FVmxkMEkxUVVoalFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFZCY2toVFowRkJRVUpCVFVGVFJFSkhRV2xGUVN0MlFWRUtXVmhTUzFkWlNUZG1UMDFuTlZOWFZYbHpUelptUnpWRFZHdEhVbEV2YjBaM2NsbE9VbTlOUTBsUlEyWlhTa1k0YUhvdldYbFRXVkkzVlhsdVExWjFlQXBEWm1wU04zcENObmwwYjJWb2JEVjNOWEF4WTNoNlFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dVFVUkNhMEZxUWtOc2RWZGpjR0prWWxSRldXbHBMMmhTQ25aM01VZHlaemczZFVsNk56RnBWR3gyVVU0dmFGVmxZMjVYTDNNelZrMUJVME5HSzFWb05tNU5WbU5NTDFsTlEwMURjRE5vV2t0UlQwOXRhSFJXWjNvS05UazJTVEZwZGxCTWEzTlJTVFJTVm5CR1RIQlJaRmRITVhKSllVOTRRVlpJV1Rjd056ZHlWaTlwV0hJd2FtVmtjMEU5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666492524,
          "logIndex": 5674111,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "46b23506329add8b01533190132aebcf335d6da2",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3305533559",
      "sha": "46b23506329add8b01533190132aebcf335d6da2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

