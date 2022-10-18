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
| `1.2.3-r1` `latest` | `sha256:c7fc01af9fa1c98c707ce9b4be21eb1cb76acce15da8f4f86491f46b3bdd9b21`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c7fc01af9fa1c98c707ce9b4be21eb1cb76acce15da8f4f86491f46b3bdd9b21) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:c7fc01af9fa1c98c707ce9b4be21eb1cb76acce15da8f4f86491f46b3bdd9b21"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "21d6ea86e209ee81603bcd16b32b3754e2046501",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCF6o3a4O9yzqLeEDOJMXS7Vp0DFDD7jq7//xY8Ch0UIAIhALXNWFa6a5xCB9aomUAXMX1lUTFDvPihx9Y9AFIXwsTl",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlMTUwMzE0NmVjYjEwY2FhZTI1MzJkMTc5ODRhOTA3NTI0MTNhNDcyMmQ0ZWFkOGMzMjVhZDU4ZWY4YTFlNDE2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURBQ1JtVU9KQldoUElhd2gza0pwcHY0MEttamZ5QXMxNnIxYzFyUnd4MnZnSWdidGVTVDNhdnpBREVPR2hHbGpKNG1KUHdteDBvY1lsTXlNUVRZMTl1d1g0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhveVowRjNTVUpCWjBsVlEwMVJiWEJSZWpRMWF5OUdiWEJFWlhoVU9EWm9RV1JOWVdnd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRSTlJFbDNUbFJOTWxkb1kwNU5ha2w0VFVSRk5FMUVTWGhPVkUweVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUyU1ZoeWJFVnNabVpaUm1sTFRYbEdOQzl0VW14WFpXWmpOa1JLVFRneGNqTlRia2tLVVdGQ2NUVktXRVp4TmtseFdsbEdLMFp3YVhOWVFVTTNUSGt3YUc1bVJsSnNPVEZaVmxobWJuaDZRM0ZxUjNwTVpYRlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZoVjJZMENrTkpaWEY2UWtkTlN5dHlObGM1TVZCaE1VVklRVXhKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUV3BHYTA1dFZtaFBSRnBzVFdwQk5WcFhWVFJOVkZsM1RUSkthbHBFUlRKWmFrMTVDbGxxVFROT1ZGSnNUV3BCTUU1cVZYZE5WRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSRFpPWWxKd1FVRkJRa0ZOUVZKNlFrWUtRV2xGUVN0dlNXVXZSR2g0WlhCNlQxSTJabGhuY1RsbVl6SlBTRXg1TlhVeFVXaEhTVEpXYlRCYU5IRkVlWE5EU1VjNUx6bGhRbEE0WlN0cFNGTlFad3B5VDI1VlJrVkpWREpvVTB0cFprdzFUMUpXVEdSak5EUnRjMDQyVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVkZEV25NelVFOXlRM1ZGQ2tZemMxSmhObUZuVVcxS1lXbHpNMmt4ZVZkblRWcGFNbll2U3k5b1JqRlNhaXRCVFRrNWNXMDNNVVpuWVZoNEsxRnVRbE42WkZsRFRVVkNWSGRPVUhRS1QxVnRiVWRSZVRGRWVVOHZTelZJVVhka2MxTnhha1JVUkhacGVEazBPWE51T1ZGYU0zTkVUa0ZEVGxsaEt6aERaVEppU0ZWSVltODFaejA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666058755,
          "logIndex": 5319415,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "21d6ea86e209ee81603bcd16b32b3754e2046501",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3270065126",
      "sha": "21d6ea86e209ee81603bcd16b32b3754e2046501"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

