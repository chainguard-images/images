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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:db20d524e59cd52aa25bb761b84d432fc1ac8be4228c4f0ae28ca9468c41da4c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:db20d524e59cd52aa25bb761b84d432fc1ac8be4228c4f0ae28ca9468c41da4c) | `amd64` |


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
        "docker-manifest-digest": "sha256:db20d524e59cd52aa25bb761b84d432fc1ac8be4228c4f0ae28ca9468c41da4c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f6f8b32baae7f026b0a850ec2de8b814513b3986",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQClF5B0+16ikKcgz5iO1Slla4rzNJ3GLplMAih8yaiFVQIhAOapl5NWJsCuBtRSpDT9OplhT412QMFuqsOqLOoatyN3",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzM2VjZWUzOTE2NTg0MDAxYzZmMWZjNmU5MzA1ZjVjN2ZkODk4M2Y4ZDhjMzYyOGZmNjgzZDE5ODgxMGY4ZDQ0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUN3UEsyM091ckVwVU1ObVdSZTdIbFdMU1NCc1FqSWdxMTNJUkhDZVJjYnVnSWdQOEZVSXFDMkN0T3BIMnBpN3pKVzl4MEZFQk5iMkprSld6Vk5QTnNPT1JjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwcFowRjNTVUpCWjBsVldrMU1ibEExTkhwSFIxWm5VamRZVHpoa1IyTTBiVlpzWkU5SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRKTlJFVXhUMFJGZDFkb1kwNU5ha2w0VFZSRk1rMUVTWGRQUkVWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZQWm5KNlpucE5kVmRKZG5FNFZ6TTNiSHBYTDFBMFdtOW1aMDl4YlRKcmVpODRkRWdLUmtWNE5uSjJWVE5zVTFKNVdYVkZTV0k0Y0dwNFVuTTNlakl6TUM5d1RVRkVOMlJ4U0VwTkwwUXpOMHB3Tkd3dmJ6WlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZqVFhabUNuVkRXa1ZUU0VNeFdraFpRWGxTT1RsU2IwcERia052ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5YWFscHRUMGRKZWsxdFNtaFpWMVV6V21wQmVVNXRTWGRaVkdjeFRVZFdhazF0VW14UFIwazBDazFVVVRGTlZFNXBUWHByTkU1cVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTVFtZHZja0puUlVWQlpGbzFRV2RSUTBKSU1FVmxkMEkxUVVoalFUTlVNSGRoYzJKSUNrVlVTbXBIVWpSamJWZGpNMEZ4U2t0WWNtcGxVRXN6TDJnMGNIbG5Remh3TjI4MFFVRkJSMFZtYVdoM01sRkJRVUpCVFVGVFJFSkhRV2xGUVhoUWNWSUtlRkpSTmxscFowNHJTbVZCU2s5a1NGQkdhWG94Y0VGV2QwZFFOalZFZEZkM2VUSk1aelJqUTBsUlF6QlFUa2MyYW1sREwwSmtSRVJhVHpkdmFuSmtXUW8yV0dwd1ZEVlJiSFpVVWtSTlRFc3haR1ZaUm5CRVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1d1FVUkNiVUZxUlVGM1UwYzRkRlpqUlhKQ1NESXdOazVwQ2pSM0wwNUZOa0YzVGtsSk1XeHljMVZGYzNnclIwMVFaamswZERjelRXMU9hR1Y2Tm1NMVJFNVBVV0pGYlZodU1FRnFSVUZxUzB0a1kxZ3dUMlZWV25jS1YxUmFhemQwU1dKclRrTTBiRmxOVkRSc1pucGxVMHhwV1hWNWJIaFdSbVUxTURkMU1GWlVPSEl2WXpoMlYxQlFWVTVyV2dvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1668563894,
          "logIndex": 7171160,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "f6f8b32baae7f026b0a850ec2de8b814513b3986",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3475725107",
      "sha": "f6f8b32baae7f026b0a850ec2de8b814513b3986"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

