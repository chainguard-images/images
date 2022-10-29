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
| `1.2.3-r1` `latest` | `sha256:3a9be2ca6ad0d0b364a93654626e99fe33cc0d133e34914151d76c5cfcd45526`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3a9be2ca6ad0d0b364a93654626e99fe33cc0d133e34914151d76c5cfcd45526) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:3a9be2ca6ad0d0b364a93654626e99fe33cc0d133e34914151d76c5cfcd45526"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "8d8c3f5460c9f65ac19bd4cd87cc8a66a076af8f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIGiTwJ3Q+oS9eVP5hc3qHklCEcvAlG0BQHTx75YcIs8jAiAnYtPwj2xkgWYoK7ujNsvTvnfIGD+2WnyFPvGPQMduPQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4MDA2ZDFkNjc3YWMzODQ4NjUwOWU4ZTlmZGU1YmZjZTQ4ODIwYzFjNmQzNzRmYTgxNmRkNWE1YzIwNmRmOTA4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJUUMwbWphZGJFUWt5OEhLT2tIR0pyYlpraSs1dmlFY2dBMktHb3BTUkJDa0ZRSWZNbjdsQ2xuMzBzMWNCRENTOGtpdHZrQlFuWUcvbXpPMG4zaU1CWlBqYXc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhveVowRjNTVUpCWjBsVlVIQXpjVEI1VG1wNGRXUkVNamhFYW1oc05FeFRObEJqU21KQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RWTlJFVXdUVlJCTTFkb1kwNU5ha2w0VFVSSk5VMUVSVEZOVkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZoVDJkS2NHeEVObk42TTFFMlZUaFpRazFPVEhnMlZtaEJjM1F6WVRSalZYaEpjWGtLYjBWU1JFSnlSVnBSV25GcVRra3dTRmRUZFZsaVVtSkxOa0ZFVFdOcUx6VjZkM0J6Y0VRd1JrNVFTRW8zU210UFVIRlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ0TkhsV0NpczRXazFuVGxkclpYSmxkRVJLTTNGb2JubEVkSGwzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUMGRSTkZsNlRtMU9WRkV5VFVkTk5WcHFXVEZaVjAxNFQxZEthMDVIVG10UFJHUnFDbGw2YUdoT2FscG9UVVJqTWxsWFdUUmFha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSVWxYV21WNFFVRkJRa0ZOUVZKNlFrWUtRV2xCVUdWNVMxbDBjRE15ZWpWb1oxb3JjbFF3Y0hCUU1HUjJOazFDWjNwcFlXUk1OazExYnpsYU9FdFZkMGxvUVUxV01WWXZVblIwVFhneGRHSmFOQXBqYW5GbVkyVllRalFyWkRBd2QwaHFia3RqUlROaVdtdDBjbFJXVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5YTBGTlIxbERUVkZFWW5NclRteGhSbkZsQ25KYVVUUnlWREJpZEVsbFJsUlZXWEpoTTFoWWVWSkhUV0ZLUW1vM2JGUnFTVzVaT1RrMU9YbG5aMmR0YVUxVU5USlJTRzByYmtWRFRWRkRRWEpqZEZnS1MyeDNTVTVhWVhJM01uSmxURU5hZDBRd2ExRXZPWGt6ZEdjeFdEUllVMHc1ZFRoTE1qTm1jMGRtUzNsUWRGWTVUbUZNVkdodlZVbzFNbmM5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667007686,
          "logIndex": 6075315,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "8d8c3f5460c9f65ac19bd4cd87cc8a66a076af8f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3349598037",
      "sha": "8d8c3f5460c9f65ac19bd4cd87cc8a66a076af8f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

