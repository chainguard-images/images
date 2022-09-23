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
| `1.2.3-r1` `latest` | `sha256:4553c4f017373554b334fbd1bbb349a85feb13de4913ef286eea0db0379ea111`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4553c4f017373554b334fbd1bbb349a85feb13de4913ef286eea0db0379ea111) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:4553c4f017373554b334fbd1bbb349a85feb13de4913ef286eea0db0379ea111"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "32ea2ec69f0c7e2068a6d68cb090a5981d89724d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHCuaOchJF60HWYUjVETLDJwWKq5uOvf1N7kPEjDaACTAiA3bmOVzB4aTs+eqj3I4Q3t3KwEyBcmy96oAH9ualexUg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1MTBiODNmOGEyOTk5YTk4N2I1OWI0MTFkM2EwZTM5MzNkZDMwN2U0YTJkYTlkZjBhNDllYWU1NTcwNmE4YzIwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRXUvS1BiZ0JKWnh1VnpReGZGYVVock8zcVBQZzUwQytvdkIyUDhtaVNqMEFpQlk1OVhHb3dKcnU5cUtnN3VQeW5YNjhWV24wOXg3NEtmR1FrYkFNdGNWRnc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVllqZFRNbVV3ZEhWWGVrSm5kblU0V2pGWlJYWkVVV2wxYTIxdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFbDNUbFJGTkZkb1kwNU5ha2wzVDFSSmVrMUVTWGhPVkVVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUxY0ZONWQzaGpSSFprZVU4NVYySnNiMFF5VjJ0T2JtUk1Ta2s1TjIwMU1qUjVhbWNLV21SRFNtVlVRalJSSzFCcEsyRnFlR1ZqZVVNeFJqRkNSbFJxTWxaVmJGZHZSelZyTTNKcWVGZzJjbEk0ZURST01rdFBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNYm5nMUNuVnlWMDVSYW1aNVMxaFlhM0IxTHpOSE4yRXZhVmxGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUWHBLYkZsVVNteFplbGsxV21wQ2FrNHlWWGxOUkZrMFdWUmFhMDVxYUdwWmFrRTFDazFIUlRGUFZHZDRXa1JuTlU1NlNUQmFSRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjBwQ1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoelJXVlJRak5CU0ZWQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSR0ZDWlZKU2QwRkJRa0ZOUVZKcVFrVUtRV2xCVkhVeWFqWTVXVVl2TWxCdmMyVXpTVWh4UW5WR1ZHODRjMWh2WldGdmNqbHFPWFJVTUc1U1RscHRkMGxuUTJkbWQyY3ZjVVpZYkRsQlVqYzVXUXBsYUdKM2VHZExTRzFNYlcxaFIyWmlSR1JrVjA1Vk1YcGthakIzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDNZamhIZGtGSmExWnlTWFJ1Q2xWUksxRkdRbEIzV1drMGVHVnJjMUZYTlVoQlRrdG9Ta1I1WVRSbFZXbEpRV1I0WjJFM2NsRkNaREZ0Wm1SWVpFMDRiSEJCYWtWQmR6QXZjSEJXTW04S2RYQXJRVkJTWTI1YVptUlhLMHRJYUUxQk1YRlVZVlJSUXpCSmFHODNUV1ZPTUhoSE1EY3diRk53VURGcWVXcFFWMVo0UzA5ek1qSUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663898738,
          "logIndex": 3782349,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3109950439",
      "sha": "32ea2ec69f0c7e2068a6d68cb090a5981d89724d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

