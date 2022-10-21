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
| `latest` | `sha256:ef8dc72e78f8746a6a68e6048d484b8fdeb4e25dc651856be82b2bd8dfbd2690`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ef8dc72e78f8746a6a68e6048d484b8fdeb4e25dc651856be82b2bd8dfbd2690) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ef8dc72e78f8746a6a68e6048d484b8fdeb4e25dc651856be82b2bd8dfbd2690"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a8b7f88cd8967930951aaa9ee503624ac3de8cab",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIG9Jcv/jm8lH8c8VJECpzvWZsT379i1XvV3cavyBmXGTAiEAxCpuq5Hrm984WvhkJ+6qmzmkpGYw6DD2ptoP/JdUtr8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxYjRjMjRhYzI4M2UwYzU0NDJhZWIyYWQxMzIyN2M5MzIxOTdkYzYxNmJiMzFmNDY0MDg4OTdmOTYwYjQxNDgzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNnUXUyWFBhL3V6cnJZMUZHaEFxU0RTV2krWnFlOTFydXYvcklGMEZDd3FBSWdVaktaYkpTRzZQbHpEaEVRR3JLR3FKbHlETHgycXlqbklMYnQvalN3NEE4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwSFowRjNTVUpCWjBsVlpuUnRibVZsUzNCM1owTjFaVk4yTjJkUFIycHBhR3R1Y2xsTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hoTlJFVXhUbnBCTTFkb1kwNU5ha2w0VFVSSmVFMUVTWGRPZWtFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZGZHpFdlJFNXpSVkpETTNWSEwwMXhhRlZ5UW5Wc1NGWkZkRU15ZVc1eFVqZE5aVWtLZWpaSE0ybE1SUzk1Ykd4cU0wTmFNbGR1VlRaVVdXRmpZbllyWjNBMFFsVjJSa0V3Y1RkVFdXRnZRMVExTHpnNVltRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZHVFN0UkNsZHVhbFJJTVdad01YcDNSbEZ0YkhaTlUxcEVSVzg0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMWxVYUdsT01sazBUMGRPYTA5RWF6Sk9lbXQ2VFVSck1VMVhSbWhaVkd4c1dsUlZkMDE2V1hsT1IwWnFDazB5VW14UFIwNW9XV3BCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFSzBWSmEycG5RVUZDUVUxQlVucENSa0ZwUWxNMlJIVXdkVFp3ZEVGSmJrTUtka1ZSUm1sVmQweEtTbmxRVm10VFUyWlBNVTl6ZW5oRFpXNUllak4zU1doQlRYcFVSMGR4UTBOV2IySjZVMlkyVFZoUFNHMWljMGxvU0haQ2NUaGhiUXA0TkZWVU1VZDVUa2g2VlU5TlFXOUhRME54UjFOTk5EbENRVTFFUVRKalFVMUhVVU5OUWxkaVRWVXJiQ3RTVW1Gb2JrZ3dhV3BFU0RKeVQybzBVRFJEQ2twa1kxSnBZWFUxVXpSbFVGWTJRVzVuVTNKS1pFNXZWRE0zVG14QmEyZFpVMjFJUkhoM1NYZGhaSFZzWVd4bVJVSlBUVzVzTkVSWGN5ODJOV2x6ZHpRS2NFUlBkMHRrYkZCdWQyVnRiVmN3TUcwNFVIWXdjV2t5TmxKV1pXWnhWbFpYY25CRVYzSXpiQW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1666317449,
          "logIndex": 5532037,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "a8b7f88cd8967930951aaa9ee503624ac3de8cab",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3294233205",
      "sha": "a8b7f88cd8967930951aaa9ee503624ac3de8cab"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

