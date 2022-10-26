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
| `latest` | `sha256:56a63f9a98f0ca8e39073d286de8f39dcc8cc7b0961f8d96980a8cd36bdf19ad`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:56a63f9a98f0ca8e39073d286de8f39dcc8cc7b0961f8d96980a8cd36bdf19ad) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:56a63f9a98f0ca8e39073d286de8f39dcc8cc7b0961f8d96980a8cd36bdf19ad"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "254d41b56320767289abaaa187ebc9110f51ee42",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDqwp3lUUfWOmu8gJIoJXF0vfaVqg8/My9uhLb8v9rIOQIgdmsruNMaEBDdllQGbZuT8U4yTqSwaCXssLXRS6cA6io=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3MGU3YzkwYjNjMDFhZGUwMTEzN2QwZGVjMTA2YmRmNzRiZWNhYzVmYzgzYzdiMGIxNmRiYjNlYTY1ZWU3NDhhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSHlJYTFiK3Rncmk5VFlSVjVmc255NGQzZVBGcW4wQitMVkZtWnlIRWZtRUFpRUF1bEJIM1pQUmhGVmNWVEJGdjhNWjF4eDg3Umh4TG42Q0tWdVB5Q2NBQkg4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwSFowRjNTVUpCWjBsVlpqRkJWRUZLVVd0Uk9FbGtOMFpwUVc1Wk1WWnFlSEI1YldzMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RKTlJFbDNUa1JCZUZkb1kwNU5ha2w0VFVSSk1rMUVTWGhPUkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhZFVOQlQwNXJUVWhYUVRjcmNUUkJaVFo1TDNOaWVIQnVWaXRTWkcxUllTOWpWSE1LU0ZCMmFWWlJkRzlVVWxOS1pWa3lXRWRxUjJSWU9WUkpORTRyTkZweGFIWkZjbkV2VWpONWNtZGpUVmxyZEZKc1dEWlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZYWlZjNENsSktkekY1Y0ZCWmJFNU5TMUZaU0dGblNWaHBPVVZaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFxVlRCYVJGRjRXV3BWTWsxNlNYZE9lbGt6VFdwbk5WbFhTbWhaVjBWNFQwUmtiRmx0VFRWTlZFVjNDbHBxVlhoYVYxVXdUV3BCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRGUldkb1FsTkJRVUZDUVUxQlVucENSa0ZwUlVGcGVHRnBUVFpaTm1OVFp6SUtkM1F5TW5kc05rWXpNazFGY25ZMlZXOXVSV2hhUmpCQk0xRlZWMUpwTUVOSlJuZzVhVEYzYkZONk9IWk9WbVUxY2s1YWEycEJVQzl4UnpWQlpYUTJUd3BqVW1OVE5tMUJPSFYyY3l0TlFXOUhRME54UjFOTk5EbENRVTFFUVRKalFVMUhVVU5OUkdaVmNra3pObGxhYjNvMFFWYzFWbkpHUWsxVE9DOXFNMEZ6Q25OR09WVk1UREExWW1GNmRsTkJhMVp1YXpodWRtUlpSRU5yY1hkc01qWkpVRGxFTlUxUlNYZEdaVk55UXpWd1NWaHJTa2N3WnpKeGJIVlhlbWRxWjFjS1pWUldNMms1Tnk4MlZtVXJOSEJZVEU1T1IwUnVaazVDUms5VldqbHVjbU5ZT0M5d1RGRmxjQW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1666749863,
          "logIndex": 5874162,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "254d41b56320767289abaaa187ebc9110f51ee42",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3325642269",
      "sha": "254d41b56320767289abaaa187ebc9110f51ee42"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

