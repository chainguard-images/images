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
| `latest` | `sha256:7ad110cc63b79a05221dba92622888ddec9b4040aee61978d5fff6ebb696c4d0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7ad110cc63b79a05221dba92622888ddec9b4040aee61978d5fff6ebb696c4d0) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:7ad110cc63b79a05221dba92622888ddec9b4040aee61978d5fff6ebb696c4d0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6bbb2a07f48d7fefe93c12f4a5806b980db0074b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEaX0+uCBdO5iFXx/Qm4239fZmPSVsEiM1NPahChO1w0AiAtv83/WwNZgowzAaReR+Tmqd8r9YdUHpMylVVieyWUUg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkNTgxYTQ2NTg0NTViMDc5NjRjZjQ3MGIwNWNhN2MzYjY1Yzk1ZWJiNmUwMjc1MzE3NzRhMDIzYTdhOTNjNmVjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRSt6TE1Yd01LZmp5SFByVkxLUkk4NmRtY2g5VVZFNEpMWkFwQitnemUvTkFpQmdkWEw4eURNcWdFV0Y2MjVORSszUGNCUzVPd2hjWlJHZlVoUXVwRlRSREE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwSFowRjNTVUpCWjBsVlFsZHZSemRwYzFvckt5dFFiRFZaUzJoMWVYaEdZV3RtUldWdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlJFbDVUMVJKTVZkb1kwNU5ha2w0VFVSRmVVMUVTWHBQVkVreFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaUkVsUk9XVklaVVUxVmtVdmRrc3pSeTg1VDBGSksySnNVVFpFTjBoWlpWVktiRmdLWVdKdWEwY3daSG96Y2xScmJubFFjV2x1TVU1eVdsTlhVVVYwVWxSR05FTlFTM0pGYkRCWlMyTlFhbUpCVTI0eVRUWlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ1UjBWSUNrNU1OMnR5SzJGa1FXSlRVVmM1Y2k5NWRtZE5Tams0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDV0U21sWmFrcG9UVVJrYlU1RWFHdE9NbHBzV20xVk5VMHlUWGhOYlZrd1dWUlZORTFFV21sUFZHZDNDbHBIU1hkTlJHTXdXV3BCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFZVdkYU4xWlJRVUZDUVUxQlVucENSa0ZwUlVGM0t5dERUbmhQY1dOTVpYSUtWbXg0VEdkM2RIY3ZWMFJyYmt3MmVVdEdNRkZGWVNzd1oyOHhNV3BTWTBOSlExa3dhSEUxTUZJM1JWWnJjVTVHVDI1ek5uSmFiM0pzYzBkVlJubFBTd3BKSzBGVlJFVk1VR3RuVDB0TlFXOUhRME54UjFOTk5EbENRVTFFUVRKalFVMUhVVU5OU0VsV1drRklSVVZLZG1oc1RteHBVVFZpVTJSR1prOXpZMjlvQ25oVlRHdEVVbFpJTkVaTlFUZEdMMEk0YWpCaWQyZENhemczV1ZscE9EVXlSMkpYUVhwQlNYZE9ZMk50TkZwNWNGZDFTVUU1U3pac2FVeEhNMlJsTVdRS2JISlJWV0pIT0RGRlJYTktNV1ZYY2tkd01tSXlZa1pVVlM5dFJFcE1XRUp5ZW1wU1puWnhad290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665541806,
          "logIndex": 4934128,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "6bbb2a07f48d7fefe93c12f4a5806b980db0074b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3231589616",
      "sha": "6bbb2a07f48d7fefe93c12f4a5806b980db0074b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

