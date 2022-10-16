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
| `1.2.3-r1` `latest` | `sha256:4453c512d310f868ca9c36fdff71a45d8864182878731dc328dc503a5308efa9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4453c512d310f868ca9c36fdff71a45d8864182878731dc328dc503a5308efa9) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:4453c512d310f868ca9c36fdff71a45d8864182878731dc328dc503a5308efa9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "868b477eba395bedd4dda333cf95ce1dfe5229ca",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCJ2KFnTum5s8IH2P2YwOXJkaARAEivhTsyMMTgOFuVsQIhAIRkxYNzbtM9F/YST4zYk39uuyn0quKwnzwvkR07aEId",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3NDZkMDhkYTU2YWQxYzRiN2FiYjkxYTkwMDNjNTQ2YmJmMzNhODI1YjA2NTAyYTNkZjUzNmQxZGVhODE0MDJmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUREMXR3MExvdFJVMCtlK0NXQllyRzhCYTcrdURLWWRsY0kvTzAwbUNxdG1nSWdFMkxoZzNvQjRhNVk2S1hvWWx2QXZIS2xjZmxYNzEyanp6UkhWUjBLZkNFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhveVowRjNTVUpCWjBsVlNHbzVRV2w2UWtoTlEzSktSekJ4VkUxSmFIUkpUbGN5UjBsUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRKTlJFbDRUVVJOZVZkb1kwNU5ha2w0VFVSRk1rMUVTWGxOUkUxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZLWlM5RFVqRlhaRTFFUjNkNmEzRmxZamRaZDNSbWVHdGxRVVpCZDBwQmRFUk9abklLT1RGRWNXRjRia1pRUmt4TUx6VnVabVpFTkRkelpqZE1WaXRrV0ZOMFdVMXhibEJ2VVZjM2RGbE5lREIzTkVOcGQyRlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZEVkhaeUNrUkxSSFp2YUhndlRYSjRaV3RGWkZKSlZYTm5TV0ZGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUMFJaTkZscVVUTk9NbFpwV1ZSTk5VNVhTbXhhUjFFd1drZFNhRTE2VFhwWk1sazFDazVYVG14TlYxSnRXbFJWZVUxcWJHcFpWRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSRE52Tm1ZMVowRkJRa0ZOUVZKNlFrWUtRV2xGUVRKTFRrVmxNVTF4UlRaRVdWVmtPV3MzUVRrNWR6ZFhWRTFoT1RKUGJXNTRZelk0SzBKWU4zQk9XbWREU1VSR1RFRldVMjVLSzNGckwyMU5jZ28ySzNoUk4yTkdXblV5YjBKRVRGRktVVTFYYUhWc2RsUk1VSEI2VFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5YTBGTlIxbERUVkZEV1VKT1ZFeFNOV042Q25SblJUaFNNRk52UlVWamFtMUJjazVYU2xKeVpIVmhLMlkyVFhGRFVFeHlhVzlJYlhaMlQwTlljVWt3ZGxKRk5UTmtNVXRGSzBGRFRWRkVWR0puWVdzS1pEVTBOVFY2YkRkVFprbDBkRUZDV1dzNFpWRmtjbkIzU0ZaQ0szVTBRVFp0VlZZclUyTkdXa1Z4V214QlVrNUxTVmhaYjNSdlJ5dENiMjg5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665886255,
          "logIndex": 5190121,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "868b477eba395bedd4dda333cf95ce1dfe5229ca",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3257920205",
      "sha": "868b477eba395bedd4dda333cf95ce1dfe5229ca"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

