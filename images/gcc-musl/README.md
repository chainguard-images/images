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
| `12.2.1_git20220924-r3` `latest` | `sha256:64cd6fa1c7d847a30bfb801e5c2a2c190fab1bd046fed3e8ef01eca66b54b3f5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:64cd6fa1c7d847a30bfb801e5c2a2c190fab1bd046fed3e8ef01eca66b54b3f5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `12.2.1_git20220924-r2` | `sha256:6155dbf4b11c4db57dafffa60f0ed26f24cc729fb2b859abec4ecb39e0128b63`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6155dbf4b11c4db57dafffa60f0ed26f24cc729fb2b859abec4ecb39e0128b63) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:64cd6fa1c7d847a30bfb801e5c2a2c190fab1bd046fed3e8ef01eca66b54b3f5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a6803b039833431802059103a4b2a1efd0ca936e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGp5DR8E2ooL1lk9a/4IEu1Tg2uHiKSrBFXDJKyXJMnDAiEA5y58KLLh+E6A5kiCRFJysGyRcz5CUaQ1V5FiNxf4dSU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ZmI0MWFkZGU3NzMzOWUyY2RhNmE1MThhZmM0MDI1YTZiNDJhMzFjNmExOGI5ZTlmNjQxYWVlODUxMGY1ZmQ1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQzN3g0Rm9QYlp4U3VaQVplVHpyUHpadXpSZnZtaEZqYjF1Uzc5Nm5qVFFBSWdia2xQWnRoTmdpMGtDMVpsZk9WSkwxSVBZclB6T0hYRUswZGxQOTBxeFVNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwVFowRjNTVUpCWjBsVlNsVk5XREl4VkRKdFN6UnhOMWx5UW5nelYyNVlLMGROV1d4SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RGTlJFRXhUV3BGZWxkb1kwNU5ha2w0VFVSSk1VMUVSWGROYWtWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZVV0dvMk9GUnllSFZLVTJaNFlYVjJNbXhDUmt0WVMyVk1LM0F5WTB0eFdpdFRhMEVLU1RSbVZYaDZMMmRDWW0xSWVEWkJSRFpFV1hKVlUxcFRaamw0V1VwVldpczNhVlZTVUVoRGMwUnVOWHB3WmpWaFkwdFBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUxZERKbkNqQnFNMmRQYkVOVlR6WkdlRUUzVEVReVIyRk1PVE4zZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEYUdoT2FtZDNUVEpKZDAxNmF6Uk5lazB3VFhwRk5FMUVTWGRPVkd0NFRVUk9hRTVIU1hsWlZFWnNDbHB0VVhkWk1rVTFUWHBhYkUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NbVJxV1hreGRHUllUbk5OUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwVVZsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTTjBKSWEwRmtkMEl4UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtaEJlV2RMVHpSQlFVRlJSRUZGV1hkU1FVbG5TVzlqWnpWWk1rWUtOazl1ZVRKaGRtRlBiRmtyTWpGYU9ITmtXa05IVDJWVlVWTXphSFZzYmxkMFJtZERTVWRXWkZVMlptZGliVloyU1hCbkswNTBTM0E0WVhsRVVYSmtTZ294YWxZcmJIVlpTVzl6YWtScVMxUlNUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlhMEZOUjFsRFRWRkVSbEF6U21kMldFUmFRelo2TTJadFQxQkpNM1ZqQ2xod2RFaE5Ra0kxTTJjemVYVnhabkJZY1ZVcldXSllNQ3R0Ym1GbGVEWjBWVXQ0ZUhwdFlsaGpSREJEVFZGRVMwTXljMVJ2YUc1MmNETmphV3A0Y1cwS2VtUTNNaTkwUWxSelYxRTBOa1ZITDB4UVMxaExOWGxoYVRoNVpXOUZZbFpQY1U1TmFIWnJiR2hoU2toRVRFazlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666659167,
          "logIndex": 5801554,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-musl",
      "githubWorkflowSha": "a6803b039833431802059103a4b2a1efd0ca936e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317336216",
      "sha": "a6803b039833431802059103a4b2a1efd0ca936e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

