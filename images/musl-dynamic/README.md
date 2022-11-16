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
| `1.2.3-r4` `latest` | `sha256:893984132555bdd69a0e2d4ebecf860e3f2a210611629b5092b91f116b13a516`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:893984132555bdd69a0e2d4ebecf860e3f2a210611629b5092b91f116b13a516) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:893984132555bdd69a0e2d4ebecf860e3f2a210611629b5092b91f116b13a516"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c828962f582d44910adc42e6c4493c6d44f59cf5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICon1luBQQeuKM878dQjhLA95cy8qGcCKLZZLejl2wIiAiAmXF97HFsmFE55UHfWA8uhGps1OkDbOdVIWA82gQJaJg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzZDZjZTIyZWYwZTg5NGIzMGRiMDc5Mzg2OWVhM2M2ZjA1MmI4NzliNDAyODg4MTVjNjM1MWZkZmQ4ZWI4MjQ0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQlNOUks1S29hWEF4czNuSGxqamZtSnB0Z2ltOEkxRHRJVkRsL2hjY1dBa0FpRUEzNjRWYldhUEVoQ1RjYzlxNmFwZ1Z3WHVzYzJsM0VzTVBKNnZRMnJOOVNRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhveVowRjNTVUpCWjBsVlpXZDVNVkpuVDNsTVRVbFNVak00T0dSSWRqZzNLemhSTUVGM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRKTlJFVjVUMFJGTVZkb1kwNU5ha2w0VFZSRk1rMUVSWHBQUkVVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzYjFGeFFrOVlZM0IzUW5BeVNtZGFPWEkwT1hsVmJVRnhPR1JTVEUxVWFHNVBXRklLY0dwWU5WZEJaM0pTWmxaeGVqRkpLMjVYZEhwTGVFbDVSa052Y2psTEx6QjBTV1U1ZGpCYWJ6QjJOVFphUkdsT1owdFBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZCYzBWUUNuaEhTa0pOYjFGS1EzZFdabmhsTkc5RmNqQlBOVlpaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXWHBuZVU5RWF6Sk5iVmt4VDBSS2EwNUVVVFZOVkVKb1drZE5NRTF0VlRKWmVsRXdDazlVVG1wT2JWRXdUa2RaTVU5WFRtMU9WRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNqTlVNSGRoYzJKSVJWUktha2RTTkdOdFYyTXpRWEZLUzFoeWFtVlFTek12YURSd2VXZERPSEEzYnpSQlFVRkhSV1puTUUxSmQwRkJRa0ZOUVZKNlFrWUtRV2xDZVdzNGNWcGlXRVV2VG5reGRHSjJVa0ZsT1ZWVFFta3djbXByUVRZck0yZEdWV3MzTjBVd2JrUnZVVWxvUVV3clNXaEZXVmR3UlVrMVVYRTNhUXAyV0hsbFNqSnRValI1VlZsRE1EaG9UMVJoYUhkdGVDOVVNSEpXVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WTBGTlIxRkRUVVUzU1RCTE5FOXBaQzlWQ2tzcldEVTNObkozVmpNNFduaHhLelEyUTJweWJWQjNOR1JZVWxONlZrRmhjbmRFVFdnd09YSlRWVlZ5SzJwb09YZzFlRE15VVVsM1QxaG1jMWRSWVdRS1QyaGhUalpWYUdsSWNtUjRlakJpYVdSdmFUZ3JPRmRpYW05QmJGVnFNMlV6U21GMFJUbDJTbVZZTW0xeWF5OTROVWxVT1ZKUmRFUUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668562128,
          "logIndex": 7169677,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "c828962f582d44910adc42e6c4493c6d44f59cf5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3475589755",
      "sha": "c828962f582d44910adc42e6c4493c6d44f59cf5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

