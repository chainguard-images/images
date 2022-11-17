# python

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/python/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/python/actions/workflows/release.yaml)

This is a minimal Python image based on Alpine, using Python apks available on the Alpine Community repositories (not built from source as of now).<br/><br/>While this image is being developed, we will stick to the latest stable Python version which at this moment is `3.10.8`. Supported versions in the long term are TBD.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/python:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:aaa7f98dbaac9f7675c347da09676ac071e93f7ccf4c8992f0993c70bd15381a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:aaa7f98dbaac9f7675c347da09676ac071e93f7ccf4c8992f0993c70bd15381a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:aaa7f98dbaac9f7675c347da09676ac071e93f7ccf4c8992f0993c70bd15381a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0b683d993cc97ccb532cedc537be2b996e220c41",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQD2WT5D/0upTTMAnn8gePbO0KbR7xyFNoe1lRGXSvQ2HgIhANlkf+Ttsr8/mgHR8LtW27ko6v22J3e5mLhBRwfinHYE",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZTRmMjk1Nzk3ZTViMzhmYWQzYzA2MmE1MWNkM2MxOTFhOWE5MTlmM2IxMzA5ODFlNDZiZjc3YjhjNTcxZWMxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNwcHRFalRPa0NDN2VyNVd1QkQ0eEZyUkFJUGI0Mnlrdk1sMFRJVS9HR3lnSWhBTWcxUzRxakRTekVOVm5adGdsdDljamZuZGFpOXczR0ZVNlZEd1M1d0NFQiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlJEWjBNbXBqU1daUWN6bFBlblJCVUdVMVpWVXpOVzF4YVU5QmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlROTlJFVXdUbnBSTkZkb1kwNU5ha2w0VFZSRk0wMUVSVEZPZWxFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwVFVRNWRHMTVjbm92VGl0MFZGUXpkMEl6WmxGSk4zTlBiMmhpT0VGMU9IYzNURGdLY2pGVFdrdEhlV2RCU1dGSGEwOU1ka1pCYUd4NllrWnZPVkEwVDFoM1JHdzJWMmxJZFdOeVlrUlpUMlJtWWtnd2RqWlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZPVFdVdkNrZ3pTMmRIZEdkNWRtVnNPUzlNYkZFMk5FVjBWMDV6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFIU1RKUFJFNXJUMVJyZWxreVRUVk9NazVxV1dwVmVrMXRUbXhhUjAweFRYcGthVnBVU21sUFZHc3lDbHBVU1hsTlIwMHdUVlJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGWnpCV1VrNVJRVUZDUVUxQlVucENSa0ZwUlVFeFREWk5XRFpzYms1Q1EwVUtaSGRzTm5od1JEVnFSWFpXSzFCU1ZrTkRMMFJwZG5KNlIxVlRiVEphTUVOSlJpOU9UbEJVVWs5cGRXeDJOa2haTldwV2RYbElXVWswTVZJNWJtSTFZd3BEWVdoWVVXdEZOVk5yY0daTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OUlV0UmR6aGtORGRRVkN0blNWUkxSV2c1VW1KRU5HeFZkakl5Q2xKWGVEVXdNR0V4UW1SMFR6VmhZM0Z4Um5adFRWVlJNMVl3YzNOeWFUVTFNalZXYzA5UlNYaEJTblpzTjJWWWFIVnFZM3BLVVRGeVUxTlRPRVptVGpjS1V6UldkMjVKZFdWQ1UwWkpZVW92TVhsVmJXRk9iV3N6WlN0eEwyZzJTV3QzVFdacVF6VmtkMjFCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668649693,
          "logIndex": 7242874,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "0b683d993cc97ccb532cedc537be2b996e220c41",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484644153",
      "sha": "0b683d993cc97ccb532cedc537be2b996e220c41"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

