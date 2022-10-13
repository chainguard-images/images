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
| `1.2.3-r1` `latest` | `sha256:63b4127da2a13acba16c222ff729da8a8970bf1788b0c83e4b21157daaa3ffa6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:63b4127da2a13acba16c222ff729da8a8970bf1788b0c83e4b21157daaa3ffa6) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:63b4127da2a13acba16c222ff729da8a8970bf1788b0c83e4b21157daaa3ffa6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "a2d7c4b3b03796501266480d9a03882323290adb",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDe07Kqe1HVZiFtBkuPo+hMWz/1ye2kcH/JIUrcK3YysQIgRKhkKZKMdU5Coa/gcSvqslPQd9pg7IDVvJh7MXNPuA4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNzYyMDAwZjA0MzhkM2RmMTNlYzNjODA4ZjdkZTkzMTIxYmRjZTU0MzliYmNiZDYxZTE5MWM1NTVmMjU1YWQ5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQ0eklhMThwNDZKNXgveDlUVktMMjIyaUQ0L0VDWHgvbjBNUi95djdUVUFnSWdYT0ZNSlZuaW0reUx6UUF5Nm51NGlUb1RpdSt3dGlJTC9ObVRQMW9XOWdjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhweFowRjNTVUpCWjBsVldtUkZWRUpOVG1weEwxcEpkR3g1Wm10WFZXZExkWFZCS3pFMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlZHZDRUbXBGTlZkb1kwNU5ha2w0VFVSRmVrMVVaM2xPYWtVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZTUdKbWJVWkJaR3RGYkdjeFpWTmxWa3RTTTJWRU9IcERiMVZQZDJ0cmNWVk1WalVLVmtwRWN6ZEJUVkl6ZGtwRWJXNDRiVlZTVlRoWlQwMVdhRGgxZDJWdU5qVnpiVlo0VlRKYVZYbFRVa1JSTkdaeVJVdFBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKUlUxQ0NqZzRjbGhoSzI0NFVHUmxkWEJ1YjNWTE5HUnZObUZOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFZuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZGWTBoV2VncGhSRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEYUdoTmJWRXpXWHBTYVUweVNYZE5lbU0xVG1wVmQwMVVTVEpPYWxFMFRVZFJOVmxVUVhwUFJHZDVDazE2U1hwTmFtdDNXVmRTYVUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RM2RIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZJYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NakV4WXpKM2RGcEliSFZaVnpGd1dYcEJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHpSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1VVkkzUVVoclFXUjNRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCVGFqY3paRUZCUVVWQmQwSkpUVVZaUTBsUlEwUUtSMHhpYkZObFYydEpUamhOZWxjeU4wTmxNVXhtYkRKbU5GTnJkbTVqTlVORVZsSkRha3haV0ZkM1NXaEJTbWh1TUhSbU9FbFNZblJ6YjNNNVpYSTNVUXBMYzBkS0t6SXZVVTVKVlVvMFUwWTFVak5LTUhkS2QwNU5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSnJRVTFIV1VOTlVVUmFVVkZUZVhoMlNUWktWRE5RQ2xOVlRqWjBRVlJ4VW5vMlprNXpVbk5TZVhCcU1YVkdaR0Z0UlZKaFRWbFphWEpMZFRVM05tcGhjRTFYYjJsc1RsSndWVU5OVVVSelluWnRlbWhEVTAwS01qbDRWa041SzNSWlYxcDNaMGs1U1VsRmNuRnVNME5CVDJsemJISTFRU3QzVGpaMmJqVnZNMDV4UmtWMGJIbFZUMk5rZDFKdlFUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665685006,
          "logIndex": 5043035,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "a2d7c4b3b03796501266480d9a03882323290adb",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3244691998",
      "sha": "a2d7c4b3b03796501266480d9a03882323290adb"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

