# musl-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/musl-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/musl-dynamic/actions/workflows/release.yaml)

Base image with just enough files to run static binaries!<br/><br/>This image is meant to be used as a base image only, and is otherwise useless. It contains the `alpine-baselayout-data` package from Alpine, which is just a set of data files needed to support glibc and musl static binaries at runtime.<br/><br/>This image can be used with `ko build`, `docker`, etc, but is only suitable for running static binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/musl-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.2.3-r1` `latest` | `sha256:ee80a5993bb16b4531b85c1a0231603a28491db6fecc81c15e872a4afd2ad311`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ee80a5993bb16b4531b85c1a0231603a28491db6fecc81c15e872a4afd2ad311) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

See the [examples/](./examples/) directory for
an example C program and associated Dockerfile
that can be used with this image.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/musl-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/musl-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/musl-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:ee80a5993bb16b4531b85c1a0231603a28491db6fecc81c15e872a4afd2ad311"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "74407f149b99451908f3105362bd24ab7a5f0083",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCWr9s1O/6RULLoN2Ou4Lwbl8pDsCHJQdIGPCeN6xdMxAIhAMEPnVMgd2xghbB2Q5RM9m8xiSxxCsJyWzMp2sw0mLAD",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzOGU5MTFiMjkxMjkzNjg1YWI2ZTRhOWJiZDgyMDE5ZGU4Y2YwYjU0MDRmYjE5YTk2MDVjZTU3YmQ2YTUxOGMxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR0ZoOTNNbzZXWmdQMXpqa0RZbktNUFlsOU1yQy9jUy83REljUm5Yc01IRkFpRUFzN2FBVkFlL0hhVzNwZXF6Nk1BSWNpNk54Umk3TXdORHNURmM1ZnlGQ3g4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhveVowRjNTVUpCWjBsVlVHaDRWVTVPWnpOdk9VNU9iVXh0Y1RGU1FYbFNlVUo1WW5Jd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlJFVXhUbnBKZVZkb1kwNU5ha2w0VFZSQmVVMUVTWGRPZWtsNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxZWtGdVVWWjFibEJTTTJKRk16bFRlQzlHUmtORFpIcEhhRmRzYzJ4R1UxbDFWMllLSzI5ek9Ga3pWVE5JZFhNNVdHbDFWVWhxVDJwUWJFNWxkVkJNVUdrdlltNTBiVTgxWlVabmFqWTVkbTVNT0RWNlRrdFBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwYVdnckNqQjZOVmhIYTBjM1luZFJWRTlTZDBkbmNIWkhlbGRWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUbnBSTUUxRVpHMU5WRkUxV1dwck5VNUVWWGhQVkVFMFdtcE5lRTFFVlhwT2FrcHBDbHBFU1RCWlYwa3pXVlJXYlUxRVFUUk5la0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNqTlVNSGRoYzJKSVJWUktha2RTTkdOdFYyTXpRWEZLUzFoeWFtVlFTek12YURSd2VXZERPSEEzYnpSQlFVRkhSVTVuTm5ORGQwRkJRa0ZOUVZKNlFrWUtRV2xGUVhaQ1R5dFhTM05UYTFGS1ZXNVJNMWhPU1ZJcmRYZElja0ozYldwUGQwbG1hU3QzYUZjeFNDdEJaV2REU1VGR1JUVnlZbWxCWWtkaVdYUnhWd3BuZW5sR1NpOURha0ZZYkcxa2VGSk9aWEZQV0VWa1VUVTRNMkptVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVkZEWVV4b2NYazRkR3RoQ21Gek5uSkhTbUpIVG14eGFUVlFNMkpVYkVWQ1ZGUmlkbnBNYTBKNGFGUnlaVGR5WlU5Q1FWWm9ha1p0VWxsdU1raGhVRUppYmpoRFRVUk9jVXhhWXpFS1dHMWhPVXQyYjFWMFRYTktZMVZYVVc5ck9YbDJaa1ZCUW5vdk1uRkJiRGs1TWpoSU1WSmhka0ZpU2xaRmRtRkVaVzkxVVdGRVZXdzRRVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667354283,
          "logIndex": 6326554,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "74407f149b99451908f3105362bd24ab7a5f0083",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3374269247",
      "sha": "74407f149b99451908f3105362bd24ab7a5f0083"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

