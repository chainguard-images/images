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
| `1.2.3-r1` `latest` | `sha256:bf1af1f64731bb054ecba10c152741abb29df1cc7cce6d8b280e5f8d585cd8c4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bf1af1f64731bb054ecba10c152741abb29df1cc7cce6d8b280e5f8d585cd8c4) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:bf1af1f64731bb054ecba10c152741abb29df1cc7cce6d8b280e5f8d585cd8c4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d8822de7d7ec04687ecd10b5002017f7a244205f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCn/3IoFUj4WhagVgAntr8n0CRyzBMpQRZyM9tz5MHecwIhAPFTGx9nUBC2R+hFvebY+XmMTaHCpzvozlVHLVDHr6u5",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlNDhhZDUwNjJlM2I1ZTUyYjgxNTkxMzA1MzQxZjJlN2ZkMDBlZTdiZmQwMmY5ZDU2OTg4MmQ3NGZjY2VjY2MyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRW8vcDVNc21hcG11WUlFckZ5V0ZUUEprSk0ycE85dnpOR0NuRkxNVG5pWUFpQmF4amFiRnJPVHdRVzR5V05iejZnK1BMZHZhdnZ6OFNyUHRxV3NBeitKc1E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhveVowRjNTVUpCWjBsVlVsUTNTR2Q1T0dKRloxZzVNVFF4VW5FMldGQmtUR3g0T1VkemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlJFVXdUbFJKTWxkb1kwNU5ha2w0VFZSQmVrMUVSVEZPVkVreVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZqYjNKdU5YZExTbFIyWm5CVFQzcEhSMnR4YVUxQlNYbE9ZekptYldkS01EWmpjalFLSzFGTVdEY3Jha2xpYVZOaGJFMTRkbFZQZDNoM016SnlTWEF5Y0U1NlNGUm9OMGhQUW1aTlIwVkxhM3B4UVhVMFl6WlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY0U0dnMENtRlBXWHBvYkdkU2FGUTRha05tYW1aa1RFSnRPRXB6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXa1JuTkUxcVNtdGFWR1JyVGpKV2FrMUVVVEpQUkdSc1dUSlJlRTFIU1RGTlJFRjVDazFFUlROYWFtUm9UV3BSTUUxcVFURmFha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNqTlVNSGRoYzJKSVJWUktha2RTTkdOdFYyTXpRWEZLUzFoeWFtVlFTek12YURSd2VXZERPSEEzYnpSQlFVRkhSVTk1YjJOclowRkJRa0ZOUVZKNlFrWUtRV2xGUVhkRmVsWjBVVkJGVUZOaE5TdEphVlJhWWxaRGFFSktObWhNTTA1S1RpczJTbWcwTmtSU1VsZDNiRzlEU1VWTFVubFZiVWROTW5WSGVHSmpOQW8zZEdKSlNWWkRNMnBxZEhWd1VXRjBkSFpDVW5KNVpUSmpOVWxoVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5YTBGTlIxbERUVkZEWmxoclMySkRObmRHQ25RNVlqaHZSbWRsWXpaVFR6bFphMkpZYUVoMWNXZFhabE5rUzAweFppc3dSRko1WXpSQ1VHMWFjbEkxTW5CR1R6QTJVVTR5WTNkRFRWRkVVbTFPU2s0S1NEaHplSGxMV0doNU1TdFlNM2hSYlZrd1V6ZG9ha0kyYTBacU9VcDRZMEZuTjI5SEsyOVJVelZvU205cWRsUlphemQxTkd4YWNGRnZTRUU5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667439946,
          "logIndex": 6394609,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "d8822de7d7ec04687ecd10b5002017f7a244205f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3382423077",
      "sha": "d8822de7d7ec04687ecd10b5002017f7a244205f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

