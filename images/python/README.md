# python

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/python/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/python/actions/workflows/release.yaml)

This is a minimal Python image based on Alpine, using Python apks available on the Alpine Community repositories (not built from source as of now).<br/><br/>While this image is being developed, we will stick to the latest stable Python version which at this moment is `3.10.7`. Supported versions in the long term are TBD.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/python:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:1e6c5345af1e7cf7dcd255a60efd5e5d4e51745680f67732d5e1840bcc88afc6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1e6c5345af1e7cf7dcd255a60efd5e5d4e51745680f67732d5e1840bcc88afc6) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To try out the image, run:

```shell
docker run --rm cgr.dev/chainguard/python python -VV
```

Python version installed 
```
Python 3.10.7 (main, Sep 11 2022, 22:42:41) [GCC 12.1.1 20220630]
```

Pip Version installed 

```shell 
docker run --rm cgr.dev/chainguard/python pip -V
```

```shell
pip 22.2.2 from /usr/lib/python3.10/site-packages/pip (python 3.10)
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/python:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/python:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/python"
      },
      "image": {
        "docker-manifest-digest": "sha256:1e6c5345af1e7cf7dcd255a60efd5e5d4e51745680f67732d5e1840bcc88afc6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9b1aaa06919606c87a3063e0c7eb0feba110ac3d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCWMvFDGuFovIIOzDSGswktuVn1HWx7k8TM+1EkaBmfPQIgPVnyvTvVTRZ2cYfMolTi8h5bLju1dXA9bE/bvrNtGWw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5NTQxNTVjOTNiMGQ0YTM4MWQ0M2I3MDIxY2QwNWU3YzAzZDg1Y2NlZjUwODU1ZTc1YzcwN2I2ZTMzZjllMGE2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQlQrWGRnYXlja3M5Z2p2cElkRHE1c1B0NmQ3VHJsRTFMWlVSaWNBbExyR0FpRUFqdy9TZjhJc1AwVXBMcDlHMk1JSHBnNCtaempNM2d6Mkx4bmppVkd6dTU0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwRFowRjNTVUpCWjBsVlJXdHZiRkpIVGxacmEzRXlSbkZFT1VoS01UTjFiMW94TUUxQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRCTlJFbDNUV3BCZVZkb1kwNU5ha2w0VFZSQk1FMUVTWGhOYWtGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZEWXpkTlluaFRVWEE1YzNKblJYVkpUbEp0SzI1VFREbHlNeTl6Ym5wUVNHeENTRThLUVRBelJXbFdNVmxEV2tsTFUxWk5hMFZ5YUdoaGRWRlNaak5xYldaSmEyNTRhRmxWZEhWSWNUTmxRVEY0ZFdreVFVdFBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlVyYW5jd0NtZEJNREZCYUZBdmJIY3hZbFEzTkZkck9IaEZVVXQzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDlYU1hoWlYwWm9UVVJaTlUxVWF6Sk5SRnBxVDBSa2FFMTZRVEpOTWxWM1dYcGtiRmxxUW0xYVYwcG9DazFVUlhkWlYwMTZXa1JCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFNrSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NITkZaVkZDTTBGSVZVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGVVVZcmMxZDNRVUZDUVUxQlVtcENSVUZwUW00MGRIQlNWazgwYTB0NFdrc0tUQzlFVVdaNFV5OUxMME5hZDNWT0wwVmhSREZ3Wm1kWlJXVTRTR2QzU1dkaFJtZENRbWcxVldWR1pWbFNSa0ZsWlhGT2NtdFBaalpaV0hkWlZFZHVNUW95SzBaeVdHMHphRU5IYjNkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVZGQmQxcG5TWGhCU1c1RE9VdEJObVl4YXpOMFluRmliR0ZzV0Rkck5uVkxlRXR4Q2pBeGJHVmxTMUpHUjFwR1FqSkdXRGhDZVRWeFNUWnNURVI1UjNoVVNGcG5jMkpZS3pOblNYaEJUakZaTWtOcVRUWjFhVGxDVVN0SVYxY3haeTlyUVZFS1lVVnJMMUkxUVRjelpraEJOV3hwU25scFdVUk5OSHBrVERSbVprWnhZMmsyTjNaQlJsb3dlakozUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667527354,
          "logIndex": 6461086,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "9b1aaa06919606c87a3063e0c7eb0feba110ac3d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3390680536",
      "sha": "9b1aaa06919606c87a3063e0c7eb0feba110ac3d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

