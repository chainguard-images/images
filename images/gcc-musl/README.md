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
| `12.2.1_git20220924-r4` `latest` | `sha256:3ebe0809038ba045b2da4bbccb15b08b40ce837c0aebcdfa4d343b5b58bff5cf`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3ebe0809038ba045b2da4bbccb15b08b40ce837c0aebcdfa4d343b5b58bff5cf) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `12.2.1_git20220924-r2` | `sha256:6155dbf4b11c4db57dafffa60f0ed26f24cc729fb2b859abec4ecb39e0128b63`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6155dbf4b11c4db57dafffa60f0ed26f24cc729fb2b859abec4ecb39e0128b63) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `12.2.1_git20220924-r3` | `sha256:f0b83d7c71c2d2e2e97b8e12ad80707f2103341b97e2d499ba8e214fda62b025`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f0b83d7c71c2d2e2e97b8e12ad80707f2103341b97e2d499ba8e214fda62b025) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:3ebe0809038ba045b2da4bbccb15b08b40ce837c0aebcdfa4d343b5b58bff5cf"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f16dfa3ee991f682b1de570b3d4629b6ff5305cd",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDk7mpMrvx0AEKsY/ZaW1TV0PbuWY6fS0izLAm37K0j1gIgLdSOYCbOiqUbkfkFmYl/Ou/exCbb5ZO5l4ay0owUD98=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwZTMzYTZiYTRkYWIzMGNmN2RmYzAwZTg5NjgyYTE0ZmNkNTQ1OTNhYjRhMDdiYTBlZjg0MWVkZjYxZDA5MDZmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNBNjFMaVQ4cG4xeUF2MVkvNjRSOGNZTXdBejhlOU5Ha3FlTGovSGhFTkpRSWhBSkZ6ZmNXanhNU3kvYVlyTHA2T1VOQVJ1L0JCOW9jcUdzSTYyQ0hWNE9KMCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwWFowRjNTVUpCWjBsVlZEUTNjM0JvUTFFeVRsRmtTRWhKWkdscU56RmljSGsyWVZodmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRCTlJFRXdUVVJOTUZkb1kwNU5ha2w0VFZSQk1FMUVRVEZOUkUwd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZFYjBwVmJWaHZRMjlHTTBkV1JVVmllRTl2Y2pCUFRVUm5kR1JQT1ZBNFZtUnBRek1LUXpKc1lVOUdPVEZpZDBWRFRGbE1ZalY1TTJwc1VqbHZTamxEWkhacGNETXhjMlJQWTFGM1VWRk5SR0l4UkVGU2RrdFBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlVyVVhKTUNuZDBWVVpCYjBJNEszYzNOR04yTVdKQ1VIbHBURXBqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEYUcxTlZGcHJXbTFGZWxwWFZUVlBWRVp0VG1wbmVWbHFSbXRhVkZVelRVZEplbHBFVVRKTmFteHBDazV0V20xT1ZFMTNUbGRPYTAxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NbVJxV1hreGRHUllUbk5OUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaEZRVlpHYm5OQlFVRlJSRUZGWTNkU1VVbG9RVXAwVG13dlZUTUthbFYyU3pOUFpFaHZNSEpZUmtzemJuTkNRMnhLV0hKUlZFOXRaMjVMYjI1MFZXTmlRV2xDZFhaRE1rdGpabVV2UVdwdWNVcGhXSG92YTJGclNrVlJNd3ByTUROdmFXVTJhVkZPUTFFMlZEZEhWMVJCUzBKblozRm9hMnBQVUZGUlJFRjNUbkJCUkVKdFFXcEZRVE5WYzIwMmRUQTFVbU5OYjNSTlNUSmtWRVpUQ2pSUlVuQTRPVVVyV0haUGNVOUpjMnd4V0ROM1ZXMTNWV0Z0U2xFdlZrRjJORzQwYjBwRFJVTXhNRXBDUVdwRlFYWkNURFpxTkd0bE5qaFVlVUpoUWpVS1VGTkpkSHA0Y2xKVFIycHNlblpwYlRWRFRVNWxWSEJKVDJaSk9FaENWV3ROVTFCNGRrRmtOMXBpTTIxMlIxRnZDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667522460,
          "logIndex": 6456953,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-musl",
      "githubWorkflowSha": "f16dfa3ee991f682b1de570b3d4629b6ff5305cd",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3390368687",
      "sha": "f16dfa3ee991f682b1de570b3d4629b6ff5305cd"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

