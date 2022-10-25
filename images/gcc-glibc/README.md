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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:eb4665de451f079d857ae32f36ba2e614e344ae5bb98b0ec5024a4341eed17f2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:eb4665de451f079d857ae32f36ba2e614e344ae5bb98b0ec5024a4341eed17f2) | `amd64` |


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
        "docker-manifest-digest": "sha256:eb4665de451f079d857ae32f36ba2e614e344ae5bb98b0ec5024a4341eed17f2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b99506bb8cc5e820dc0747e94a68de52506ebe34",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIH6PnEMz5lq/F2ITs/d96TgrJKdh6pdp3V+wEpDfqKjtAiEAoHKPocAdWW1r1fclOZKP7CGDpTrUbUYNk4UYJT0njyU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjMmZkYzIxOGI5NmJjMzExYmY1YmM2YTg2YzEwOTdmMmE2ZDA1YWZhM2JkNzBhM2Q4ZDU2YzUxMTEzZTEzYmZiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUR6Ui82OXpSQ0ZHVUVWZ0lJaFVOZ2JyWEYxaUMxcUdCQ05ORUFaUHZCWXF3SWhBTm5yMEpSNTNGanR3U3p5aUlGditkd0RWalQ5akkzbGV4b05xeVVBZkJMUSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwaFowRjNTVUpCWjBsVVdXeHVWRWRMUjFkS1dXMUNRbllyWjFWQ1drSnpUV3M0YVZSQlMwSm5aM0ZvYTJwUFVGRlJSRUY2UVRNS1RWSlZkMFYzV1VSV1VWRkxSWGQ0ZW1GWFpIcGtSemw1V2xNMWExcFlXWGhJYWtGalFtZE9Wa0pCVFZSR1dFNXdXak5PTUdJelNteE1WMngxWkVkV2VRcGlWMVpyWVZkR01GcFVRV1ZHZHpCNVRXcEZkMDFxVlhkTmFsRjRUVlJPWVVaM01IbE5ha1YzVFdwVmQwMXFWWGhOVkU1aFRVRkJkMWRVUVZSQ1oyTnhDbWhyYWs5UVVVbENRbWRuY1docmFrOVFVVTFDUW5kT1EwRkJVbkZoSzJWTVNtSXdiWFpTVnpodFVERXZPV0ZVYVVSV2EzbE9SbEF2WTBWNlpDdDBhSG9LUm5aSU5sVkNSM05VWTJGall6ZGFNRVZ3YmxwelduUnRhSGhtZEZKRWRrbElWMEZuYzJWaGJWTXpaRVJSWVdWa2J6UkpRMVpxUTBOQmJFbDNSR2RaUkFwV1VqQlFRVkZJTDBKQlVVUkJaMlZCVFVKTlIwRXhWV1JLVVZGTlRVRnZSME5EYzBkQlVWVkdRbmROUkUxQ01FZEJNVlZrUkdkUlYwSkNWREJ3VkRaS0NsVnBlblZVU0VOUVNsazBTR1FyU1dGa1dXc3pORVJCWmtKblRsWklVMDFGUjBSQlYyZENWR1l3SzI1UVZtbFJVbXgyYlc4eVQydHZWbUZNUjB4b2FHc0tVSHBDY2tKblRsWklVa1ZDUVdZNFJWbFVRbVpvYkRGdlpFaFNkMk42YjNaTU1tUndaRWRvTVZscE5XcGlNakIyV1RKb2FHRlhOVzVrVjBaNVdrTXhjQXBpVjBadVdsaE5kbG95VG1wTVYyUnpZVmRLYWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEYUdsUFZHc3hUVVJhYVZscWFHcFplbFpzVDBSSmQxcEhUWGRPZWxFeldsUnJNRmxVV1RSYVIxVXhDazFxVlhkT2JWWnBXbFJOTUUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMnRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZITWs1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NbVJxV1hreGJtSkhiR2xaZWtGa1FtZHZja0puUlVWQldVOHZUVUZGUndwQ1FUbDVXbGRhZWt3eWFHeFpWMUo2VERJeGFHRlhOSGRuV1c5SFEybHpSMEZSVVVJeGJtdERRa0ZKUldaQlVqWkJTR2RCWkdkQlNWbEtUSGRMUmt3dkNtRkZXRkl3VjNOdWFFcDRSbHA0YVhOR2FqTkVUMDVLZERWeWQybENhbHAyWTJkQlFVRlpVVTVCTDA5UlFVRkJSVUYzUWtoTlJWVkRTVWRUTTNaNE9WZ0tRbVJuU2xWNVIyWjNXa3huYjJzeGQydGlNRE0xTm5Cd1ZtaDZNVTlXZUhvMlpIaEZRV2xGUVc0eE5tcHphbkpsZDNwWFQyRTRRbTVHUkc1S1oySnNhZ3B0UlZOdGF6VTNORXB1U25saGNHcG9iMGxaZDBObldVbExiMXBKZW1vd1JVRjNUVVJoUVVGM1dsRkplRUZQTUhwM2FFbERVekEyYkZScVEwbDNNakVyQ2tjd2FERjJUMWQwTTJsV05YWm1RM2hYVjNKRmVUUkdlWEZtT0RCVU1FNVNaRUZHVW5rck0zazRZMkpSVmxGSmQwNVpOV1JYVG01eFREaDVVekV3VERRS1pXSlplbVJ2WTFaUlJXYzJjMFk0VVdkc2VYTk5ibGhtYVhCUFpuSXpRVWd2WW1GUE5tdElWakEwUlVKS1ZXVm5DaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666665677,
          "logIndex": 5806828,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "b99506bb8cc5e820dc0747e94a68de52506ebe34",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3317770989",
      "sha": "b99506bb8cc5e820dc0747e94a68de52506ebe34"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

