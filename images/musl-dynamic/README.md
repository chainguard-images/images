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
| `1.2.3-r1` `latest` | `sha256:aaed5955ec8208cdbc154d6f93dc69c2968c6bfcb8a103193be5538f24bf676f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:aaed5955ec8208cdbc154d6f93dc69c2968c6bfcb8a103193be5538f24bf676f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:aaed5955ec8208cdbc154d6f93dc69c2968c6bfcb8a103193be5538f24bf676f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "82a192d83d244dd14af0b075984fb5f1b08994db",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFWY8jWoo0AmGt7yWPP6TB4qGqYfrP6GufTFSJAgoiOXAiEA85hnjw0ogfLCzEe4ejO/oo8CaL31WPSa+grs3OF833w=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMzIzMWY1NmRkODc1ZmI1NGI5YjJlYmVhZTM3YWQyNmFhYmQxZjk2M2NhYWY0MWY2MWM0MTIzMmIyNWIxZjc5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR3lSd0dhMGpjQWFjNmd5K2JQMGc3L0UxTWpUeDFzN2R3MktROVhldWwrUEFpQk1haXRkVDNYMmdrWVMvR0FxemdTV004bUlmaWtEaTI4N2ZUOVFnYmhJL1E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhveVowRjNTVUpCWjBsVlJGbFRhMnhzVDFkcmMzbE1SVlpxTjJOalJrMXZWbUZVVUd4TmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRWTlJFVXhUbnBOTVZkb1kwNU5ha2w0VFVSQk5VMUVTWGRPZWsweFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1ZUU1M2VUZGpjRk4zTTFVeldHNWljRkZDWkcxSVZrMDRUR3BGZUhReFVVeE1hbFFLUW1Gb1IwOUhOMjFLV2pGa2N6VTFUVWxJWXpGaU5uZGFjVlZITVRGVVMxQnlkREpKUWs5TWRVTlNiazE2Ulc4d2JqWlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZOVW05U0NtNXRibVpUWmxKSE9XUmpZbGhIZW5WUWFtNUZabWRCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUMFJLYUUxVWEzbGFSR2Q2V2tSSk1FNUhVbXROVkZKb1dtcENhVTFFWXpGUFZHY3dDbHB0U1RGYWFrWnBUVVJuTlU5VVVtdFpha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSSFZ1V1M5clowRkJRa0ZOUVZKNlFrWUtRV2xGUVRSb1MySnBVelY0V25kd2VYaDNiRzVoTURKbmRGaENURGRaTVZWelFVWTBUWG80Y2pKSlJ6bENlbEZEU1VoVlFuZ3ZlRlozUWpCWFNtcHNkQXBCY0RrMFUxZFNablJ3VDFnMmJreDZURkZvVUdwVFF6SmlVa292VFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVkZFT1ZCQmNtZGxNemhrQ21VeWIwTlFaVGhLVm00MVltaE1TR2RhV21ORFMzTnZNRUZtUlUxYWEzQnlUM2hHTUVSc1NIazFjVUZxVldSdmVuUkpWRzF4Ym10RFRVSXlNM0puUTJZS2FqbHlMelpCYVRONVVVSjROVWx3VjA0MlpVZHlSVlpLZEhKeFltbFZSMkpJTjNrd1NUSnFiMnc1Y3psYU9FbzBjbUZFUm0xdGVFMTBRVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665280674,
          "logIndex": 4726956,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "82a192d83d244dd14af0b075984fb5f1b08994db",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3212522958",
      "sha": "82a192d83d244dd14af0b075984fb5f1b08994db"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

