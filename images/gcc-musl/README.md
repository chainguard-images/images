# gcc-musl

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/gcc-musl/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/gcc-musl/actions/workflows/release.yaml)

Minimal container image for building C applications (which do not require glibc).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gcc-musl:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `12.2.1_git20220924-r2` `latest` | `sha256:85db049c98e5fecce0d9c9eaf202d74f66533f012618d19ffea2383df3a3ba23`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:85db049c98e5fecce0d9c9eaf202d74f66533f012618d19ffea2383df3a3ba23) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To build the C application in [examples/hello/main.c](examples/hello/main.c):

```
$ docker run --rm -v "${PWD}:/work" cgr.dev/chainguard/gcc-musl examples/hello/main.c -o hello
```

This will write a Linux binary to `./hello`. If you're on Linux and have the musl library, you
should be able to run it directly. Otherwise you can run it in a container e.g:

```
$ docker run --rm -v "$PWD/hello:/hello" cgr.dev/chainguard/musl-dynamic /hello
Hello World!
```

We can also do this all in a multi-stage Dockerfile e.g:

```Dockerfile
FROM cgr.dev/chainguard/gcc-musl as build

COPY hello.c /work/hello.c
RUN cc hello.c -o hello

FROM cgr.dev/chainguard/musl-dynamic

COPY --from=build /work/hello /hello
CMD ["/hello"]
```

And we can also compile statically to be used in environments without musl:


```Dockerfile
FROM cgr.dev/chainguard/gcc-musl as build

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
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/gcc-musl:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/gcc-musl:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/gcc-musl"
      },
      "image": {
        "docker-manifest-digest": "sha256:85db049c98e5fecce0d9c9eaf202d74f66533f012618d19ffea2383df3a3ba23"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "6853114e5ebbe64e45d0457dea206f7a7b25c31d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCpRzzEcbTO0qgkkv/uH/Ibd3KbQVBLlcvOFjtcjF/4qwIhAJ3QW0EYauaLDFQuuBnXlmp7Aj7onbNFpQzpD6Ff+N9l",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2YjEyNjQ3NTM1YTQ4NmQ5YmNjY2JlOGZhZTkzNjk5NTQ1Y2FmNWJkOTdkNTYwMjEyOWRlM2Y1ZmYxMzdkMjk5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNBUDdReDlrRDVrOVZiODBubmRaMG9KNXRpdUFZR3BkVzRWWDVyVmZ6TjRnSWhBTVlEejJrL1F2eXEvaGdxYXIrdnZ6NGdJeFZtVVFZNW5vaEVVSUlGS3d6ZyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwRFowRjNTVUpCWjBsVlJ6UnJiVFF6VHpCa2JEUmpOMWhIWW1KdFdsUXJUMjVGWlRGRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlZGVjRUbXBKZWxkb1kwNU5ha2w0VFVSRmVrMVVWWGxPYWtsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVVyWVdacVN6bHFVUzlEYjFaSlVuUXpVV3RITmpObFNtSlNSa0ozWm5Kc0swOVdhRGtLUWpsNE1YZGhhVzlPZVVKU1ozTXdhVXMxWWxOa1VHdzNabXMzYXlzM1REQldXbnBWY0Vkd2RGRjVkRTRyYVVKNlVqWlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUxVFRCNUNqWkViSFJDVUhKU09ETktiMkpOTldoVU1WQlhWbVEwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGVFFtZHZja0puUlVWQldVOHZUVUZGUTBKQlVuZGtXRTV2VFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUlpORTVVVFhoTlZGSnNUbGRXYVZsdFZUSk9SMVV3VGxkUmQwNUVWVE5hUjFab1RXcEJNbHBxWkdoT01rbDVDazVYVFhwTlYxRjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDB0QldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUllWa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZGxveVRtcE1WekV4WXpKM2QwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFNrSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NITkZaVkZDTTBGSVZVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFTUdWelF6RjNRVUZDUVUxQlVtcENSVUZwUW5KeU9IWnRlR1JUUzNSbk1HY0tjSEI2Y1d4S1RtZG9kR2gwVEc5MGVWVlhMMXBHTjJOWE5HOVBUVWQzU1dkaGFrVmtlbmhWYUdaUU1UZFdLMFZxUnpVM1RuaEVXVFo1UW5BNE5uVnNaQXB2Y2pjck4yVkpRa1ZDV1hkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVVGQmQxcFJTWGREWkc5dWFtWldVbGt5ZEZkRkwybzNNbkYwWVhrMmRVaG9TMmxKQ2tsemFFZEZUVFZuZWxCd2NsSjFXSHB4T1d3d2F6VkJZMGhYVVVsNk9YWlhkU3N5TTBGcVJVRnZhVTlCUkRoNldIWjFVMHRRY0RaalRVOVFhbnAxTlRRS1NteHpZME5tTjBseWNVaFVLMXBwTDBSRWVXVlNNMlJoWm1SMGNrTTVaWFJSVDBReFpEZHZOQW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665674207,
          "logIndex": 5034007,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-musl",
      "githubWorkflowSha": "6853114e5ebbe64e45d0457dea206f7a7b25c31d",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3243552499",
      "sha": "6853114e5ebbe64e45d0457dea206f7a7b25c31d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

