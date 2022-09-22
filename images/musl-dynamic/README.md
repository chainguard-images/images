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
| `1.2.3-r1` `latest` | `sha256:cde48057916e7b8daa2d005473551cfdb4e5badf1d711301f03a99ea1193e878`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:cde48057916e7b8daa2d005473551cfdb4e5badf1d711301f03a99ea1193e878) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:cde48057916e7b8daa2d005473551cfdb4e5badf1d711301f03a99ea1193e878"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b1e9ef68559fea9302e1a5dd823e7ce0914fc681",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIGvdq+uCWw6TRVeZXbCslysS/jtz7M7stvcYFeGXtSKsAiA6pqMaRHuXkD0dLiHJ29FO4u5VhrFv4ZKFTWkotRRUOw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4M2QxNTY0ZWJkMGNiYzE2OTU3NzlhNzVmMjE3MTAyZGY0ODU5NmE3YmY1MTdkZmM0MjM3Nzk5ZTg3YzkzZDdjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNvMHFvSFArejIvL1BPOUJDcGt1eXlhbjZpVllYMGJKQmlNWHFTVktYT1hBSWdDS2luY093RlgvZ0dubGFyYmZzckN2Wk9iMFpaejRwMUgvc0V0NS9ld0I4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhveVowRjNTVUpCWjBsVlNTOVVVRk5KWlVGWVkyeFRZMnBPSzNkclJqWk1NbE5oUTNWdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFVXhUMVJGZWxkb1kwNU5ha2wzVDFSSmVVMUVTWGRQVkVWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZwTUZRd1dVWkdRVU5wU1ZSWEwydzJNaXR1U1RVd2IyRkdka0o1YldaR1EzWTViMnNLZDBwSVJqbDJkVFJXUlRGV2RuWjFLemRRV1VreVlqUTNNMWd5WlVScUwwWlRiM1poY1U5YU5uVjBURVJ5V21sQ1RYRlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZOUzIxSENuUjJVakpNT0RsVGNpdFVZWGhKZGxScGEzVldla1YzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXV3BHYkU5WFZtMU9hbWN4VGxSc2JWcFhSVFZOZWtGNVdsUkdhRTVYVW10UFJFbDZDbHBVWkdwYVZFRTFUVlJTYlZsNldUUk5WRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSRmwxZFd0eVFVRkJRa0ZOUVZKNlFrWUtRV2xCZG1oTlRYTkxNMmhNYUhsallteGpTREV4ZG5Gb01GaHlRa2x3YjFWRGRVSk5VV05LUW1wTmJHVmtkMGxvUVV0cFFUaHVLMHBFVWtKR01GY3JVZ28xY1VKMldWUnNVblJFV0RKcVZUWlFlVFZXVkVkck9HcHNlRWxoVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVkZFVkhrd1NIcGhURWhDQ201bVl5czBkMUZCY21OdFpscGllRUpTTmtKQlJFbGtiSHBQYm5WcE1IazFObGxGTVRSc1kxRnZSbWw0V2pabVRtNWhXRXA0TVRSRFRVaDNiSFJ5U1M4S0x6Y3ljVXRXUmxCcFdUTnhkWG92TWtwaVZWcE1SVmt6Um0xemMyWlNiWFU1Y0ZSWlpVUjVPRXQyTjAweWEwMWFkR3RPSzBkM1ptNXJRVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663811990,
          "logIndex": 3714723,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102345584",
      "sha": "b1e9ef68559fea9302e1a5dd823e7ce0914fc681"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

