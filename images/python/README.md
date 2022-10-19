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
| `latest` | `sha256:1e8b384aabf96baa1285f013c08f07a3f168b08fa614b0b74058f9c383c6f1a8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1e8b384aabf96baa1285f013c08f07a3f168b08fa614b0b74058f9c383c6f1a8) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:1e8b384aabf96baa1285f013c08f07a3f168b08fa614b0b74058f9c383c6f1a8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0ced4091a850ff438ff155e51977c8aae4c83686",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIApIinQKLjBy2p6qa+Xlv7rqky06DY1gpB8upHfsXJFnAiBvW2zl0kPysW8DxtWToFG+huuoswy7ec2Nf4/2UUFSWA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3ZTg2Mjc5Njc3YjQ5OTRlMjQ2ZmNlOTVlZTYwZjM3NjYyYWMxZjA2OWU4OTU1OWFkMmViZjE4ZGFiYjA0ZjhkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUR5TjZFa0FvNFVaT0gycTZDa3daWHcxSkVoNnh0TUJaNEJLYTlzblh0VXR3SWhBS2lZRHUwYXB6NWU5cXNlalRXT0ZDOHIxdU9sV1IwYmFRdHpHRFp3YTRQZCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwTFowRjNTVUpCWjBsVlZqbFJWblZWZVhwS1FXTnRUMFpoVTJ3d1dESktiRVYxZGpabmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFbDVUV3BCZUZkb1kwNU5ha2w0VFVSRk5VMUVTWHBOYWtGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMTkZNNVRWUlRSMlJ6VGpSVFFsQkpSazluT0VWRWVqQndObHBUUTFreVNFTjJTM2NLU1VOYWJTOXJRWGRqT0VobllYcHRSMnRDTTNFMWVtTTNORk5PVlZOcVJISXZVMnMzTmtwalpteDZlVkpXVWpOcVJVdFBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZpVGtaR0NtRlZVR3gxVGxGQlpsZ3ljVWc0ZVhSaU16QlFOSGd3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFIVG14YVJGRjNUMVJHYUU5RVZYZGFiVmt3VFhwb2JWcHFSVEZPVjFVeFRWUnJNMDR5VFRSWlYwWnNDazVIVFRSTmVsazBUbXBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFTjJkM05VWjNRVUZDUVUxQlUwUkNSMEZwUlVGc1ZFazBZV0ZXUVZsSk4yWUtSV015U21oaGRsTnNLMjB6VW10cFp5dHRjMHc1YkdGTldGTTBTREp1V1VOSlVVTTNiR3R1V0dReE5GVlhkVmRtY2tVeVZ6bEtXRmR5Tm5Ob2J6RmhNUXBGYVdOWVJIWm1SVWhPTldScmVrRkxRbWRuY1docmFrOVFVVkZFUVhkT2NFRkVRbTFCYWtWQmJHdERSazFTYW14cVF6RkZaMDFWVkVwaFdVVjNTVlIyQ20xTWJFRmFUazgzWlhoVVVWcDFWVXhsYjA4eFJrTlRVVWgyV2tGTE1tOHJZV1YxTUVFek1HZEJha1ZCSzA1M2NsWlhTV2xIWmtablQzRmpPSFZRVHpVS1dFcDBZVkJvUzNOaFVHMXFTVmRMTXk5bEswcDVhSGxUYVZkUGExcHJUMngwV1hrdlNucFlTM28yT1dFS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666146141,
          "logIndex": 5402072,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "0ced4091a850ff438ff155e51977c8aae4c83686",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3278336494",
      "sha": "0ced4091a850ff438ff155e51977c8aae4c83686"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

