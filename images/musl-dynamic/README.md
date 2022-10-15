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
| `1.2.3-r1` `latest` | `sha256:67ea8050b70158d8f282470ad4343f0db6b6ca3cb91bad41d7191e8e7a7311f6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:67ea8050b70158d8f282470ad4343f0db6b6ca3cb91bad41d7191e8e7a7311f6) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:67ea8050b70158d8f282470ad4343f0db6b6ca3cb91bad41d7191e8e7a7311f6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1474c1b75d55ee1c38a9b0fa27b47b71e173e77e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCvFemf/fymI39NlSlhlE4Xhr7uNtCbO4yI7F8WKw2zjQIgRIwhh8cKJsk5azt4uvz4E+zTK+LZ4RPiKU2/RPB/+W4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMjhjNmVlZDlkYzgwY2MyMjg1MDM5ODI1MjAwNzgzNGZjMDJiMmE2MDI3Y2ExNjJjMGYyYTBmZGU3YThlYjNlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQ5OWpPcjk2NHMva3ZwOFkvcXhzOFFqeEFrWnZYZTRLTHBvTlJJcmZodUdRSWhBTWRGaG1ZQk1DNUFlVzZsOWVmRXBSNnpkNkVqWmJZd29lcnovanltaVJXbCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhveVowRjNTVUpCWjBsVlVYbFZiV0o0WnpWcldGQkZVazQzVWpSSloxWXlWVGhQYzJsVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRGTlJFbDNUbFJCTVZkb1kwNU5ha2w0VFVSRk1VMUVTWGhPVkVFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzYkZSMFFuZFBTM0ZvZERGUFJrcGxkRmRTZUhWVlREWkdObWRGZWtwa00yOU5VRFFLTlVKWVRXWTFiRXBQVDBkak5YQnFUMUJYUlhVMFIwVnVRVE5wU2xWcFZtRnFibk5YVlhwaGFXeE1iMUZ0VUVkSlEwdFBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZYY1dkbENsZGhjR3BuWjJSa2NFVXllWGd5YTNSSmRqRm5VV2RuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUVlJSTTA1SFRYaFphbU14V2tSVk1WcFhWWGhaZWswMFdWUnNhVTFIV21oTmFtUnBDazVFWkdsT2VrWnNUVlJqZWxwVVl6TmFWRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSREpYVGtkTlVVRkJRa0ZOUVZKNlFrWUtRV2xDWnlzM1JWTk5iMlY0VUZFeFpqWkdPRlE1WkRod05reDNlbTV1VlM5cGFEa3JXSEkxVkRad1dUSlBaMGxvUVVsaVkyOVdUWEp0Y2t0eVpFVktMd3AzSzNKNGFHMXZWUzlKVEdKWGVWZE5kVEYyV0RWbmFsbDZLM1lyVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WTBGTlIxRkRUVU5IZFZFclpWbHhkVXR0Q2t4V1JWZHFlVzF1VGtkTFkzUmljemxuWkd4UU1VSTNMM05MY0hwaFVtVmlVWHBFUWxkRmFWUjZXRmxRUm5sSWJtVkVUbVpZZDBsM1YyRlZOMUJsTlRRS2JFNXJUemhwVkZwWWNVeDJOazlJU0UxTFdESnplakpsYjJkc1pFaGhZMmh1VVd0Uk5UWlVSSFEyYlhST09YQlBLM1ZMV1d4MWNWa0tMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665799527,
          "logIndex": 5129667,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "1474c1b75d55ee1c38a9b0fa27b47b71e173e77e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3254042038",
      "sha": "1474c1b75d55ee1c38a9b0fa27b47b71e173e77e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

