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
| `1.2.3-r1` `latest` | `sha256:d42fb8b381042a4f488c2ea281d48565d9a627e12326fcb0ab088f11e8665fd9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d42fb8b381042a4f488c2ea281d48565d9a627e12326fcb0ab088f11e8665fd9) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:d42fb8b381042a4f488c2ea281d48565d9a627e12326fcb0ab088f11e8665fd9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "379cf39911e9eedcf26b76147d518720470434b6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC0yZYKFYVMnMkC17iomaTajoLkv/85HcVADHrxEgUo9wIgDaQ9x7V9PdhEuRoA5WMfr9H2l/n2XnqMJ9C2UBpYiFk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjMGZmZmFkZjcyZWUyYTM2ODBjMzQ1Mzg2ZWNmY2NhZGFkMGViYWEwZGI3OGJmZTBmYzdlMjA1OTkwNzBmOTdjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURoVzRiaW1kTzYyRHZSd2R2dmZnbXBjczFiYkU1YW54YTdmaGhBdDhnQmF3SWdMODhZQWtGU0c0N2d2K25lQ3MzRTVQaW94cGhJSTRraGpjNVhsdXFWVUZzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhvMlowRjNTVUpCWjBsVlMzTlZOemRqUjJaSlkyZGhNelkxTVd4VGFEQkVPRlJSVFVGWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRSTlJFVXdUa1JGTlZkb1kwNU5ha2w0VFVSQk5FMUVSVEZPUkVVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZpVWxCaFpWQlZZVGxrVnpWamRVWkVkSGRwV25OTWQyOUZVR1k1V1VGek5IcEpSRFFLVkZkc1ZHOXllRFJJYTJKdFltSjFkRXBxTjBWMlRqaHVWV2xQU1VGbWNXZEhXbVZ3WkZsWmVUTkpkbFpZUVhCWU5UWlBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwVkc1TkNsazBkM2MzTlZZcmJsUlVhekpvT1hvelNHVkdRbnB2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUWHBqTlZreVdYcFBWR3Q0VFZkVk5WcFhWbXRaTWxsNVRtMUpNMDVxUlRCT01sRXhDazFVWnpOTmFrRXdUbnBCTUUxNlVtbE9ha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB4Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtnd1JXVjNRalZCU0dOQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSSFJWVHlzMGQwRkJRa0ZOUVZORVFrY0tRV2xGUVdwUVJXSktObHBwV0ZNMk5XSXZhMHA0ZG1aclRXNTViWEZGTUVKWmNVOUlURkpxVUVwSFRGVmpWSGREU1ZGRFRHaDVTa0oxYzBsM1FYZDVjQW80TkRscFVIWTBlREUyYkhSWFNHUlhNVXBYY1dsSmFuZEtUVll5VTJwQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG01QlJFSnJRV3BCYmprd05IZENZVmRNQ2toQ1duTlBUa3cyUWtwSVJIUnpTVUptY0RCNVJtOVZiSEJhVkZWS09FOHJZVGhZVFhnd1VreHRWMkozT1daWGJ6SnZVRFJ4T0ZsRFRVaDRXRGhKV1VvS1RTdHdRWGxPV2pkQ1ozaEtWMFZRU0RCeWFFWkRkWGxaZW05b1pEa3hXV1pxZG5OSFoyMUdhM1owUzJJNFNXaEdaMkV6ZEV4NE1FaEZVVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665193497,
          "logIndex": 4666468,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "379cf39911e9eedcf26b76147d518720470434b6",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3208684119",
      "sha": "379cf39911e9eedcf26b76147d518720470434b6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

