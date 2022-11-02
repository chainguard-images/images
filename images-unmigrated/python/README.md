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
| `latest` | `sha256:1ceff5f2aeecf811ec5972b8919a9f7831b5ec2e8a15f2fd163e736738626828`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1ceff5f2aeecf811ec5972b8919a9f7831b5ec2e8a15f2fd163e736738626828) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:1ceff5f2aeecf811ec5972b8919a9f7831b5ec2e8a15f2fd163e736738626828"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f0691a1d83b651664005a56c63b273eaf0cd3491",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFFJXvhU3ovLjuR6CyDPzlbKThHAHnTGeQDQKKjGVLvIAiEA9wwacE/HdGhGwUl4KxFjqaoXlXVHnwEjV8PTqFa8ppA=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyMTQ1NTM5YmY2OWU2Yzg1MGI4NWU0NmI1YTViNjkwMTEzMWFmZTY2ZTVjNzI3YmJkMmUxNGI1NDk2ODllZGQyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURRT3BUTDdxSGg1VHJMeVlURU1YSXZHamk4ZVJqb29vcjFFYjVhdWlWZ3NnSWdTaFhQUVJ3akRHMzlBMzdyS1BSWXFWNUxYbEFkUmlMVGEzSWE0WXpoMTdBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVldsaDNkbk0xTVZGTFkyUXlSVFl6T0ZCWkwzcEplVEpNWTBrNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlJFbDNUMVJSZUZkb1kwNU5ha2w0VFZSQmVVMUVTWGhQVkZGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZGYTNJMWRGRlJVemR6ZG1sYVQxVXpLM2xVTURobVpHMUNhRWQ0TVVzclIwMXZUM29LVUhOMGVEbG5Xa1ZLY25kQk4xcE1UemRvYTNONmRUQXJUSEJJUkU5R1dUQjRUVWRhZVhGalJURjVha1JPYVhSNGN6WlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZYT1M5RENrZHllQ3RyV25ZNVZtTnpaMDlYTjJwdE5Ha3dOM056ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMXBxUVRKUFZFWm9UVmRSTkUweVNUSk9WRVV5VG1wUmQwMUVWbWhPVkZwcVRtcE9hVTFxWTNwYVYwWnRDazFIVG10TmVsRTFUVlJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGVG1odU1sQm5RVUZDUVUxQlUwUkNSMEZwUlVGNk4yUXZkWEZ3YTBJdlQyZ0tWM1JVTDFKR1REVnVVazFCY25GRldVVkRNbmxoTDJKcGMzVTRaM1J2TkVOSlVVTm9hVloyZGpWeGRVUjVOVWxCVjNOR1NHZG9kbUpqWTJ0b05HWnRNd3BuYUM5Q1kzRmhkVzl6V1dZclJFRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtJNFl6VXdlVFZDVWpKalRXb3pjelZUT0ZWcVkzTXJVRk40Q2xaRFIzWkhSME4wZEM5TFJVRkVUaTlFVlZocWN6UnBjV1ZUZVdweFRWcEdMMEV6WTNock5FTk5SMGQyUzB4S2RURnZUWEp3ZFRaaWNrUlRPRkJEWVVrS2JIRXJZUzh4Y0hKeVZXdHFNbk5IYlRkTmFGaEZLMDkwT0hGUmFHWXphRUZJVmt4cWVFTnlNazlCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667355003,
          "logIndex": 6327102,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "f0691a1d83b651664005a56c63b273eaf0cd3491",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3374315651",
      "sha": "f0691a1d83b651664005a56c63b273eaf0cd3491"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

