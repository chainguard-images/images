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
| `latest` | `sha256:9f3ede5865db5ea4943fb137473cd66ad6a8dcf8ba15e1f65458c53feabf6f32`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9f3ede5865db5ea4943fb137473cd66ad6a8dcf8ba15e1f65458c53feabf6f32) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:9f3ede5865db5ea4943fb137473cd66ad6a8dcf8ba15e1f65458c53feabf6f32"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "84e3e05ea5c53a464af13fbdfe920cd94a7ec84c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIC1x3FZbogekizb/Fqwz37A1Xwf4QP7R9gkRWnjlNFhGAiEAz9mTCAIAW5cIW12tsravcdfyutU3aq6uu6i3Bks74to=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5Y2IxNWY1NzA4MDMyYmQyOTgzNjhmNTc3YWU4ZjhjMWI4ZWE5MzIzZGRmZDg2ZjU4OWU0ZGY0NDQ2Nzc1NGJhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRmtKVjB6VG1rS0p6eHNZYVVCc05SRnpOVWF4QmowMDk5anlMYUhRWGVrRUFpQW9nZDRJTUhZR1N0YXpla0xpN0FMbmd4L3dRc1J6aXdLV1B4Zjk5ZU9NL1E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwRFowRjNTVUpCWjBsVlFUVXhVUzh5Um14RU5tSkRNbXQ2WW13MldVcGlXbUY0Y2tVd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RWTlJFVXhUa1JKTWxkb1kwNU5ha2w0VFVSSk5VMUVTWGRPUkVreVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTZVZWbVJIZzBWbGhtTDJGbE9HcFdaRk5PUlRoa1VqZENOVGd4UjFJNVNFOUpaamtLZW0xYVRHeDJUbkp0UjJGbVNFVmtaRzl6V1hwR2MwVkdWMmgwWVRKRU5rVldUblJGVTNFdlRqWldXSE5aYWtWR1EwdFBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5Tm1zeENrNHpNa3czZVhOeWJqQkhWM0phUWxWb1ZFdzFOMnhaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDlFVW14Tk1sVjNUbGRXYUU1WFRURk5Na1V3VG1wU2FGcHFSWHBhYlVwcldtMVZOVTFxUW1wYVJHc3dDbGxVWkd4WmVtY3dXWHBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFNrSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NITkZaVkZDTTBGSVZVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRGU1ZoTFVHSm5RVUZDUVUxQlVtcENSVUZwUVVOdFpsSkNlVXMwV1hkUmFqUUtlRzluVFVoR2QzaDRZVlZGT1RGSGJsWktTMmRhV25ab2RHVnhXbWRSU1dkWFdsTjBRMVlyVlhoTFQyNUNia2hDT0ZGdmFEazFSVmQ0ZFRsMGFFZENUUW81YUVGR2VGVklNRE5wYTNkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVVGQmQxcFJTWGhCVDFack4yVXZjRlZ4TUc1b1V6Z3JaVWQwYkZsTFpUWXlUak54Q21OcE0zcGhWbWh3ZG14SFpGVk5MMlJqVTI1TGNrOTNNV3d2U25WMFRVeExlWEl4VDBWM1NYZExaR05NYUd0WVJrbFFObmM1TTBoWWIwOUNPR1ZHTmxvS2NVbG1iRVpTV2xwU05pdEtiV0Y0ZDFwRk9YTlBhRmh2UW5aVFdUQnlXQzlHY0hseGVHRlJhQW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1667008488,
          "logIndex": 6075908,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "84e3e05ea5c53a464af13fbdfe920cd94a7ec84c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3349631077",
      "sha": "84e3e05ea5c53a464af13fbdfe920cd94a7ec84c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

