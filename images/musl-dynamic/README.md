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
| `1.2.3-r1` `latest` | `sha256:a0c93722352c82a99b3bf3b1eb3e01e6d3083dbca3dce4e0759e89ca2bbaa928`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a0c93722352c82a99b3bf3b1eb3e01e6d3083dbca3dce4e0759e89ca2bbaa928) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:a0c93722352c82a99b3bf3b1eb3e01e6d3083dbca3dce4e0759e89ca2bbaa928"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6b37635ad8d9fd3491c0011b4c0cf56851194562",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCJ5red0Lr9jDlvO/1F0KpFR8iwUJ9jss67q9kZObMLwwIgULpEbWDb3sb3U9vO0YVtp0f1zvcnaO0XV2agos3nXkY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3NjlmNDcwOTBmYjM2ZDc4OGU0MDM1MGMzY2FkNDIxMTllZGY4MzBlOWIxZDhhZWVmMmY3NDIzNDEzNDg0OGY2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJREE5RXZQbSthUDRnQmpSSWtqeEh5Y3dwZmRFamZheUtoWmxUMjFiNnRlUEFpQThIT2dPazNuRjA5UlFsNlBSQ1QxaTlLczJYR0JkU2dQQ3d5NmlNZGhjM2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhveVowRjNTVUpCWjBsVlJXSldjaXRFTkV4clZHMDVNbGxtYW5GMkswODBXbVpTZFcxRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1ROTlJFVXdUbnBOTVZkb1kwNU5ha2w0VFVSSk0wMUVSVEZPZWsweFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY1ZDBscGNsbEpSbXRaVjB0VVJIcFBRVTlyWkhNMWFYTkdWWEphT0VsM09EQnpNR3NLUlRsSWVrNUtVbU0yWVZCeFltOTRkSE00U2tSbVRtaGlUSFJCTVhaT05XRm1Xa1pHUWpjcmVuRTFhRlZ6VUV0TGVFdFBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZwT1M5SkNuWTVOMGRaUkZCWmRIVklTbEJPZUVaaFpUQm1URWRyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUbTFKZWs1NldYcE9WMFpyVDBkUk5WcHRVWHBPUkd0NFdYcEJkMDFVUm1sT1IwMTNDbGt5V1RGT2FtY3hUVlJGTlU1RVZUSk5ha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSVVo0SzFCUFFVRkJRa0ZOUVZKNlFrWUtRV2xDVG5vMWJWUlpZVEJaUzNjd1NXTmlVRzQyVm1GTFpGSkphV29yYXpVNVdscE1NWGxQZEM5WGJsQTNRVWxvUVV0R1duSjBiR3BUSzI5NVFscEJWUXBaVEVOeFJGaG9hR3BNWjBSQlRXeHpLM1kwU3pSb1ZXWlFiWE4yVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5YTBGTlIxbERUVkZEVW5CcFFsYzFNbTluQ2xaS1RWQTBlalkwTDFkS2JXWnpOMWt2ZWxKa09EUmFkR2REV1hKdmFGWmFRVmhJYVhoNWJuSXlVMFo1VURkNVNUaG9WMkZvWVZGRFRWRkVRVk5JUVZBS2RXUmhXV2xTYTI1S00xQkJRV2h0U0doVVlYUTNXR05sTkdOdVRuRlZUVWh6WkVsV1FtcDNja1JCVkc5YWMxa3pXVGxHTmtaUlZVUk9TMGs5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666835274,
          "logIndex": 5947718,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "6b37635ad8d9fd3491c0011b4c0cf56851194562",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3333882506",
      "sha": "6b37635ad8d9fd3491c0011b4c0cf56851194562"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

