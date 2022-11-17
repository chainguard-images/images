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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:7e2121dcc3c79802869bbc70f055fea40d3b62a9b444b31e9e4e1bed5b5b4e18`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7e2121dcc3c79802869bbc70f055fea40d3b62a9b444b31e9e4e1bed5b5b4e18) | `amd64` |


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
        "docker-manifest-digest": "sha256:7e2121dcc3c79802869bbc70f055fea40d3b62a9b444b31e9e4e1bed5b5b4e18"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6475402863f4fc671235e240b5a1de1e6ac7c7ea",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIE2FW5MPzLUbyYh519sssSM5mmQnXbob8b4pF7JgALfGAiApW1EpoTurIGgGQ2Fo40I1bvlZXRP73ZFYYdDO95a3iw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2NjhiYjkxMmQ0ZWJjNjY3YWRmMmY3MTNjODczOTQ1Y2I2N2FmYzYwOWQyMTBkOThkYTU5NTUyODE4NjRmOTQ3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJREtmS3BCQkNiSEgwOWVidm9LNlk2bjBMbjR3Y0xjZE1VZ2N3enJIdm9QV0FpQnd1S1dXRGhpSXgwcTZxZU1iLyt0Und3ajdranZsVjdEUGhrUWlWRCtneHc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwbFowRjNTVUpCWjBsVlZWVmlVVlUwU1V4bE9FOVZaMjV1YzNwRU1YaFJNMEZUZDFWbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlROTlJFVXhUbnBKZDFkb1kwNU5ha2w0VFZSRk0wMUVTWGRPZWtsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVVyV0c5UVNWTlpjMXByWlVvMmRta3lPVmcyZUhCcVRHdE5RMXB6ZERBck5XWkZka1VLVWtkelUxUnJVa1pLZG1sM1RHZG5TakZxYnk5cldURldka3BXYXpSQmRrMXpVRVZMUjJOTWIzTlFZbTFwU2xSaVMyRlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZFVkRkaENrOVJSVVZZYzFoNFZFTnJNRUpqTkhGc2VIQkpVRGhGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5T2FsRXpUbFJSZDAxcVp6Sk5NbGt3V20xTk1rNTZSWGxOZWxac1RXcFJkMWxxVm1oTlYxSnNDazFYVlRKWlYwMHpXWHBrYkZsVVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFUTlVNSGRoYzJKSUNrVlVTbXBIVWpSamJWZGpNMEZ4U2t0WWNtcGxVRXN6TDJnMGNIbG5Remh3TjI4MFFVRkJSMFZuTURSTVVrRkJRVUpCVFVGU2VrSkdRV2xGUVd0V2NqTUtNVkJLY0U5M2RVRTRVR05EWm5oVmRVWnZXRUZxU1dkdGVGVjNSbGxzZG1Gd1ZuQXJLM3BaUTBsRU56VjNPSE5sVFdoNGQydFllRGg0VHpCR01qbEljd3BaV204NE5WRktaMFUwV21GWWJuVkZURkUwYTAxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1OQlRVZFJRMDFDWlU5bU5GUmtRek54ZGtkM2MwVktNRVJoQ21Wc05FcEdZVmhEWW5GMWJXMTJVbkpZVG5OblNEbG5ZM1oxU1RWVE0zaGpTMEpVU25CRVdVNU9aV3RZY1VGSmQwaDZWbVpIVG5kbFMwVnhjMXBEUlcwS1JXNXFVMWxqZFUwMVVGQnFiMjU0VDAxRU9XRXdNMDgwY210Rk9YZHVPU3RoVkhoVloxWjVNamhxVW0xQlpsQjFDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1668650244,
          "logIndex": 7243298,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "6475402863f4fc671235e240b5a1de1e6ac7c7ea",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484689291",
      "sha": "6475402863f4fc671235e240b5a1de1e6ac7c7ea"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

