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
| `latest` | `sha256:ea268f0755161a5f7c51d64becee62a76440d539ae68cc73430147b52310f9c2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ea268f0755161a5f7c51d64becee62a76440d539ae68cc73430147b52310f9c2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ea268f0755161a5f7c51d64becee62a76440d539ae68cc73430147b52310f9c2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "677bce913ded13c337c7be091efb628eab31239b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIF1bV6xTnRADP7aDuGkPdeoFrtd9SAiOL7CzmoOBqyM1AiEAzEaGA77BP43IROzPO3CFZDBMBjUgLbhfSFOWShOapyE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzMDNiZGIyMmI3NmU1NjA5MmNiZDMwM2FlZjc2ZGFmZjk5MDc3ZTU0YjhiYmFjM2RlMTE2MWU3ZDU4M2JmYTY5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSEovY1I0L3gxU2t1L0d0aUt4VjVkL1dXMVB3d1hZRjdYYXZzeUI3YTdNQkFpRUF0Tm9NWitDeDY4dUJTcXdVNjJObTRSQ3RneVZaZkN4bjRpazFGQ1JTMVlrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwRFowRjNTVUpCWjBsVldVZ3JLemxDU2tOSWJHVm9XVkYwZHpoc2FtZEJabE5QU2pOamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRGTlJFVXdUbnBOTTFkb1kwNU5ha2w0VFZSRk1VMUVSVEZPZWswelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzVTBSM2RsY3dXbVJOUkV0MVJGZHJObFpJYmpoM2NFSm1ObUpNT1ZZek9YQjBPRU1LYkdwek1GQTJObTF6VDJaWlpEZDBTMFZJU0ROdGNIcHpkRWxaVVRscWQwcFZWMk5EVGxBNGNtVXhSemhoTmtGeVJIRlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZEUzBndkNqaHNhbk5xZFhrelZ5ODRjVmhPWkRaM1NXMU1XWEZqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDVxWXpOWmJVNXNUMVJGZWxwSFZtdE5WRTVxVFhwTk0xbDZaR2xhVkVFMVRWZFdiVmxxV1hsUFIxWm9DbGxxVFhoTmFrMDFXV3BCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFNrSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NITkZaVkZDTTBGSVZVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGWlZCb2RHVm5RVUZDUVUxQlVtcENSVUZvT0U5Wk9HMDRSME5EWnpobU1UQUtUWEZhUzNoemNFaEpRazV4ZWpSTk16QXpVWFpPU205SlpFOXBTRUZwUlVGM1JqQldkRmx3VERJNFJtaHNNMVpVVVRZcmNYRjRWa3hPVW00d1VreE9Ud3BrZWs5Rk4wZHJVWE5CZDNkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVZGQmQxcG5TWGhCVDJ4MVJrSlhTemRDVWxnMllsbFpOM0k1TmxwcFVITjJRMmhVQ25Fd1JURkxVbU14VDNwR2VrcHJUVXRxTW5WaFVYRTVOM0phTDA4NFMwRlRkMGxFYkV0QlNYaEJTbU16U0hkeFVYZEtNSFJsTVVoSFVHOU9hVkZKVG1zS1FsSk5UR2RVYWtZMU5sSkVWMnc0TXpZNVpHRjVORzVuSzFWeUwzUTBNM0ZTY25aR1FWaDFMMk5SUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668476883,
          "logIndex": 7095583,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "677bce913ded13c337c7be091efb628eab31239b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3466723570",
      "sha": "677bce913ded13c337c7be091efb628eab31239b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

