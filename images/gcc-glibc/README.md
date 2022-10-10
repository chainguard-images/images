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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:418b916c727060d2c0fcc0be2e2ce77dde32ded13077b327b8fcf09d1ff11734`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:418b916c727060d2c0fcc0be2e2ce77dde32ded13077b327b8fcf09d1ff11734) | `amd64` |


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
        "docker-manifest-digest": "sha256:418b916c727060d2c0fcc0be2e2ce77dde32ded13077b327b8fcf09d1ff11734"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "113802f32fa968367fa7cd64928e38635b79a16c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAwRe4OYZWj3qPSTMEc/ExFd9VSRj6BoUh9P+jwaK7LuAiEAxV7ASYYGJmSfe+FUv7+HtITvjvgJdOX6og82Fyu0DuA=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5Mzc4MGJkZjY2NDgwNGRjMTNiOGY3NTEyZmEwM2JkNzIxYWZjMzE0MGZmZGIwMWFlZDU4MWFlMjExMjYyNjVlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNIUHFkNUptK3hTVjd6R2prUmpSNXhMcEJMVWpobjd4aXlEbE0wYWlUK2dnSWhBUGhMWmt6UjMycktWRzV5YWVISW9OTnVqa3FoZ0REd3RFYUxCMjJkNEJSeCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwaFowRjNTVUpCWjBsVlNEUnJaSFJuUkVKR1oxSmhNbnBOTWxWWWVHZHROSEpHYWs4MGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhkTlJFbDZUV3BSTkZkb1kwNU5ha2w0VFVSRmQwMUVTVEJOYWxFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZYVmxCaFozWnlSMlY2ZFhsdFJEbEdZVzlzZVM5WVNUbDVZbFZ5TW1oWGIyMUlibllLY1dsR1VYRldjSEZhTTBoT2IyRlRSRzFWTmtNeGNIaEZZVFpoY25WNkx6aHhXRTVPU1hkblNEaEdSM1I1TVZSSFZFdFBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1U0VwMENpdHZURWdyU0hoNFFtSjVVRWN3UlRoQ2NHdEpkRE4zZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5TlZFVjZUMFJCZVZwcVRYbGFiVVUxVG1wbmVrNXFaRzFaVkdScVdrUlpNRTlVU1RSYVZFMDBDazVxVFRGWmFtTTFXVlJGTWxsNlFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkS1FtZHZja0puUlVWQlpGbzFRV2RSUTBKSWMwVmxVVUl6UVVoVlFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFIyTjNwaFVIZEJRVUpCVFVGU2FrSkZRV2xCV25veFdqSUtiVGxhTUZVNWFTdGxOa1ExT0VaRWNEZFpibmxsYm01cmJsUndhRGxPZEZCSWVFZE9aVUZKWjJGS04xZGhXVEFyWmtWS1lVc3dMMlU1UkhKRlRtdDBTd3BqZEZOT1NIUTNZakp4YmxGYU9XUlFaR05CZDBObldVbExiMXBKZW1vd1JVRjNUVVJoVVVGM1dtZEplRUZOTTFsMFdWTjZWV1EyYWl0WWVVSllaMDFFQ21zeGFqRnZTRUZSVjBJeEsyeHpTVUV3ZWxZMU5Vd3dia2hHYjJ3d1RuZFhXR2wxWTFCYVdHcFpka1ZhV1hkSmVFRlFiSGN3YkVsQ05uQk1VMUZtUTNFS2FFUTNZMHRpTUVSeFZGWkxiVE5hUjNWbmFWZDNlbTFJWm5Fdk1YSTFaVFYxVjJFck1FSklNbGhFUlhGc1dXOVJiRUU5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665369171,
          "logIndex": 4788521,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "113802f32fa968367fa7cd64928e38635b79a16c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3216514287",
      "sha": "113802f32fa968367fa7cd64928e38635b79a16c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

