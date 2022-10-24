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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:c431de058d7518a829064e0a3d114e915c68683f0db114f1f3b663fdb41f59aa`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c431de058d7518a829064e0a3d114e915c68683f0db114f1f3b663fdb41f59aa) | `amd64` |


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
        "docker-manifest-digest": "sha256:c431de058d7518a829064e0a3d114e915c68683f0db114f1f3b663fdb41f59aa"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "32a925ddbaab4f59bc38ae235633108e43d2fd02",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIB9kjNgnls6h1Hqou5OeBSMdk+kASc9JlB3KW/70XOILAiAMk80ug1nzC+d1JlihcN9uvXY8inwydGKMsbfY52Nwtw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwZWNjY2ZlOWIxYzA5ZDYxNzk4NDk0MzVhYmMxMmQ3MmExMWYxMDkxYTE3OWRmODZiODk4YTQyMjE0ZDY3NmI0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQWZaY2FzbzFZcUE4YjdJQm9yN2NTRUo2eFRmektVSHhhVEJ1ZXB2VjRlMEFpRUFqRmFRd1Y5QnNDSHcwcUdXc2xzNEpUNzNlNXAvVEYzT3ljT05hV1NobGhVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwcFowRjNTVUpCWjBsVldXRm1lVmRKWnpBMlJTOTRaRVZKWkRWR2Exb3lXWEI0VURsRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RCTlJFa3dUbnBKTWxkb1kwNU5ha2w0VFVSSk1FMUVTVEZPZWtreVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1VlRKdlVXTm5OVlUzTlRkVldHSkRPVzkwY21SSU0zSXpWbU5MT1c5U1dsSjFWbmtLS3pkU1RVMTNURFJaUkdwclkybDRTWE5YUjFWQlRIUldVRk5NYjJwVlMyZE9iVVJpYTJ0aVFsZERabHBaUzIwMU5rdFBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZVU1hVMENrMVlRbE5NWW5aWVIyMHpiMU5sY0RaWFdGbGtNa000ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5TmVrcG9UMVJKTVZwSFVtbFpWMFpwVGtkWk1VOVhTbXBOZW1ob1dsUkplazVVV1hwTmVrVjNDazlIVlRCTk1sRjVXbTFSZDAxcVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTVFtZHZja0puUlVWQlpGbzFRV2RSUTBKSU1FVmxkMEkxUVVoalFVTkhRMU00UTJoVENpOHlhRVl3WkVaeVNqUlRZMUpYWTFseVFsazVkM3BxVTJKbFlUaEpaMWt5WWpOSlFVRkJSMFZDSzA1SGNXZEJRVUpCVFVGVFJFSkhRV2xGUVd4bVNVTUtLMloxZVZGUksybHplV293ZUVWMlZ5OVlNbVl3V0ZkUmRrazNjek5FWWxKS1YwdHRRMFpGUTBsUlEzbGxVRGRDYUcxQmVVWmtWVlZhTW1kMllqbFFaQXBVU1ZwdVFqSkxMMms0U1ZOd2FXcHlhVEZVT1ZacVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1d1FVUkNiVUZxUlVFMlprVlNUa3R2UVZaSWQyeGFibGR4Q2xnMU1rVnJhbkU1T0VWSGVIcFZieXMyVFhCTk1IVlJkR3NyY0VaVWNESXdVbEpLVWxZclNHSk5NMFprUVUxMWNFRnFSVUZ3YjFNM1VVVnBWWG94YVhJS09HUnZVVlZ5Wm5KbVZURnBURVFyV1dZd2N6ZHFkMmxUTldkRFRIRnhVeTk1VldSV2NVVmlXakJzVm10SGNEVlllbHB5WXdvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666579649,
          "logIndex": 5734691,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "32a925ddbaab4f59bc38ae235633108e43d2fd02",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3309628086",
      "sha": "32a925ddbaab4f59bc38ae235633108e43d2fd02"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

