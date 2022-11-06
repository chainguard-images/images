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
| `1.2.3-r1` | `sha256:d90edc1058857946aa925234d35d1eb01d274c1645050ef55804adda1276f990`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d90edc1058857946aa925234d35d1eb01d274c1645050ef55804adda1276f990) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.2.3-r2` `latest` | `sha256:0a9a2d56c11fb4d6e7348f061f3229bf15e737d6e23c32b3c9a59eb4416ca91f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0a9a2d56c11fb4d6e7348f061f3229bf15e737d6e23c32b3c9a59eb4416ca91f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:0a9a2d56c11fb4d6e7348f061f3229bf15e737d6e23c32b3c9a59eb4416ca91f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f54501124f4493ae139cabcedf20179a66e7983e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDm+wrEdBydtKJvPmtECPUpawT6zkGr7BF1J+48CCel5gIhAOIhwEHlbrcqFQZ6qf2pfwAr0tGdFw61upDYr2ZdZPZz",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyOGQxMDg3ZTFkMGU2YzMxZDMxZmM2Nzk1MTFkODlhNGE5NGFlODJhYTcwYzJlNWQyODUwNjVjYzljZmJiMGExIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR2N6SkEyYlRLMWlEWjV0T252VnBuRWlEeFB1MFJEKzhROW5MUXFoa2E0b0FpQm5VVmNmanBmK2xFbERqRzNXVFpPcHdrRzEzVWdnMzY0bk85d2xJdEZqcXc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVlVsYzVTVk4yU0VkWmFHSnJjVE5HYkc1cWJVZzVTR1ZtUVVORmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRKTlJFVXdUa1JKTTFkb1kwNU5ha2w0VFZSQk1rMUVSVEZPUkVrelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUzYm1aTFZtWnNWVk5EWjNJMFVHaFdNa1J2TWxwUVYxaEdPVmhOV2tOcmEwZHRaRU1LWlVaWFpuaG5jakYyWTFZNGJqUkJTa3hsVkV0clVVWmlkVVJyY0hKNVkxTXhSR04zWTBvMFVFdE5RbXhqVmpsMFUyRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwYVRoRENteE9aMlJMVFVoV1dsQlVhekExTmtRMU9GSXZNalZaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXbXBWTUU1VVFYaE5WRWt3V21wUk1FOVVUbWhhVkVWNlQxZE9hRmx0VG14YVIxbDVDazFFUlROUFYwVXlUbTFWTTA5VVozcGFWRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjBwQ1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoelJXVlJRak5CU0ZWQkNqTlVNSGRoYzJKSVJWUktha2RTTkdOdFYyTXpRWEZLUzFoeWFtVlFTek12YURSd2VXZERPSEEzYnpSQlFVRkhSVk53ZUV0blVVRkJRa0ZOUVZKcVFrVUtRV2xCYkZkMGNUSmxVMjFvYTJaQ1dFWjFWWFJRZFZOVU5FWlBUVEZWVVZCVU1XczROVEZYVlcxSWNVUkdkMGxuWVRBemIxUkJZMDVhT1hWd2ExaGxiQXB4YnpseU5tdHlZVGhOY1ZkbmJVcGtiMnd5UTJKaGR6VnZjbk4zUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDNSblJWTnpOU1EwOTFXblJVQ21OeFZTOWljRFpPVEZrNVpHUnJWSEpwWmxCWWJrbDFkazUxYnpGdk5DOUNRbGhXVFhGcU16RlRTVmQwVkd4eGQyTmtXWHBCYWtWQmIxUktRVXBJYTNRS1dVWkpZbXBxYjIxalZGVkJhMmhFU0hkNmRDOTJRMjlFWTBWVmMwbHFMMUZIVlc4d1dHMU1SVnB0YzJwVlVIVjBNVmQ1UkdGU1Yxb0tMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667699098,
          "logIndex": 6591816,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "f54501124f4493ae139cabcedf20179a66e7983e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3402467740",
      "sha": "f54501124f4493ae139cabcedf20179a66e7983e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

