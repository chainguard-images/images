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
| `12.2.1_git20220924-r2` | `sha256:6155dbf4b11c4db57dafffa60f0ed26f24cc729fb2b859abec4ecb39e0128b63`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6155dbf4b11c4db57dafffa60f0ed26f24cc729fb2b859abec4ecb39e0128b63) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `12.2.1_git20220924-r3` | `sha256:f0b83d7c71c2d2e2e97b8e12ad80707f2103341b97e2d499ba8e214fda62b025`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f0b83d7c71c2d2e2e97b8e12ad80707f2103341b97e2d499ba8e214fda62b025) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `12.2.1_git20220924-r4` `latest` | `sha256:273143bc7b77ae190e08b965263caa05260a1eb7ae4da4a4d12b226c4a68c651`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:273143bc7b77ae190e08b965263caa05260a1eb7ae4da4a4d12b226c4a68c651) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:273143bc7b77ae190e08b965263caa05260a1eb7ae4da4a4d12b226c4a68c651"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6ff66157ae8ce6398a7703c1f007b1396ef8ba6a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-musl",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCAUwZkEWHo6R+XDMH1B9xZnkyLmEx3XcE/qLOqQbII5wIgH/RGs9wQTPjR2ktZZHWk7c5GdHEWES1T9R8JJA4C4HI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1OTY4ZjMyZDMyMTU2Yzc3YTkwMWQ0OTc5OTNhZjc1YjJkNTZhZWVmZTY3MDFiODY4YTg0YjVmZGMwM2JjZmI0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUMveWltS3YxZW9mY0RlWXRodVJJSmR6WUpxYU1YcFk3ZFdlNTZ5aTZQYmtBSWhBUDJYMy9FVHcrenp0YjdnbEgyWXZlZXVFS1ROUUpvT3oveE44NFhmQkhKbSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwaFowRjNTVUpCWjBsVlMxQm9WRTQ1Vm5vd1RYSkRVRzU0WWxoMFdXTklZMEZsU0M5cmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRGTlJFRjZUa1JWZUZkb1kwNU5ha2w0VFZSRk1VMUVRVEJPUkZWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0VVdKMlZGUnJlSFIzVERkbFFVMVNXaTl1TkVWTVRIcFNSbEV4ZGtGek5IQkpSbm9LZVVWQlEzUjFTblZUVVc1cFJXUmljMWR2U0hkV1dFSkdTV3gyVml0bVV6bDNNR2RVU3pFdmFFWkRNRXhYVkRCVFRFdFBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZrTldGcUNrTXpjbFZxY1ZsbWVYaHJTbGhJVTBGU05uazFUVnBSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURjBaRmhPYzB4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWnpKYWJWa3lUbXBGTVU0eVJteFBSMDVzVG1wTk5VOUhSVE5PZWtGNldYcEdiVTFFUVROWmFrVjZDazlVV214YWFtaHBXVlJhYUUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NbVJxV1hreGRHUllUbk5OUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwZDFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT1VKSWMwRmxVVUl6UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaElhVEY2VFc5QlFVRlJSRUZGWjNkU1owbG9RVTFJTVV4MFJGVUtiRFY1VGxVeVVrYzFMMVZFZG1GcGJGWlpVV2RPWjB0aGVFbGhMMjA0Tm5oNVRtWk1RV2xGUVdselYzcDRha2hCTVZKVU1VMURPRElyZURkNE5WUXhTUW81WjJ3eEszaFFZVWxRVjFoRFVGaHdTemgzZDBObldVbExiMXBKZW1vd1JVRjNUVVJoVVVGM1dtZEplRUZOTldkd0swWlNMelZPYmtWTlJWWmhiV05IQ25aMVNUQmtlRWQzTVRKYWFqbFBUVzR2WXpoTmJuSXlkelJIT0hCVU5FaG1jRmRyWm5GYVJVSm1SMHRUUW5kSmVFRk5hV3BwYzFKcFRuWTVNME50VFZvS1JYRjZZWEYyTVZkSVpHZFhPVXRwZEZNNFJtdG9TMmRqZGk4eGIzTkZjV2szV0RoeWIzazBiV1ZsVFhkNGFrUlJOV2M5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1668472524,
          "logIndex": 7091973,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-musl/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-musl",
      "githubWorkflowSha": "6ff66157ae8ce6398a7703c1f007b1396ef8ba6a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3466374284",
      "sha": "6ff66157ae8ce6398a7703c1f007b1396ef8ba6a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

