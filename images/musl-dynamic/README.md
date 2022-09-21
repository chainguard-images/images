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
| `1.2.3-r1` `latest` | `sha256:fd65d5ae68c3ce16c62c050e012e10fc06286537debf77ae963a1ba84f48011e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fd65d5ae68c3ce16c62c050e012e10fc06286537debf77ae963a1ba84f48011e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:fd65d5ae68c3ce16c62c050e012e10fc06286537debf77ae963a1ba84f48011e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9c26064a590d7f4836e13c664e442ce3b28c97f6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCiH7ACSAJi+3jK4zYGVuDn6e9FMCgjuK7svpgK9yOUDAIhAIyRzC4iHbPxm76rfBj0wvV0yNcib6nuFGzrxA1uj6JS",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmMzUxMjQwZWQ5ZWIxZjkxYzVmZDJmOTgyMWQxZmRjM2UzNmMwZWViMTc5NGM0MTcwMTE5ZTU4NzdjODk2MjM3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSFc2SWY0bkVLWmM5aXpLR1pJVldNcThEOUFGMnNzcjB0TXRlZ2JZNTJIY0FpRUF3Q0dvdTdyZFdPV2NIM0orb1ZXSWpxM0ZtMzE3VDU0SC94OUN2RXdVOVE0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhveVowRjNTVUpCWjBsVlNtcFJOVGRHZWtoRFkybHFPRXRvUlRCdE9XNXJNRkJoVDBkRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJFbDRUV3BCZWxkb1kwNU5ha2wzVDFSSmVFMUVTWGxOYWtGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUZERaRVQzcHdiRGRCYXpOT1dISlpMMUpTTlRneVdtSktTVGN2YWpWT2F6WmpRa1VLVDJWblZVOTZNa2wwYTA4ck56ZHFTalpZYmpVclUxQTJkVXRqZVd0eUsyaGxObmRtWTJoR2NWZzVSRlE1VDIxU2FuRlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSYjFwdUNsSjRURGwxYXpaTVpVUXdkMEZoYTNKRFVUVk5WRXB2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUMWROZVU1cVFUSk9SMFV4VDFSQ2EwNHlXVEJQUkUweVdsUkZlbGw2V1RKT1IxVXdDazVFU21wYVZFNXBUV3BvYWs5VVpHMU9ha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSRmhrUlVoRVFVRkJRa0ZOUVZKNlFrWUtRV2xDWVZSRGNsRm9MMHR2UTFWQ1pWbHhUWFp4T1RKWlMwMU9SSGxOYzBKRlZVOTBjazF0VFZablltRlBRVWxvUVZCYWNVSlFWREl3TjI1Qk9VZFpTd28yTkN0aVFXNXJUWFkyVWtGVllVcFpla05QTWxGeFdsaDZhMk42VFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVkZFV1RaWGRETXlabWN6Q25keGRuZGpPVkpwWTNOb1JtWk9XRzUyUzA5dVNDOWtVVXcxT1d0cE4xQktkbUZKZG5KUE9FNVdWRGRPTjFkWFMxRlVZeXR6YzFGRFRVZHhUVVZVZVV3S2FUQlZMMDF6U1hjMVVHZzVPREZzY2sxTVRHRlVSVkExUmxnellUZFdkbVowTkVNdlZrdG1VVEE1YUhjM1lpOTVaWFJYY0UxYU1EbHRRVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663726341,
          "logIndex": 3645097,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3094728243",
      "sha": "9c26064a590d7f4836e13c664e442ce3b28c97f6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

