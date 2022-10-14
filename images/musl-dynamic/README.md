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
| `1.2.3-r1` `latest` | `sha256:353db58fdcba4ea803afef72e71a6a0c90d798bc2f05908d2998a6b2ac980899`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:353db58fdcba4ea803afef72e71a6a0c90d798bc2f05908d2998a6b2ac980899) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:353db58fdcba4ea803afef72e71a6a0c90d798bc2f05908d2998a6b2ac980899"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c8aa62b1b96660d1f644622127e8da014bead0ed",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFn6yY4ZkUKfZqHRrQqjQY6Y/hAmc0hcgXY3hl/5HQt7AiEA+3LH1Y+7vOVFOjc9A4xFmoQIwlv2eUFHI3ddGg68bpg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1ODQxY2I2M2JmYTM5ZDk3ZWNkM2RlNDYxYmRmMTM3ZTkyOTY4NDhiYjc4MzQ3MmFjNGJkNjkyZmZjNTA2NjA1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ0hKV0NyKzNVSkhvaDF1Rlp1VWNibEVRR2dsRGtkTVppZFFpcHBFM3BzbUFpQWFpNk9SN1htcEptUThHQW9pSkh1WWRPSHhJYlZQUVluNFFORk9ySi8vUGc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhveVowRjNTVUpCWjBsVlQwNDRlSGRZU3pKNE1YTnFlQ3RZWldKbk5IRmpZeXRKTldGcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRCTlJFbDRUWHBCTlZkb1kwNU5ha2w0VFVSRk1FMUVTWGxOZWtFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZsZGpGcFNrUnRVVzFNV0dScmJGRnRUbE4yVjA0MFowUlZiVU14V0ROdFdqRktTMkVLWkdSd05ESmtLekpEYW1vMWEyaG1hUzl0UW5KemQyMVVSa2hGYnpodlJIb3JPRmhYWkVsSU1rWkxTVXBDT1dwd1JUWlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYyWm05ckNtdGFNVkJLYzNsS2JsTlliV1JzZVc5eVEza3lUbWRaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXWHBvYUZsVVdYbFpha1pwVDFSWk1rNXFRbXROVjFreVRrUlJNazFxU1hoTmFtUnNDazlIVW1oTlJFVXdXVzFXYUZwRVFteGFSRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSREZGVWs4eFowRkJRa0ZOUVZKNlFrWUtRV2xGUVhOR2QxSkRWVU5GTldZdlFXVk1WMFYxWkdjMmRWWXhSWGhMYUNzclVsbDRSR2QyY0ZGT1ZqVlhNRkZEU1VkbldFdFllRGhqZEV0TGJtVnhNQXB3VTNZM09Vb3daV294UkRGM1l5OXFTVXh3Wm01eU1rSkNWMGN4VFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVkZFZEUxekwwczJSM0Z3Q25wSFZEQkdWVkUwZVhCSU9EQTVlVXRETTJsSFVUSjNVVEZrVFRZd2RHZFJVSFF5WTFSSFJuQlFaMjh2TVU5bWNWVlNWVXBGVjJ0RFRVWkNkRTFFVUcwS1JsUXljMDF5U0Zab01teE5PWGxRVWxSNFkwNTJla1l6VVhSeE0wVlNMM1ZQTjBOdlRYVXZTMVZpWW1OTlIyWm1NaXNyT1ZGa2Vqa3JVVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665713614,
          "logIndex": 5065256,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "c8aa62b1b96660d1f644622127e8da014bead0ed",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3246971281",
      "sha": "c8aa62b1b96660d1f644622127e8da014bead0ed"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

