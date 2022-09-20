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
| `latest` | `sha256:8691d0d7f6ad70aae5ab18fd239174256bc9adabd287553fcc4a178590cc7c79`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8691d0d7f6ad70aae5ab18fd239174256bc9adabd287553fcc4a178590cc7c79) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:8691d0d7f6ad70aae5ab18fd239174256bc9adabd287553fcc4a178590cc7c79"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "e2151eb6c962ff3a874a7bdd233f386287444532",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCr2SoDg0tXqcPOE0kNiLPG010SYpr3GiFBahmtw/onOAIgPUL8Yf6/8VfvnzmB7Df4x1pLHoXmzbOqABp1jR6J21o=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiZDU4MThlMjgwZDFjM2FlZjA4Zjk2MGVjODU1Mjk4Y2FjMmQ1MjRmOWZjMGVhYjA1MTFjM2E1ZGY0OWY2NjI3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURsUjZSdDBndWZvMDUzQ0NMeGFXL1ljWUdFaFdwbnNUdS9yV2JKMCtYY25nSWdBc2pXZHlPeGJFbXROVC9qakhUejdaMjZRYUhjZXJUNWk5R0RLaFlmcVFZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhreVowRjNTVUpCWjBsVlRWb3phV0p1WTJ0MWVXVXlXRlIzYmxOelRWWktabFpyTkZaUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHZDNUVVJCTVZkb1kwNU5ha2wzVDFSSmQwMVVaM2hOUkVFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxVWt0S2JXRXdZVGRMYjBoU1RIbzFaVEV3Tm0xRkszRmlhM0pyZG01VVQwRkhjRVFLVERjeFpraEVTME5PTkVOT1JGcFNhRkZUVTBWSWRESTRRMFptTUc5eGRHNWpZM3BMVm1kNlJsVmpSMjlUUkdkS1JqWlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYzU1hKQkNqWnVNbnBzV0VsalRXcHVXSGxQUzNkNVVWTnZUR013ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRGWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSUldOSVZucGhSRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJoc1RXcEZNVTFYVm1sT2JVMDFUbXBLYlZwcVRtaFBSR013V1ZSa2FWcEhVWGxOZWs1dFRYcG5NazFxWnpOT1JGRXdDazVVVFhsTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5aUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUjBkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZURE5DTldSSGFIWmlha0ZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlRtTkVjREZXUVVGQlJVRjNRa2hOUlZWRFNWRkVaekpZT0haSlRtWnVUbnBwY2pWVVprOEtlRkYyYTJJdllrMWpWSGxEZG1ZMGVrdzNTbkJvVUVsWVpYZEpaMVJ3VHpBNVlrbGlaR2h5U2pod1pIVXdZbk5EZDB0UmF6SmtNRkZoYjFGRFYxWkVZZ3ByZGpJeWQyUlpkME5uV1VsTGIxcEplbW93UlVGM1RVUmhRVUYzV2xGSmVFRlBhSGhQUVU5c1RXWXdibEJuV1N0a1FVTnVUR2hrUmtkSmVtUnZha3BaQ2tSaE5rRllTVzFqWkhaSFV6ZElZMFJIUmxOMUwyUlpZa3RWV20xcFVHVndLMmRKZDFneVlqWlVWamRTTTBWV2RsZElaMkpGT1hwRVlrOW5hazRyTldrS1RITTFjSEZIWkZrMGQxZFFTelpXV0VwRlNUWnlUMWwzVGpkWU5WcHJhbVkzYVhKUENpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663696850,
          "logIndex": 3620822,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092337694",
      "sha": "e2151eb6c962ff3a874a7bdd233f386287444532"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

