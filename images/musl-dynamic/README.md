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
| `1.2.3-r1` `latest` | `sha256:e06f418198ec37a8ff7b088b4bac88781ef5166e0318d6b8cf1decf5bca801de`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e06f418198ec37a8ff7b088b4bac88781ef5166e0318d6b8cf1decf5bca801de) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:e06f418198ec37a8ff7b088b4bac88781ef5166e0318d6b8cf1decf5bca801de"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b5ef534d3011c663dd5d8dd41bfd1d7f53feeaf4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDyfKW65/uJ07vNt0E4eSCgG5H3XkYOAo+UHfHBwGSa5wIgOBt9CMuTgcavZNIp48EqKj6EL1c6vblNOeuUXRs+XbE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZmUzMzQ5Y2JjODU0NmE0NzVmMmY2MGUyNDhmM2ZhNmMzNTRmN2I2MmUyOTBlNzY5ZTU5YWQ5MTYyYzZlZWEzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURUTVU2T1p0Ykt1WHpKSjNYblFhS09lL2I4anFWMDI2NEZwazN1Y1hHUUFnSWdDUUNUZVJ2MkFCNkRvZlE3blc0ZHIweEpOT3RMUXVXeFJFZlFEblRnRExJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhveVowRjNTVUpCWjBsVllVZ3JjVFpDU2xsV05GWnBOSEZ3T0ZKM1VqVnhTa0ZsVUd0VmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hwTlJFVXhUMVJCTlZkb1kwNU5ha2w0VFVSSmVrMUVTWGRQVkVFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZLVFdod1RqWjFXVkJ6YVRkVlNFMTZSVWhCUzFONmNrdEhlbmhLVUZsRlJVVXpSeklLU2tWT1lYTmlTRXAzUVVWUFZGcDBOVGswY1daU2FUQnpjVEJFVFRWck5rTXJTMnhuUkVSUlJTdG9ibVpETnpCcU1HRlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZxVjFWRkNrVlpWbmhhTTAxalFVaEhLMWhtTlRJNU0wVnVRamRGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXV3BXYkZwcVZYcE9SMUY2VFVSRmVGbDZXVEpOTWxKclRsZFJORnBIVVRCTlYwcHRDbHBFUm10T01sa3hUVEphYkZwWFJtMU9SRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSVUZ3UXpKdFVVRkJRa0ZOUVZKNlFrWUtRV2xGUVhwUE9XVmpRM0JNZEN0NlFqYzVPWFZ1SzNOcWRHdE1ia0pFV1hOeU5GTjRjREJTT1hkcGJXazNWVEJEU1VablozSmlVM0k1UTJwemRscGxTd28yTm10QmJVTkhWWEp2ZDBwUGJXSmhRM1ZvUVZVd2EyaExLM0pzVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WTBGTlIxRkRUVU5zU1dvMlJVMVFXbTg1Q2pOREwxSmpaRFY0TWxGTWRFMHlTeTloTTFsUmFEbEhhVmhvVEZsaFdEVTVhbXRvVG1KbVZWSm1WbGxaYUU4eFZVaHJRV2wwWjBsM1drUkROMFZYTTI0S1lVOU9VSE13TDI1d2FrbFFXRk0yYmpSb1UyNUtZalJZVVdvek9UQlhOMGhXWVcxRk9FczJOMEV2ZWs1V016aFNSbUZpV0dGbE5sY0tMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666490374,
          "logIndex": 5672597,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "b5ef534d3011c663dd5d8dd41bfd1d7f53feeaf4",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3305451847",
      "sha": "b5ef534d3011c663dd5d8dd41bfd1d7f53feeaf4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

