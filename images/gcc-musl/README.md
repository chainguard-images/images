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
| `12.2.1_git20220924-r3` `latest` | `sha256:4984a473b7d3eaba2eeb1fc35bfcf3222b38edb5b557470f3a1d647fd21e9b52`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4984a473b7d3eaba2eeb1fc35bfcf3222b38edb5b557470f3a1d647fd21e9b52) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:4984a473b7d3eaba2eeb1fc35bfcf3222b38edb5b557470f3a1d647fd21e9b52"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1b027053c2f57df37feb7fb72ea0e2c70acd65ac",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFncdzv9IjlcRBT4YPkNrtiaO/GfZGhuZ86oF4cgQ8qZAiEA8HK7TUBqruYDK+xvr0TW8wZQpODprYX+4aWG+z1pt38=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzYmVhMGNhZGE4MGM3MzAxOGI1N2UyM2RhNTcxNGQxODIyNDNkZWMwODEzZmIzZTE5NzE1YzIzYjkxNDRlOWMwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURUYkZZa1h6U0lrdFk0VHBPV1RXWnJaQVArSEs5dHhxd2xaYXBhRCtIb3l3SWhBUHVVMTdRSGphb0tMS2xTV0picFF5UWhGaW54ZUdqM0xCeUdxbjdPcDhpbCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwVFowRjNTVUpCWjBsVVMzSm1aRFZTUkhFNFVHdE9TMjF0TkhsWFdsTjFUR0pEYVVSQlMwSm5aM0ZvYTJwUFVGRlJSRUY2UVRNS1RWSlZkMFYzV1VSV1VWRkxSWGQ0ZW1GWFpIcGtSemw1V2xNMWExcFlXWGhJYWtGalFtZE9Wa0pCVFZSR1dFNXdXak5PTUdJelNteE1WMngxWkVkV2VRcGlWMVpyWVZkR01GcFVRV1ZHZHpCNVRXcEZkMDFxWTNkTlJGRjVUVVJLWVVaM01IbE5ha1YzVFdwamQwMUVWWGxOUkVwaFRVRkJkMWRVUVZSQ1oyTnhDbWhyYWs5UVVVbENRbWRuY1docmFrOVFVVTFDUW5kT1EwRkJVV1l2YjFkSFkwaFdVMFp3VFVRMldVc3lkV2hEVFVwaFR6ZzBhVWMyTTBSeU5VSkJRbGdLUkVGVGREaDBkMEZuWkN0a04waDVjRVp1UVRVMU1VaDRZbGRMU0VWelZYY3plRVZhYUdsb1ltNUlOVVExY1ZSeGJ6UkpRMVpFUTBOQmJFRjNSR2RaUkFwV1VqQlFRVkZJTDBKQlVVUkJaMlZCVFVKTlIwRXhWV1JLVVZGTlRVRnZSME5EYzBkQlVWVkdRbmROUkUxQ01FZEJNVlZrUkdkUlYwSkNVMEY2TWxKR0NtTlJNVXd5U1ZWSmRXNXpRVkl2VjJ4b1IxQjBOMVJCWmtKblRsWklVMDFGUjBSQlYyZENWR1l3SzI1UVZtbFJVbXgyYlc4eVQydHZWbUZNUjB4b2FHc0tVSHBDY1VKblRsWklVa1ZDUVdZNFJWbEVRbVZvYkhodlpFaFNkMk42YjNaTU1tUndaRWRvTVZscE5XcGlNakIyV1RKb2FHRlhOVzVrVjBaNVdrTXhjQXBpVjBadVdsaE5kbG95VG1wTVZ6RXhZekozZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFUm1sTlJFa3pUVVJWZWxsNlNtMU9WR1JyV21wTk0xcHRWbWxPTWxwcFRucEtiRmxVUW14TmJVMHpDazFIUm1wYVJGa3hXVmROZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZExRVmxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVV0ZaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmFNazVxVEZjeE1XTXlkM2RJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUFwamJWWnRZM2s1YjFwWFJtdGplVGwwV1Zkc2RVMUpSMHRDWjI5eVFtZEZSVUZrV2pWQloxRkRRa2gzUldWblFqUkJTRmxCUTBkRFV6aERhRk12TW1oR0NqQmtSbkpLTkZOalVsZGpXWEpDV1RsM2VtcFRZbVZoT0VsbldUSmlNMGxCUVVGSFJVWjFUMDEwWjBGQlFrRk5RVko2UWtaQmFVRlZNSE5PV1hZeVIwNEthMUF4VUhBMFQxQkNiMk5uVkVWNFluRm1Na3gyUVhaWk1UaGxZeXRFYTJWRVVVbG9RVkJpVkhONlZXcFBTVGxRUW5WRmJHTkhTRk1yTWpab05rOXdTd3AyT0N0dU5FaDJkalJXVnpoek1XbFFUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlhMEZOUjFsRFRWRkVPRWRQVDJwc1dUWlRiekZZZDFSQ01WaFhlbWRQQ2t4U1pHOXhWV2ROT1RKcGVYbzVMM2gzWjNWRWJTOXRRblpPZGxKRGJsVlZUeTlIVGs0MlIyUmxjRTFEVFZGRFJ6UkZWR2N5TlN0U1lYaEhRbkZ0ZVdnS1R6TjRjVTl5ZVhjdlRXbFVUa3d4YjBKdVFrbHFSR3RFTjJkVVMyVm9PRmxLUkZVMlQwa3JWRzkzYm5oVVJXTTlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666831347,
          "logIndex": 5944399,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-musl",
      "githubWorkflowSha": "1b027053c2f57df37feb7fb72ea0e2c70acd65ac",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3333609761",
      "sha": "1b027053c2f57df37feb7fb72ea0e2c70acd65ac"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

