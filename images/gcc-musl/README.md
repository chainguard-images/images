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
| `12.2.1_git20220924-r2` `latest` | `sha256:31b0950c0498203d63d23bca11c36a3826c792803de45784df7fbca7ef44008b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:31b0950c0498203d63d23bca11c36a3826c792803de45784df7fbca7ef44008b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:31b0950c0498203d63d23bca11c36a3826c792803de45784df7fbca7ef44008b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "cecbbf61aefc202769f84766a2ab2bcde77d859f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIH4BsEMQFt1o/DIWTfiBnzFxpNBMA3YXRrxzRhHSu9oPAiBg127DXb0vwOEpaSLV7KJuCvZ+Rp1cFm9x0cKvFubycQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwNTRlMDY1OWY5Zjg5NzQwMzY2MmExMDU4NWVkMWE2MWQyZTdjNmEyYTA2YmI4MzZkNzlkZmM1NjFmMTliOTc1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQjlyS1piL0dsdUE0bHZlbVIvLzMxZ1RGTlIwL0JCNVFzQjVpZU53ZzZER0FpQm4xUTZYdGNHUmlOTVBEZE1WcUVDbWg5KzFXOFNHaG5VbDM1OUxHVGRQZUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlFsVlVla3BaVFhoUFozSndZa3g1WkZSTWMwSnZVakl2YUV0cmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlZHdDNUMVJWZDFkb1kwNU5ha2w0VFVSRmVrMVVhM2hQVkZWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUVmxsTmJYRklPVEJoZGxKQlpVOVdNbGQwYWtkMWFsWldWMmczTWtWTFJEWnNTemNLTUhZeFVFMHdjemxoY1dObFlVRkljMDVQYURacmNrUnFZME5EV2pNNVUzbEVVRWxZYTNsRE5tTjJTa2RhV214S05XRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZaZFdsWUNtTjZVbk5WTTFsdGR5c3JjVlphWVdkSlNHOVRZMjlCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGVFFtZHZja0puUlVWQldVOHZUVUZGUTBKQlVuZGtXRTV2VFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwZE9iRmt5U21sYWFsbDRXVmRXYlZsNlNYZE5hbU15VDFkWk5FNUVZekpPYlVWNVdWZEplVmx0VG10YVZHTXpDbHBFWnpGUFYxbDNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDB0QldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUllWa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZGxveVRtcE1WekV4WXpKM2QwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFTUhOREwxZEJRVUZDUVUxQlVucENSa0ZwUlVGeVRrWnlOVUpPUkVGSk5VOEtSRzFyYkZwamJEZ3JVM3BaUTJrM1J6WkRibTlFYlhCaFdHbFBhekJKYzBOSlJ6TXdjVXBOYUc0MGJqWnZRM0YxVFdsQmVFWnFSbnBGWm5oSU1qVlFiZ3BMY2tWSlpVbFlZbk5RTkRCTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OVVVOdlpYRnlOMUJvVW04NFNHcHlPVFpxV2xGNFVGcENRMnBSQ25oSlRVSXJVek4yZEhGSFozcEZabUZNYVZCaVZYRmhZemR4VTNkQllrRm5kV3hoTVd4ck9FTk5SWEEzYjNoU1IyRktWV0Z6WkZsVlpGaFFRbUprVG5RS1UyeFpSSFV5ZFd0cGFWVm5lbUkzTDNOYVZTOU1hbEpyUldsS1VIWnFRV2RWYlc5blJsTTBTVFpuUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665688215,
          "logIndex": 5045489,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-musl",
      "githubWorkflowSha": "cecbbf61aefc202769f84766a2ab2bcde77d859f",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245003622",
      "sha": "cecbbf61aefc202769f84766a2ab2bcde77d859f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

