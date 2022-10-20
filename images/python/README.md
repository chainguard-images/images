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
| `latest` | `sha256:c7aa28ed59d4f5429873f2c71c3f8b08b9e8138ca5bf3d9a8e400dfba433f7ea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c7aa28ed59d4f5429873f2c71c3f8b08b9e8138ca5bf3d9a8e400dfba433f7ea) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:c7aa28ed59d4f5429873f2c71c3f8b08b9e8138ca5bf3d9a8e400dfba433f7ea"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "401085c579bcc37fd854a9d871842de1b22dbc1a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDvZC2P3qtRGh2SRzv6BAB9VIuZJ3+X0C/JysDdz0bSHAIgNy/kfCfrQnnhRS8uybnf1uVU2uNKkPb4+PC+fWAUqOg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMDAzNmMzNzZkZTQ3ZmIyNDEzMTgyNWY5YzA1YzA5ODFmOTkzMmU2MzFjYTQ0NGZmNzhmNTM3NmFkYjNmM2M3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRCtISHY2NFNvN05Wc3c3M3JMYmk4MzJrTXpNMkV0ZTVobElUOE9FTkpRN0FpRUFoUUVqVnRMR3JKVW9UaUFIZGRpdkh2NFord2laOG5OOHhtcHprT2xpUG1vPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwTFowRjNTVUpCWjBsVlZYQlZOaXRQZFc1WlpISnBXV1Z2UzNBelZXTkhNa3BqY2xsVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlJFbDVUV3BOZDFkb1kwNU5ha2w0VFVSSmQwMUVTWHBOYWsxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZJVDJaSE9FWkNVSHBETVdzd1F6WlpRbUp0ZW10WmJuSjBUbGxGWWpORGMzaE1RazhLWjBseE4za3ZiMXB0UkVkVlIzTjNTVFZhT1ZFMVNreHJhemRxY0ZSeVIxWTROaXRHU21wM1ZYUjJWbGhhWm5ONVVtRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHUVVwMUNpOUxjVW9yVUhOWlJHUlFiWFZRZG5RMFF6bFhjR1YzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDVFUVhoTlJHY3hXWHBWTTA5WFNtcFplazB6V20xUk5FNVVVbWhQVjFFMFRucEZORTVFU210YVZFWnBDazFxU210WmJVMTRXVlJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFT0hwTlJVOTNRVUZDUVUxQlUwUkNSMEZwUlVFNWFuSlhXalI1TWxGamRsSUtSRUV4UTFWVFFqUmtPVTVtZDBWT1ltTlphbEZPT1ZSMGJtNTRjMkZWU1VOSlVVTkxjV05hYTFac1IzcEVjV3RPTm5WdlVrOU1hV28xY21WTGVGQTRhd3BaT1ZwcllUVTFUa2RxWjJsaFZFRkxRbWRuY1docmFrOVFVVkZFUVhkT2NFRkVRbTFCYWtWQk1tVk9jRzE1UkRkYVRFNDBjVlpoVGpSS1ZEVjRjVnBuQ25SbVltSlVZVk42S3paNWF6WktaaTlrTUhOR2IyZElUVGRZV0dnMlRYbE1SRXBhVVRFNVRqSkJha1ZCZEdOb01saGtSbWhYVWpodVpFOXJOakphTW5rS09IWTVaRk5HYjA5a1JHcFVhREZZSzFvcldqUTRRVVoxU0hkNUswZERPRWQ0UzNSSFFsSTFZa2wwUXpFS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666232575,
          "logIndex": 5468925,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "401085c579bcc37fd854a9d871842de1b22dbc1a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3286358320",
      "sha": "401085c579bcc37fd854a9d871842de1b22dbc1a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

