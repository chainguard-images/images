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
| `1.2.3-r1` `latest` | `sha256:2e92c7dea53d1dd6a4e9c64adff112ae6886bc54d154e5768926ae318da4a5ec`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2e92c7dea53d1dd6a4e9c64adff112ae6886bc54d154e5768926ae318da4a5ec) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:2e92c7dea53d1dd6a4e9c64adff112ae6886bc54d154e5768926ae318da4a5ec"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fbd215c1e0f65ace1901d779f3c64eafa6574a70",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDfofhlOEcwkD5O1/jjjayW8PWecc/p9Syf2pEI7JUlIAiBsfbku9xruSiY2H0W59G7n6uQDe9E3aQKRf5ik/EytWw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2YzIzNTY5ODE2ZjFlZjIwYTJiNTY3ZjlmMmUzMjFlNDEzZDEwMDVmNWJlMDU5MjlmODc5NWUyZWI1NTAwZmE2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ1RTakdsSzA0cEpYeHZneTY4ZTE2cW91c2poU09VWXMxczBVTnV1OW1Ba0FpQjIyQkJleUxKYU9LSzFrdk93b3hSbnNYeXNoalU3ZUk4RUxwTHdlRFRvM2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhveVowRjNTVUpCWjBsVlVUVTFlRUppZUU5VGVWbFdSM1ZxVG1oS1ltaEdla0poTjNKamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFVXhUMVJKTkZkb1kwNU5ha2w0VFVSRmVrMUVTWGRQVkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKYmpkTGRFTTNUMU5TV1d4T1NGZ3lZVk5xZUZSYVJFRkhhV1pzV2pWd2ExTlBjSG9LUmtkc00yeFJVVXh4VWpWblJ5dDFZbmxNUmxocFNFVkhaVmh3ZGxRdlMwZ3pVRXQyU1U5NWNWTnRXVXAyZFdSalRXRlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZpVldackNuUmhUa0ZXUWl0R1YybE9OemsyWjNSU01VcHNiSFZCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXbTFLYTAxcVJURlpla1pzVFVkWk1rNVhSbXBhVkVVMVRVUkdhMDU2WXpWYWFrNXFDazVxVW14WlYxcG9UbXBWTTA1SFJUTk5SRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSSHA0Um5KTFFVRkJRa0ZOUVZKNlFrWUtRV2xCT0dVeVprdFllbFY2WkVOU1p6UXZlbFZSTVZKNFdsbDJRMDVrY1dKRmVrMXBRM3AyVTJ3eE0yMUZkMGxvUVZCMVluaEdSa2czZHk5UFRuVTVaQW93V2s5bmJEQkRTbFl3TVZwblF6Wm1jSG8wVkZSclJtMVljbTFZVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVVZhVVZCUWNEVXdSV2RsQ21KaFZrZGlWa3RSWVhaM01GUlRWbEI0ZGxOUmFVNTJkbkZHTW01WFFWaFlXbmc0UlZKalRVOHJXRzV1YTFRMk4wdFJZVGt5WjBsNFFVNXRja2REWXpZS2EwWldXbVJDV1ZaNldUZzNhVXg1VFRkdVdYaFhaRlZSZVZCRVZ5OUVOSE5GVERJek1GWkNkWHBaWXpsRVlqSTRPVGRuVUZWM1Z6UlBVVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665626388,
          "logIndex": 4998313,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "fbd215c1e0f65ace1901d779f3c64eafa6574a70",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3239155240",
      "sha": "fbd215c1e0f65ace1901d779f3c64eafa6574a70"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

