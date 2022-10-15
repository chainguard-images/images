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
| `12.2.1_git20220924-r2` `latest` | `sha256:9f6f5fdd3b89a2bfae12e1db7294ebb3d21598f60a28e771a6b8ea66259c2d2e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9f6f5fdd3b89a2bfae12e1db7294ebb3d21598f60a28e771a6b8ea66259c2d2e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:9f6f5fdd3b89a2bfae12e1db7294ebb3d21598f60a28e771a6b8ea66259c2d2e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4b1c04a58dcd3e6c7767dc3cd477f56d8c1bab6c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDZG1OiVxAWwzu5D7tUbnD53GRxI3hHnvJ6CTjrgtMIuAIgV/eqi/ScgtX8YY7C0mTIeYS1CNLKAQOBji8qif+xHI8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwNjRkZmU4NjgyODljZjc4ODA3NDA0ZWVlNjc0ODcxNDI2MWQwNjViN2YwNGQwODZhM2MyNDgyZmYzNmU0YzM2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNFd2Z0cGlrdjc5MVNqWWJXQ0R4ZXVaTmtjV2JBN1ZiNWhGZFNUQ2U3bU1nSWdLcW9HaEkrSFgyeThiVkZKSG8rVUpSY0FZMlcrQ0pFbEhhaEFPL0FnakFvPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwaFowRjNTVUpCWjBsVlEyZFZOakZYWlZWT09YVlRMMGxXWm1weVJ6SjVNa1Z5VjJZNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRGTlJFRXdUbXBSZDFkb1kwNU5ha2w0VFVSRk1VMUVRVEZPYWxGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY2VTJFNE5WbFhjSHBYUkRobFoybEtXbWRsZEdWMGFsTnZkVUZoU3pjM2FFNXlNMmNLY0hSR1dYaHdOa1I0VWtKMll6aElka2MxZEdoWVdGTkRTRVE1WTFaM1RXaFRORXREY2xkTFF6SkZiMUEwTWxsRldqWlBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGTW5WcENsaHlVM0pFTVZWV1dUSlNLMmhRYWxCMVpXcG5jSEJ6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWnpCWmFrWnFUVVJTYUU1VWFHdFpNbEY2V2xSYWFrNTZZekpPTWxKcVRUSk9hMDVFWXpOYWFsVXlDbHBFYUdwTlYwcG9XV3BhYWsxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NbVJxV1hreGRHUllUbk5OUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwZDFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT1VKSWMwRmxVVUl6UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtYzVhMkptUzFGQlFVRlJSRUZGWjNkU1owbG9RVTV1ZVZkV2FrTUtUR3RxU1RGYVoybExhVGxpUnpkNVJEUjZkMHBrYlhSSFJISnJhRVUwVFhsR2RIWnNRV2xGUVRFMVQxTnBNVm8xTWtkRWJXTmhlWEJwVlVjME4wOVVUQXAxUm5CNE5FOHZObGwzSzJsUE4xQlZRbTlOZDBObldVbExiMXBKZW1vd1JVRjNUVVJhZDBGM1drRkpkMk41TTIxaFpHSlpSbEpJVG1kbWRVaFJUVkZpQ21SVVVHbGhPRVI0YURsNk5saHlXWE5yVkc1RVF6bG5WM000YWxSaEwxaHNUbVpTZUVNMlIwdHhhMDh5UVdwQlQxUkpOMnQyU21nM1RXSkhOV04wZGpJS1RFd3pVMDluTlhsSlNucGlWa3QwWmxsclpXOTJVRTA1YkRnM1pFSldVMU5KVDBWUU0xbERNSGt3Um0xRFQyTTlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665794838,
          "logIndex": 5126155,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-musl",
      "githubWorkflowSha": "4b1c04a58dcd3e6c7767dc3cd477f56d8c1bab6c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3253822349",
      "sha": "4b1c04a58dcd3e6c7767dc3cd477f56d8c1bab6c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

