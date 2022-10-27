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
| `latest` | `sha256:88763b195b5fdda596a98a375273b550994fa4c926ff28aedf993a61c78f895f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:88763b195b5fdda596a98a375273b550994fa4c926ff28aedf993a61c78f895f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:88763b195b5fdda596a98a375273b550994fa4c926ff28aedf993a61c78f895f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "14f8f3717e31b0f268ae124e7f4b8002277280f5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBoJrtc24BA3M55HToqZO5mDhgCGk3Z1Mfz8duf5gudfAiEA/bH7BvB4ClXBqBS7iMNReGIzY4aCs0T/E87vOq/I3fw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhODEyOWY1ZjdhODA4NDU0ZTAzOTNiZGEwNGQ5OGY3N2I4MTI0ZDlkOGM4M2E4OTc3ODJjYjg4YmU3ODg5YWNkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSEozRm5Rc05sVm5Sa1d0d3FJWDJGS3J0QXdUSFdIWGRpdW1ENmFWSWtGWEFpRUEvK1Q4ZXhXeWlOUzExSGQvS2RVeVRpNnJFV2VER28vQVpGWHplSnBPR2VrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwSFowRjNTVUpCWjBsVlZuQlRXR3hzY0RaMWN5OHJRMlF6ZDNWT01WVk1aM2h0VW5GSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1ROTlJFbDNUVlJKTUZkb1kwNU5ha2w0VFVSSk0wMUVTWGhOVkVrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZOVlRSVVZubzVPRU5SVFRsclpYWnlkamRSTDNaWllYUnhTRTVUTTBGWE5FbEtjR3NLUVhsUFNqQnFTVmhyUkc1TU9YUjNkVFJXV1d0eldsaHRXbVZpZUc5Tk1sWmpaSFpEWm5kU1pUYzBhazEyYkVvMFRIRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5TTFSVUNscHJaM3BHYUdvd05HdGxVR1ZHZEhCS09WbHpkMU13ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFVVW0xUFIxbDZUbnBGTTFwVVRYaFpha0p0VFdwWk5GbFhWWGhOYWxKc1RqSlpNRmxxWjNkTlJFbDVDazU2WTNsUFJFSnRUbFJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRGUm5sM01rSkJRVUZDUVUxQlVucENSa0ZwUW1kdlZqRXdTRUZYYVRWVGNETUthSFJvVlZkTlZrUTNlakJaU3pWR09WUmllbE00YmxoYUsyMVBkaXQzU1doQlRWUmphamhoVVZWQ1VtOVpiRkV2UXpGMldpOVVlbkkwSzNCS2EzUlBlZ3BETlhwYWVXSkNlRFZvU1RkTlFXOUhRME54UjFOTk5EbENRVTFFUVRKclFVMUhXVU5OVVVSQlIyOXZURXhwU1U5b2JXVTVhamg2YWl0TE9YWndNMVZOQ21GYU4zSkpkR3BzUWpNd015OUtLM3AyVWxCNFdWQk5hbTVTVTFobWIwcFBhR2hxTkhWNk9FTk5VVVJWWld0R05VcDZhbXhRY3pGNmF5dFFhVEJrVEZVS1lsZFVSR0lyS3pWMGFtcFVXQ3RyUzNGNlduZFFORFZwV0d0bk0yazVaMGxaVUUxV1EyOTBOVzAyY3owS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666836117,
          "logIndex": 5948336,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "14f8f3717e31b0f268ae124e7f4b8002277280f5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3333930884",
      "sha": "14f8f3717e31b0f268ae124e7f4b8002277280f5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

