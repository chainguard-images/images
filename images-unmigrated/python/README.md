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
| `latest` | `sha256:eaefb3fdf692a38aaa71720007e20fcac73856ee7a7b93049c60100b35739e88`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:eaefb3fdf692a38aaa71720007e20fcac73856ee7a7b93049c60100b35739e88) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:eaefb3fdf692a38aaa71720007e20fcac73856ee7a7b93049c60100b35739e88"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "40e7be46086f68dea5d09e784c50f949bf134693",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDGvQxBnNzG3NdMQyed9+m04dG/nEq+TvtfvzEV34wgeQIgQnhavx+ElF0MN5ASKSDI+uxypsqX7WGm5FmYC5l8tQk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlOWUwNDgyOGU2ZjdhNjRkYzI4ZDc1YjdmOGY5MGI5YzZmZGVmNmMzZjBjMWEwNjUxY2M3NDc1OTA4NGViZmEwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNXZU55U3J0eTNzT0VkbGd3bXYyaGFibEZzRVF5Z0ZXYzl3dDZYMGJRUWpnSWdJbW5oQmVCN0VTZVRpVVdaQ1hxczcyblk5eVRoeWdxSUlGS3FJeld4WHpvPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlkyWnhSbXB5ZHk5T1MzUnJlVVZoWmtONVVISm9hRkpJWWxRd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRSTlJFbDVUa1JWTVZkb1kwNU5ha2w0VFVSRk5FMUVTWHBPUkZVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2VDJSeVEzaExRV2h2VEdsRVJXRk5kMWR5YkZwRFoyTnpXSHBWVGtvd1NuRjJhamdLVW0xcFFrTm1abEZWYkM4cloyeDRTVkZVU1ZKVk5tOVBRek5uYURRMFZEbFhkRVp3UzFaQ1ZDdFVSaXRXWlZCSkwwdFBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSVURRNUNrWk5jM2h3Vm5sRllsQnZNRUU0VjJ4UlEzSndPVkE0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDVFUW14T01rcHNUa1JaZDA5RVdtMU9hbWhyV2xkRk1WcEVRVFZhVkdNMFRrZE5NVTFIV1RWT1JHeHBDbHBxUlhwT1JGazFUWHBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFTms5cFFrVkJRVUZDUVUxQlVucENSa0ZwUlVGMFowVlVMM2gzTTNsNk5UVUtNa2xFV2s1VlEwNXdjRmRPTTJSak0yMHZNVEJqVUdWbFQxQnBURTQxVVVOSlJtVnpOemx2TVRGaGJFeFNkbmM0TWtGQ1ZubHphMVJsZWtaWE4yNU9iZ294Y1RSR01WSlhXbU5GYUZWTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OUlVvNVNHOTJhMHBNVlM4dmFqTm1XbEZNZVhCV1kzSnVObGwwQ21veFNGRlVPRUpMZEU5UVQweE5OblF2Y1c5WVdWZElOMkpqUTNKUFJFUnNhV3RzVjBSQlNYaEJUVmhpWm1sV1NFaGFTbGRqY0ZRd2F5dERNSEZ2VVZjS2NUVjBLM1V4VkdobVdFZHpkSGg2UjBFMWEweFRiMmRvYm1sbFpGUmtXVlJ5TlVWaFNYTkdUVzFSUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666059918,
          "logIndex": 5320282,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "40e7be46086f68dea5d09e784c50f949bf134693",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3270137044",
      "sha": "40e7be46086f68dea5d09e784c50f949bf134693"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

