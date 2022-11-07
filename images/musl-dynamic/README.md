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
| `1.2.3-r2` `latest` | `sha256:59c6dd6dc593a01a27aba122ee664cecde295f87d788ebbe830910a95a9f96a7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:59c6dd6dc593a01a27aba122ee664cecde295f87d788ebbe830910a95a9f96a7) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.2.3-r1` | `sha256:d90edc1058857946aa925234d35d1eb01d274c1645050ef55804adda1276f990`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d90edc1058857946aa925234d35d1eb01d274c1645050ef55804adda1276f990) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:59c6dd6dc593a01a27aba122ee664cecde295f87d788ebbe830910a95a9f96a7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "00c92753e1e188da5c7689d2e3dd79dbe6163206",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAd2rZ7sBaUAZQIpQ6wGI6wnNira/pr4YRdpik/8mY4YAiEAsoyDdCvP61DTtYOkqspZEYHt/X3ms1FC3s/Jw+jvMIs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlYjI5MTk2Mzc3NTUxZTZhNGY5ZWI2ZDZkYmNhNzA4NWZiYzEzMWIxNjBlODJlODQ5Y2Q3NjQ4YzI1NTVjOTA2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUN2cVc0QWhpWkJ3MTcvclJFL2pkRFU1NWVrczRWZy9GYnFncTU2T1JZN3hnSWhBT2VJUU9DRVlsSllhelpVRmdTRkhJZnFQeFBwQ08xaGNqZTh5c2hkY0RKRyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVlQwZDFUVTVPV1Zod2RFeG5ZelZqWjBOV09DdFdTbEpsVDBKQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFVXdUVVJCTVZkb1kwNU5ha2w0VFZSQk0wMUVSVEZOUkVFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKTTBSWlQxQnBZMmh6U25kdWJYTlBXWGxKWXpGYU1GVlJUWFJNY1hCelRXSXpaMHdLVDFCcmRrdDRWVmw0U0dSamFrUm5VSEZZVlhVeGRXZDZhREJ4ZWtFclMxUTFla0ZwVGs1VmVISTRlWE55U2xRcmNUWlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ0V0ZSQ0NsSlhTRGhIVURFNFpTOTBZMFEyUzNGUEwwTjBNbFZqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUVVJDYWs5VVNUTk9WRTVzVFZkVmVFOUVhR3RaVkZacVRucFpORTlYVVhsYVZFNXJDbHBFWXpWYVIwcHNUbXBGTWsxNlNYZE9ha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjBwQ1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoelJXVlJRak5CU0ZWQkNqTlVNSGRoYzJKSVJWUktha2RTTkdOdFYyTXpRWEZLUzFoeWFtVlFTek12YURSd2VXZERPSEEzYnpSQlFVRkhSVlEzTm01bFowRkJRa0ZOUVZKcVFrVUtRV2xCTW5NeldFNHdibGgyWlc1cFFuYzBXVGMzVkV4ck1HSnJWV1ZvZW1sQ1VsWlFWemt6ZUc5VVVEQkpRVWxuVGt0TVNHZDVjek5aWVV0c2QyZDRTUW8zY21SMVlrNTZia1p4YkVabVJucEhjRzR6YUZOWk1HeGtSMk4zUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDRRVTVsV2xsclVXbEJhVkJ2Q2xoSFdVOTJRV3BFYlRVNE1uUjJlRGxwTkZVME1YRkRkakpuZFROeVpTc3phaXRIWm5kdVdVaGtNVXRXV2xFNFJITk1kMjFSZDBsM1kxTkxiMVZuWmpFS1FYZFpSRWhQYzB3M1VreG5OM2hMU0dkQlEweDZjQzlvY20xbGFXVnFjVVozVVdoWlRETXJXVFV3ZVhGMFZYQnBUMDE2T1ZKTVNHMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667785230,
          "logIndex": 6651535,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "00c92753e1e188da5c7689d2e3dd79dbe6163206",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3406927206",
      "sha": "00c92753e1e188da5c7689d2e3dd79dbe6163206"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

