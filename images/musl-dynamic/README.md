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
| `1.2.3-r4` `latest` | `sha256:e6d8724b0f205f580fc60a32651dbc9e2050f9ba10e89dcd0a376f53c9acc470`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e6d8724b0f205f580fc60a32651dbc9e2050f9ba10e89dcd0a376f53c9acc470) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.2.3-r1` | `sha256:d90edc1058857946aa925234d35d1eb01d274c1645050ef55804adda1276f990`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d90edc1058857946aa925234d35d1eb01d274c1645050ef55804adda1276f990) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.2.3-r2` | `sha256:c20eb50943802a18a47511dd7f4789794a46cc9f73c510cb3966b05fbb665a29`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c20eb50943802a18a47511dd7f4789794a46cc9f73c510cb3966b05fbb665a29) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:e6d8724b0f205f580fc60a32651dbc9e2050f9ba10e89dcd0a376f53c9acc470"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9eade82f3ef0c14306f98e7f4392295a67d5b8a2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDhUhDkPs6a3i9y9ZJ5X8aBixP/WmIoblisB1+7KqhLCAiEAxuTvoVvqCyd5PGYrmY+EkKWApU70Sj44nr0AYcaAi8U=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhMzNlMjdkMTFlMTJkMWY1YzI1Mzc4ZmY3NDkyZTRiNjY1NGMyM2Q2M2Y5ZjliOWNiMTEzY2QxMzdkMmY5NjhlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURTZkVnQ2thY2hadGpmQkFIK25BYi9yZ3JnaWNUakZUUVY5TlpSNE9UNE5BSWdBVFJ3R2RFU054R2d2NW1MWTZCSDBOVTBYRTdvTjM2akRWTmJPb2FyQnFzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhwNVowRjNTVUpCWjBsVlRISXhUeTl5V25FMU1qQXZTRTlzVkVSSFdHaHlVV1JvYUdZNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRCTlJFVjZUMFJKTVZkb1kwNU5ha2w0VFZSRk1FMUVSVEJQUkVreFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUzZEVZM1JXRXpkR1ZETldsRFdtNXJPVXMwVTNGdldXaGhXVEV6Tm5wVmVGWmxhMGtLTWxoVk5XVTNOamh1YW1aR09GaFNSMkpoTlhKemIzUkdRVEZYTm1SWVdFRk9SRWRPVGtsUU5sSTBNelZGVDNBdlRYRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6Y3paeENqa3hhRnBMYlZwdVYyWlRSMGhwVlRSWlIxWlJZMkpyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUMWRXYUZwSFZUUk5iVmw2V2xkWmQxbDZSVEJOZWtFeVdtcHJORnBVWkcxT1JFMDFDazFxU1RWT1YwVXlUakpSTVZscWFHaE5ha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjBwQ1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoelJXVlJRak5CU0ZWQkNqTlVNSGRoYzJKSVJWUktha2RTTkdOdFYyTXpRWEZLUzFoeWFtVlFTek12YURSd2VXZERPSEEzYnpSQlFVRkhSV000Yld4bVFVRkJRa0ZOUVZKcVFrVUtRV2xDVUUxd1JWRnlXV04zUjBoeldUTmhiemMyWVU5TlowdDFWbWhJY2l0aWNVUk5aekJPTlRBdmRteFlVVWxuV0VoUlNscFZiRTVPV25oS05FTjZhQXBVZDNSb1dEVjNlSFZSUm5KcmMycG9MMDUyYzNoeU1UbGhOVkYzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZSUVhkYVowbDRRVkI2WkhvM2VVOWxUbmRSQ25kSVkzUmtSRGxoZDA5cVNGbDNLMnRUTVZSV0wwRnFWamcxZVZCeFQyVXdaVkFyZWtzMVVIUkljMjFDVmpNdlVFVmFWMncxVVVsNFFVMW9aR0l3TlZJS2VrSTJUbUpuUjNSRlRGbE5kM2hEZWpWTk9HeExWVTAwUzJsRmFrNURRamhGUkM5RmQzb3hVRll5TTFBelprMWhaVTEwT0U1cFFsWkZVVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1668389930,
          "logIndex": 7023696,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "9eade82f3ef0c14306f98e7f4392295a67d5b8a2",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3457862129",
      "sha": "9eade82f3ef0c14306f98e7f4392295a67d5b8a2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

