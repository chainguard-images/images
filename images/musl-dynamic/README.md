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
| `1.2.3-r1` `latest` | `sha256:c4792a4cda307458ab6f6aeba22c7a32748951e3dbe56757847ba1a54806a79c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c4792a4cda307458ab6f6aeba22c7a32748951e3dbe56757847ba1a54806a79c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:c4792a4cda307458ab6f6aeba22c7a32748951e3dbe56757847ba1a54806a79c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ec67ba5ff5c56bca1becc9b33f4cb7609e582737",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFW+93DqmnSbU5ScRsMx8j3ENxs9QA+DM10wJEeyAmFnAiBfKcPt6QdhQzh9o2Xo6ANl+RzWa4ie3h6bYXDaL17VGA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3ODk4MzRhMDcxNDIzOTNlMjNkMmU0M2E1ZmY4Mjc0MTI4ODc4MDNmODhhN2EzOGJiM2YyYTA0MmFhYTE3MTI2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRkRidXhwTEFyaGZ3Z2U1aG9JSDg2YkNWVFJjWEsrVEZIbHRUbFY1SHBNbkFpQWJ2NnJONk9tcG5wRmNxMXVjS1g1ais0cXp3ZmxtajlDNTdneGNHVlo1N0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhveVowRjNTVUpCWjBsVlNFNW1ObXh5YXpCamRuUm1ZaTlFU0VjeVVHSnNRbXhVYW5ZMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RCTlJFbDRUMFJKTkZkb1kwNU5ha2w0VFVSSk1FMUVTWGxQUkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZYVURSSE5ITnhUSFkyT1hWNU4xa3dOa2xqZUZVMWJ6bGFiV05JWm5Sc1J6TnBXVVVLVm5CMlRuZEdhVkZIWlhkRFpsZGxZbFZLY0RSRWJIWXdaVmRFUVdGS1pYZHBSbmRWU21aQk1VTXZhV1ZDVmpkeVZqWlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUzVGpCbUNtSnpTR2xZTkZsWEsybHBNVWt4UzFOdFVrNU5VMlZSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXbGROTWs0eVNtaE9WMXB0VGxkTk1VNXRTbXBaVkVacFdsZE9hazlYU1hwTk1sa3dDbGt5U1ROT2FrRTFXbFJWTkUxcVkzcE9la0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSVUk0YWtWUlVVRkJRa0ZOUVZKNlFrWUtRV2xDTnpkSmJ6bGtSV1pQZVZobFEycDZiV0l6VFhnMFVVVnJRVFJMWWxOVU5IcEJaMlkzTm5GRk5WQktaMGxvUVUxdmJEaFJOelJGV2tSNE1sSnVTUXBTUmsweGMwcDVRelZRVkRGNFlWa3hiSGxMU1dWeVdYWjFOV0o0VFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVkZEZFZCVFJqZFBXWFpqQ25WbWNGcDJRMWN3ZUZWSFZpOWthbGx5ZG1GUU9HcDVPSGxrV21OWWNFVXlURzR2Y3pSVU5YQldTa2hXU3pVcmRtNWlWVEZKTm1kRFRVTXhkMFZaZGxFS1pUUm9aMFJpVkVaRFRqaDBZVGRtV1dsMFRWSlVWRkJRWkVwRVJtNUpNaTlvU0dSQ1NtcEpPR1pUV2t4RGQwZDJSVTh5WkhjemExbGpRVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666577932,
          "logIndex": 5733457,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "ec67ba5ff5c56bca1becc9b33f4cb7609e582737",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3309528118",
      "sha": "ec67ba5ff5c56bca1becc9b33f4cb7609e582737"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

