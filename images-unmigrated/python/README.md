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
| `latest` | `sha256:ba475aad62331e5ba421734abfbc7798ba6686598d540c6af9c66889bd32d75e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ba475aad62331e5ba421734abfbc7798ba6686598d540c6af9c66889bd32d75e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ba475aad62331e5ba421734abfbc7798ba6686598d540c6af9c66889bd32d75e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "797bce6a13219b673accdd87863bee2ca8879745",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDrluGgzhb9WQ2Odrb7ce2kIBzELTBTvn3e78vxaOnH1AiEA5TG/ftJT9GE+XsOcMNTkJVii8zcuNwCA1OF+R0RgzjE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkODc4YjY3YTU5ZjcxODY0YTE3MzE5OWVkZWEyNzgwNjczMmE3YzZkMjZiMmZlNzUyZDEwZDI1ODhlNmYyNDQzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQW4rdXQ2UVV5VUNxT05XTUZKbHYzbnRaQTRUQzNweWRucWkzVUpjUXF3V0FpRUE3UTBnT1BlRmQzOVVEbGxCWDZ6YlVEUnVKRWtGYmZtdlEyU21CbjZLeW5nPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVlZUVk9hamd2TUZacGFVUjBUWGxUYVhSVVZHaGtaekJuY0ZoSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRGTlJFbDVUbXBGZVZkb1kwNU5ha2w0VFVSRk1VMUVTWHBPYWtWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZwUjBOU01FZEtSbmxaZUZkaU5YcHlaak0zZFZoT1kwMUphMDVzU0hseWVqZG1hbTBLZUhkUmRGVk5XVmw0Ym1kd1pTdDVWWHA2UW1GSVJTdHFlVUpCUlhFeFEwTTVhM1ZHT1ZaSVNFVm1NbE5QYVdkdGJUWlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ6U21wUUNqQmxjVTF3Tkd3elZESXdRM0poUTBveFRXVjRkbUV3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDU2YXpOWmJVNXNUbTFGZUUxNlNYaFBWMGt5VG5wT2FGa3lUbXRhUkdjelQwUlplbGx0Vm14TmJVNW9DazlFWnpOUFZHTXdUbFJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFTWxoaFlqTjNRVUZDUVUxQlUwUkNSMEZwUlVFMlFtVTVVVkpXWjFoTE5FZ0tOMlpIVVM5WVYzRTBVWEJyVEhwa1lUSlFOamMwVW5aU2VuVlJaMVZVUlVOSlVVUk1PR05rUlRWblVYbzFUM2Q1YmxVcmNUTlNWemRhVkVKMlR6WmlVd3BqTlVoQlF6aERNRVZDVGpZd1JFRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtKemExaGxUalUyYVZsMmRIRjZlRU5KZUVGamNHaHllVlZUQ2pSMFNURTVkbVpMZG05R2RqQlNURmgyYTBWd09EVk1SRkV5Tld0V2FHSkRkRWhVWWs5dU9FTk5VVU5tWmt0NlZuUjFRbWxyZDBwbVQwcFRTWEEzYTJjS01HaDZVMmM0WjNSalYwTmtiRVJFUmpsVmJ6UlJhVXN4U25WR09YbHlXblZ0VDFSamJUZDZiMGhaVVQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665800791,
          "logIndex": 5130605,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "797bce6a13219b673accdd87863bee2ca8879745",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3254092590",
      "sha": "797bce6a13219b673accdd87863bee2ca8879745"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

