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
| `latest` | `sha256:3340013e92bdf6241d14a2e4daad9cba8e95a9cffeb1bed320579f6db8fbd7f0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3340013e92bdf6241d14a2e4daad9cba8e95a9cffeb1bed320579f6db8fbd7f0) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:3340013e92bdf6241d14a2e4daad9cba8e95a9cffeb1bed320579f6db8fbd7f0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "01c6bd22271897f43a849d390cc41d5cadd611f6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDUrxMUEk4x2+nFZFYSAAL0ljmgMvRZ3+Q/s6ylplf+BwIgWnoCyEHuku8pc8EbOW0gpgaKMvD+5U92CYYvazRMk2A=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiMjgzNTcyZjg1ZWYwNGNlZmJiZDc0ZGE5M2FlNGQzODY5NjA2OWI3NzNlZGZiMTYwYjI4N2VkNTQ3MDEwMGI3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQnUyQnpMRjVCTy9ZMmNWOGttcVFQU0NqTlpQZElIb0UvcFVFSFVBd3NSSkFpQTJEYi8zMWRSRUhZR3MxMkNDK0kwbWg0UTkwRERLQ1Z6eU9oTTU1ck52cmc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVlYwWlJaMWRRZUZsWmEyaHFWa0Y2UVRoM1MySXhjRkp1U1hwbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhoTlJFbDRUVlJKTlZkb1kwNU5ha2w0VFVSRmVFMUVTWGxOVkVrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwYW5kb2RrVTROVVpxUldaRlFqZ3JlbFpuZEcweFdIVmtPV1JoTW14TFltVlpSM1FLUmtZelpHMUtZbkp3VVdKRk9GQlJWbUpuTVRoQlpFaHBkMHQ0VnpobmFsTldSekJRVG5ReE0wUktVV0pFYzBOTVYzRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXZDJOdENrVkpXRWsyYVdWQ2VXUXdaMnRRVVhJd2JIbGxLMnd3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFFUm1wT2JVcHJUV3BKZVU1NlJUUlBWR1J0VGtST2FFOUVVVFZhUkUwMVRVZE9hazVFUm10T1YwNW9DbHBIVVRKTlZFWnRUbXBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFZUUwcmQzaEJRVUZDUVUxQlUwUkNSMEZwUlVGclQxQmhWMWczTTFsaU9YZ0tTelJ5U0ZSbU9VaHpaa1l2ZGl0cU1sTlRiWGMwV1U0dlNtMXFVRkl6U1VOSlVVTkVSRVZzYUVWRFRqZHNMM2h3WmtGWVpEZHVWbEkxUWt4aFUxRlNUQXB4TW14emJYTXJOMlpNVVZkVWFrRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtWQmNtaHpTakZuT0M5U1ZYTnZNV1ZNUkhvelNVbHhaMHhuQ25WUGFVdEZWbXhTVkVSbmVrTm9OVWhLUkRsM1dIRkJjRU5ZUm5obGREQmpWbWhUVEV3d1ltdEJha0U0ZERBMWJXaHNXWFk1VWtGVGF6QnhZWEJ1TTJrS1MyeFVaMlp5UVhwdU1qY3dRVFJsVG1kUVZHRkZiM1ZJWWtVemJUWkxjRkZLV1hNeWJuRnZTRXd4UVQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665454312,
          "logIndex": 4861123,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "01c6bd22271897f43a849d390cc41d5cadd611f6",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3223636117",
      "sha": "01c6bd22271897f43a849d390cc41d5cadd611f6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

