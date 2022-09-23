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
| `latest` | `sha256:3fd334df5a358c828a8067053a03eea84ab4cf5f984412ed53a37b3e55329c3c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3fd334df5a358c828a8067053a03eea84ab4cf5f984412ed53a37b3e55329c3c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:3fd334df5a358c828a8067053a03eea84ab4cf5f984412ed53a37b3e55329c3c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f1b6978e45ec7f34ba00056317666e5aa120b1fc",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICfK6Od+X/YSCeKG421UYCb7nF4nG3uNnTRppaxyBzDnAiEAsN04hOz617UHMLIrR2Hdvkbfr/s8FIbmsOVABXKURaQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1ZjA5OWRjODUxOTkwZDM1ZTFkMzhkYTg1YjU5YWVmNWEwNTI5N2U1YWNkMWIyYmRjZDVkYzFkOWFlMDNmYTk0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUROSTlDcVNMV3k2K1VWK0Rwc0hEWTJYd1VoTGJpWndIc3hxQjdVa0dxeHR3SWdlVFh4dmx1YzB4d0pWaWVRZlIrZWpqakpwb0t5ZUF5ZE01K1hWQWxsZkM0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwSFowRjNTVUpCWjBsVlYwcHhSbmh2TlZwclVtVlRkekZHVVVFeVJIVnBWRmh5ZEVWdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFbDVUa1JOZVZkb1kwNU5ha2wzVDFSSmVrMUVTWHBPUkUxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXZWtvNVZqSkRUWEJzZDJoaWQzTlZiVTVKVjJRekswTkRhMjlMVjJKbU9XZFFiRkFLTWtKaGRtRnlVSEpGUmxneldUSm1WMGxKSzFNeFRVRlhjR2Q0ZVM5dVMzWk1PSEp5ZWxWaWMzQkVWMU5IYTBaWFdFdFBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZrYzFvdkNsSXlRbFp5WmpaNE5WVnVLekZtWTJKVFZqVlBRalpSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMXBxUm1sT2Ftc3pUMGRWTUU1WFZtcE9NbGw2VGtkS2FFMUVRWGRPVkZsNlRWUmpNazVxV214T1YwWm9DazFVU1hkWmFrWnRXWHBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFWVVOcmRUQjNRVUZDUVUxQlVucENSa0ZwUlVGelprVkxPVlkwU2xkNllVc0tjR3Q2Y1VSbmJtbFZkbUZaVkd3MVZITnhOSFJUVkhSUFMzQnVPVVZUT0VOSlJEVktZbXRTT1dabWNEZHhiV3BTTDFSc09XRnVRVnBqYTNkM1dXWlBXQXBxUWxGRWFFdERSM2xwZHpSTlFXOUhRME54UjFOTk5EbENRVTFFUVRKclFVMUhXVU5OVVVOcU5uUnFaelZoTjNsR2JsTXpUM0J3ZEU5NGFsWmlhMkpKQ25wdE9YVlpjbTVVYVZCWVMwMUdObmg1Ynk5eWNuTXJXRmhxV2tGTFR6ZFdlVXd4VkVaWU5FTk5VVVJKVGtkYVUwTlFSMWxWUkhNM1ExcFNibmxsUVM4S1oyaGxVbXAxTTFoUVdHcENUVU50WkRob2RubEhWMnBXTmxOeVdrRkJkbFJYVkZScWVEVlZPVVp0YXowS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663899896,
          "logIndex": 3783187,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3110006420",
      "sha": "f1b6978e45ec7f34ba00056317666e5aa120b1fc"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

