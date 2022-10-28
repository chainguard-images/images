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
| `1.2.3-r1` `latest` | `sha256:e915595065770d46843cb506612e3b690565f4f966e4be70f057763ee9403bc7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e915595065770d46843cb506612e3b690565f4f966e4be70f057763ee9403bc7) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:e915595065770d46843cb506612e3b690565f4f966e4be70f057763ee9403bc7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b43379385ed649437c90187eb92e6426cca5efa7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBE+TFbOERhlq7gmfC0Zb7iQQJgielL8W/oEDzC+ZEYZAiEA7O+Bic+QNWQb64dXTeWakbBgG92LHXZTd8ZdW4COVTI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1YzJkMTVkOWI3M2RmMGQxODBhNmViY2RlODFkYjVmZmFlMTc3ZDhjZDBjODg0MzllZDdkMGYwMjI0Y2JhOWRmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR09XZzZxS3VXNlNzbDFqeVlnSGtnVkFtS0xNaDdZRVYyZEZZTU54aElPV0FpRUErRmszakdmODBDdENuTS9oTVVJMUdIUk5DNSs4bXIyMHMyNndDNlhqbFcwPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhveVowRjNTVUpCWjBsVlJqWk1jM2MxTW0xcWVHNVBlVmR4VUhwU1VWVkplazVpUjB0emQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RSTlJFVXhUbFJSTUZkb1kwNU5ha2w0VFVSSk5FMUVTWGRPVkZFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3TUU1eFdsWnpXVXgzU0ZwblZYTnRaVkl3U0M4eU56bFZVRTVRVjFWNFEwaGtjekVLYVVaYU9URkRZVVZRTkdZeU9GaFFXVFZ4ZVZSUmVFTnVRakJCVkV4VE5TdENRVTVwUTJWaWF6RlFiVEJpTW1kU09XRlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6TWpsdkNtdzVTV1ZWZDJ0bGR5OVpNVXA0T0hNMU16RlhjMXBOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXV3BSZWsxNll6Vk5lbWN4V2xkUk1rNUVhekJOZW1ScVQxUkJlRTlFWkd4WmFtdDVDbHBVV1RCTmFscHFXVEpGTVZwWFdtaE9la0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSVWhGTVdwTVFVRkJRa0ZOUVZKNlFrWUtRV2xCY0ZCbFdHUm1OSFpTZUhBdmEwVjJjWGt2ZERZNVptTnpVRTV6TkM5cFRVMXRPRTVMZHpCRGNVWTRRVWxvUVVwcWVtMTNlVzVaWmtSemFESTJaUXBVVkhKdWVXaEVOME5OUmxsV2VreDJWbmR4TWtFeWNXdFNTWFpTVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVVpwUW1nclpuUndaa05ZQ210Q2FESjVTekJNTjNoRFpEbDVLME5XVGxGRlIxRm9NMVp6YzNGeU4xQTBUSFp1WVVJNGEwWkliVE55Y0Rsb1RqaEtSbmwwUVVsNFFVNTJUWGg2TVdRS1p6RkhjbmxGVWxvNFZWTlJNR2hNYlVoUGIwbGlTak5HVjJ4YU1qUlVNRkJZTVRKeFJqbE9ZbkpKVEhOR1YwZHVXR2cwYW5CQ05WaDVVVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666922164,
          "logIndex": 6016087,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "b43379385ed649437c90187eb92e6426cca5efa7",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3342219932",
      "sha": "b43379385ed649437c90187eb92e6426cca5efa7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

