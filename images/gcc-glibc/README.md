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
| `12` `12-bullseye` `12.2` `12.2-bullseye` `12.2.0` `12.2.0-bullseye` `12.2.0-r6` `bullseye` `latest` | `sha256:98886ac9ec1098bb58b92e8e84225f60838c583885ff0f0bd74b6fec50c5df4b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:98886ac9ec1098bb58b92e8e84225f60838c583885ff0f0bd74b6fec50c5df4b) | `amd64` |


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
        "docker-manifest-digest": "sha256:98886ac9ec1098bb58b92e8e84225f60838c583885ff0f0bd74b6fec50c5df4b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "6314d6129f3b611f531b6123670a1f65d184c876",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/gcc-glibc",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDc2H31DK2QJIe7BnRiEsS59ieTUBGYYPyxfYTYs0VEngIhAORbyeFxYe/68ZTb73/vX8X8N8EvD6x7tGnegVYnyiBo",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwNjk2NWEwMDkwYzBlMmQ1OGRkNDYwZDM4MDUyMDYyNWRhNDhjMWQ1ZDg1NmEyYThjZDQzODFiZDNmNTI2NzQ2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUN5TU4xL3ZDT1Zuc0NNMFdGU3JBQWpMTkVNK0lPUTViR3N4NEtVYUhDcnJnSWdSVE1ERzJBTjJ2YlRPU1dVYVg3Tms1YTRmcktvVmNMNHIxSjR1NTRjdm1rPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwUFowRjNTVUpCWjBsVlYyMHhOV1ZVVWpWNFMycE9OVXRzWkVsQ1p5dHhOMDlGTjFGWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRjVUbXBOZUZkb1kwNU5ha2w0VFVSRmVrMXFRWHBPYWsxNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwU0U5M2NuWXdaMGROVTFoTkwzQXlTemRwUTFaM2FGQk5iMHM0VFcwdlRuZE9la29LUVdSdFJIWlJZbE13YkhGNWRrVlJabFJvVDFCNFdtSmxZWG96YnpsamJqTjVNbWRFVldKQ1JIcFBhVm9yWlVOc1VYRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZEVkVWckNtdEhURGh3YjJKNFFqQXdORzVVVjFOWFRVeE5VRXhCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGM1dVUldVakJTUVZGSUwwSkhSWGRZTkZwa1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkdwWmVURnVZa2RzYVZsNU9IVmFNbXd3WVVoV2FVd3paSFpqYlhSdFlrYzVNMk41T1hsYVYzaHNXVmhPYkV4dWJHaGlWM2hCQ21OdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBkQlVWRkNaemM0ZDBGUlJVVkxNbWd3WkVoQ2VrOXBPSFprUnpseVdsYzBkVmxYVGpBS1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RXUkROV3BpTWpCM1JXZFpTMHQzV1VKQ1FVZEVkbnBCUWtGblVVVmpTRlo2WVVSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5NazE2UlRCYVJGbDRUV3BzYlUweVNUSk5WRVp0VGxSTmVGbHFXWGhOYWsweVRucENhRTFYV1RKT1YxRjRDazlFVW1wUFJHTXlUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRGEwZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVY3lUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eVpHcFplVEZ1WWtkc2FWbDZRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUVZFSjJSamhCUVVGRlFYZENTRTFGVlVOSlVVTm5ORFpFWld0cE1tSUtOVEEyVkd4MlQwZEhNVmxYYUdSQ1Zrb3diazB5VDNneVUyMUdSakJ6VFdSVlowbG5XbFpXYW5ab01tWXJlVmxsSzIxVlNrUkVkRVpoTm5kdmIwUmxZUW94ZFRWaVVsTkRVbkZLZVdodFZEaDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRlJRWGRhWjBsNFFVNXVSRVozUVhrMWJVaDJhM1EwUTBKYVNWQjNjblptQ25KQ1JuQm5UM1ZHVmtkbVowbFZXWFEwZDAwNVUxQmxPRWwwZG1rNE5XdGlXWFZUYTJWdUx6RkdVVWw0UVU0NFJtVndXRlZOUWtoSlMyMXRhMEYxZUVzS1lXeDVhR1JyYlVkaVZXTkdaREl4VFZKd2JIVnVkVzVETW1OUVppczRWMU14UzNJM1VXeENRV1JUVVdnNGR6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665692795,
          "logIndex": 5049489,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/gcc-glibc/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/gcc-glibc",
      "githubWorkflowSha": "6314d6129f3b611f531b6123670a1f65d184c876",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245450771",
      "sha": "6314d6129f3b611f531b6123670a1f65d184c876"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

