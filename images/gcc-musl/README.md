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
| `12.2.1_git20220924-r2` `latest` | `sha256:05193acdc84c09781ca539896d3c19e8697473e9c926e31ec837b21953c34fdd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:05193acdc84c09781ca539896d3c19e8697473e9c926e31ec837b21953c34fdd) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `12.2.1_git20220924-r3` | `sha256:178239dd332aa9d52ddbc6b98f293f8a2d196f090dc5c3fecc9ce4bc0e3b1be9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:178239dd332aa9d52ddbc6b98f293f8a2d196f090dc5c3fecc9ce4bc0e3b1be9) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:05193acdc84c09781ca539896d3c19e8697473e9c926e31ec837b21953c34fdd"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "bf0c8786707b47d8365693e13322def4a8a309bf",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCOKkKBGsmTFZ9lFuedfsBwIdrbwzk0y6KGOUvsGkH19QIhALWHarYMpNGeLsbJ7WgiKHJ8gB1lZEJ9CXVLL3bguI14",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2MmFkYzVkMDEyNjNlNzI3MjZkZmZkZTZhMmZmYTRlMzEzNjljYmEwOWZkOWI0NzRhMjU1N2ViNDE0YTAyYTlmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNiUFpKWDBBV3U3R3N3V3BFbFYyOThNbUdJV0F3UTA2Qy8rQmpTY2NmREpRSWhBUFQ1NmNNWGgwbW80R2ZxRXNRczdzdWpqZzlNTU5rUWFxUDhzZnYxWUV6bSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwWFowRjNTVUpCWjBsVlYyWTJhbUpPYVdGNWJrSjVUWEJNU25wRU5raFJablpOUkRkSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFRXhUV3BSZVZkb1kwNU5ha2w0VFVSRk0wMUVSWGROYWxGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZRYXpab1lXZHBhMVZCVVdkV05sbEhia3BLVUVRdlUybGlXRTh4ZW1kNVJGWXZWelFLWm5OUmRubHZPRUphYVdoNWRHVllkMmhyWm5CMll6QXJhVXBqUms1UlpqQlBRa3RwYVdKR2MxRTJlVzF4VFhCSldIRlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5Y2pGWENqYzJla05RSzFoVGEzQkhXR054VVhWb1ltTXhXVWxqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEYUdsYWFrSnFUMFJqTkU1cVkzZE9Na2t3VGpKUk5FMTZXVEZPYW10NldsUkZlazE2U1hsYVIxWnRDazVIUlRSWlZFMTNUMWRLYlUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NbVJxV1hreGRHUllUbk5OUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtY3JUblIxWmpCQlFVRlJSRUZGWTNkU1VVbG9RVTl2TmxjM1NVVUtTbE52YTI4M1dtOXdNbXBZWjA4M2RDODBNR2QyTlVKblMzcFZjV0pDTUhOalVERnhRV2xCVVRocE4yZG1kRTFETUhwSVNtaE9iMWh5ZFRsdlRHdENVQW9yU3l0eUx6SnhOekIzT0hNNFVVSlpNbXBCUzBKblozRm9hMnBQVUZGUlJFRjNUbTlCUkVKc1FXcEZRVEoyVWpWV2JYWmtXVWw1YVZReE5qQlpiSEJPQ25SdFVGTXdiM2hVTm5scGJuUkVkR01yUVZkdlRWTk5hbTFsZUV0NFZXNXFaRFEwWkdsaU5scFVNbm96UVdwQ1owZ3lNSEZqVWxoeFFqSlhiMFJOV0dZS01VSkJZWGxsWmpNeE5VOVJOMkpVVnpkRVFXaEZRM2hMZUhWbWF6RlRVbUpIUTBSVlFTdHFhVXBQWVZkMkwyczlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665967982,
          "logIndex": 5246003,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-musl",
      "githubWorkflowSha": "bf0c8786707b47d8365693e13322def4a8a309bf",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3261576524",
      "sha": "bf0c8786707b47d8365693e13322def4a8a309bf"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

