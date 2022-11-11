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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:4e35f187122e37527f6c0e48c29d25375b567449a75a1159389fbb1fcdbc5872`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4e35f187122e37527f6c0e48c29d25375b567449a75a1159389fbb1fcdbc5872) | `amd64` |


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
        "docker-manifest-digest": "sha256:4e35f187122e37527f6c0e48c29d25375b567449a75a1159389fbb1fcdbc5872"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0b4c7372a11fde2de75d5ed95cf5beb113254e11",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIGarZETHJIjXupH0INMe77t70kXbk7AzVbmF8clcqQ8aAiBql7XrK01rerujBFqSHVrN35l73Splzh3a/HmhYfm/7g==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmYWU5M2Y0NDJlNjdkN2Q0MTM5ODg1MmM3Zjk5ODQ2MTQ0YWJlYTY3NWZlZDQ1YzJlOWM1YzE3MmJhZDUxOTk0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRkkwaXpTc1pQUUdwRXR3ZlEzTjF6Q1RaZ25TSGI0V0s4Q0hnYXRlM3lEMkFpQUhBaE1pMkRLa01YTTBGNWdTU2wxRlB2YS85bXJrVC9CeXQ3MzRYWFA2Mmc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwbFowRjNTVUpCWjBsVlRrMHdiVU5vV0hRNVozQlJkMWxuYkM4eFEwRmhka2dyTmxwemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhoTlJFbDNUbFJKZVZkb1kwNU5ha2w0VFZSRmVFMUVTWGhPVkVsNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZPTnl0T05DODNVRTVCWlRKMlJqTklXVXBoVERGWFEyNDVaME0wY0M5cGNFc3ZlRWdLUVRCdVQyeGhaR0kyUzFsTFIxRkdjVmd4VWxKWVptSnNSRXRqZGpKUVRVeGtOMGx5YUVRdlppOHZaelY0Um1oTVREWlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZJVm1kNkNsSlpaaXR4TDNrME1GQm5kM2RwU0dOSUwzbHNVV05OZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JtZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVbGpNazV2V2xkU01RcGlSMVYzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5TlIwa3dXWHBqZWs1NlNtaE5WRVp0V2tkVmVWcEhWVE5PVjFFeFdsZFJOVTVYVG0xT1YwcHNDbGxxUlhoTmVra3hUa2RWZUUxVVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUZ3UW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUW5ScVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1V1RKTmRGb3llSEJaYlUxM1NGRlpTMHQzV1VKQ1FVZEVkbnBCUWdwQ1oxRlFZMjFXYldONU9XOWFWMFpyWTNrNWRGbFhiSFZOU1VkTFFtZHZja0puUlVWQlpGbzFRV2RSUTBKSWQwVmxaMEkwUVVoWlFUTlVNSGRoYzJKSUNrVlVTbXBIVWpSamJWZGpNMEZ4U2t0WWNtcGxVRXN6TDJnMGNIbG5Remh3TjI4MFFVRkJSMFZhUnpnNGJWRkJRVUpCVFVGU2VrSkdRV2xGUVdzdlNrVUtRbXhvYUROeVFVSmxaa1J5WkdscmFsRkJMMjV4VEVkelRXeGhObEZqYVRNeVZpOXlabk5SUTBsQlVYUTVTMjFWWkRsSmFsUjZiSGxRVDNWd01EVmlRUXBQVHpCcWRYRXJlbUp6YW1KVVNVUjZZM1pOZDAxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1kQlRVZFZRMDFSUkVORkwwTkRjRWwyVVhWS01HWk1VMjQyQ2tZd09XeEdPREZ5YlVoaWFXODBhM1Z4YlZsdFdrWk5ZVkE1ZDI5c1RYQjZOMUZyVlc1cFdFeHZNSFE0Y0d4alEwMUZNM05ZV1hob1ZUTkVkVFpaV0ZBS1lXbFdlbkJ4VXpSMk9IQXdXV1ZRZWxsbVVYb3ZVbTFSUjIwMGMyYzVkM1pSZVhFelNscGpZa05DVVVabWJHSXhSVUU5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1668132326,
          "logIndex": 6850387,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "0b4c7372a11fde2de75d5ed95cf5beb113254e11",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3441926310",
      "sha": "0b4c7372a11fde2de75d5ed95cf5beb113254e11"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

