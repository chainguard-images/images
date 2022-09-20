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
| `latest` | `sha256:9f07be3acbf4ec002f63b2c7f7e87362a6151a4ffa4470d85afab83239747018`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9f07be3acbf4ec002f63b2c7f7e87362a6151a4ffa4470d85afab83239747018) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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

All distroless images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-manifest-digest": "sha256:9f07be3acbf4ec002f63b2c7f7e87362a6151a4ffa4470d85afab83239747018"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "9c3cbf62b09107a014cb4afb044f9d422b14db71",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDIHRrKScO6GdTWo2vSgw3omNGw7YNM4yyO6l5evhrIqwIgE2EcIXladoL/OkbQtX0SevM2mNI4uXePufQaC6KXyts=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyOTM1NzhlYzkzNmYwNWQzMDAzZTcxMTEwZDk3MDc0ZmQ1NDVkZjU1YmViMDRlNTQ2ZTUxMWNjMTc1Yjc1MGVjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURUTEVoMG9LcTFPMHhDSGh2VXA2WEF4VHFWYmVKOFNjMDRuMzEyKzFDQllRSWhBSmVSdkRiblVsTk1wa2wrbEtiTlFtekZHaHRNVEcwVlQvQ3ZCZVJLNFRybSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhweFowRjNTVUpCWjBsVlkyOHpWVEpJUzBkd1RqUjNXV1kyWmxwR2NEZFZNRU5CVEZSRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZGbDNUMVJCTWxkb1kwNU5ha2wzVDFSSmQwMVVXWGhQVkVFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZQTVdORlNuTk9ObWh1TlZWeGVEWnZRbW81YzFGVk1IVTVLMFJWT0dOMkswVk5iM29LTmxWQlEzUlFOV1pyWWxnMmIwOXllR2REWkVocFJsWTJZVFpSZDBwT2FXUmFkbFppTkdSVVkzbENaMDVVYW10UFkyRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV3WWxaNkNuWnhUVFpqV1RWNFlXZENOVXRpSzNSc1RDdE5ibHBSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRJZDFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSVW1ReU9YbGhNbHB6WWpOa1pncGFSMng2WTBkR01Ga3laM2RPWjFsTFMzZFpRa0pCUjBSMmVrRkNRWGRSYjA5WFRYcFpNa3B0VG1wS2FVMUVhM2hOUkdSb1RVUkZNRmt5U1RCWlYxcHBDazFFVVRCYWFteHJUa1JKZVZscVJUQmFSMGt6VFZSQlkwSm5iM0pDWjBWRlFWbFBMMDFCUlVWQ1FUVkVZMjFXYUdSSFZXZFZiVlp6V2xkR2VscFVRVzBLUW1kdmNrSm5SVVZCV1U4dlRVRkZSa0pDYUdwaFIwWndZbTFrTVZsWVNtdE1WMngwV1Zka2JHTjVPWGRsV0ZKdllqSTBkMGhSV1V0TGQxbENRa0ZIUkFwMmVrRkNRbWRSVUdOdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVbEhTMEpuYjNKQ1owVkZRV1JhTlVGblVVTkNTSGRGWldkQ05FRklXVUZEUjBOVENqaERhRk12TW1oR01HUkdja28wVTJOU1YyTlpja0paT1hkNmFsTmlaV0U0U1dkWk1tSXpTVUZCUVVkRVZ6WnJSVVZCUVVGQ1FVMUJVbnBDUmtGcFJVRUtkM0p1ZVdRMFZtdGlTVGRrV0UxbmEyeHRjamgzU0c1MVVtMTNiRU4zYlVwTlZtRkpjazFJUkhaRk9FTkpRMkZ0VVU1MFYwTmlkVFUwTW5wWVJucDZNZ3B3TVVFNE9GRnhXbGczYW5BNFdGTnZUSEF3UTJweVNUWk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSnJRVTFIV1VOTlVVUTRaMDlWUmxVclZsWTBOV0l3Q2pFd09HWlJOVFZaUVVseWFVODBZVXQ2YmpaS00wTkJWSHBrUjNWb04wVnJiR1VyVkc1alJEVjFMM2syY2taQkwwZElORU5OVVVOeWQxZDZORVExVlhNS2RIVldjRWN3TURCRk5tRkJMMDFxWTIxeWIwOHZjRmwwTUdKeGJYQTJVM2RNY0ZFdmNFcDFUM1pPWjFOTlkwNUlhM1JOYm1sUVFUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663690171,
          "logIndex": 3615291,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3091668168",
      "sha": "9c3cbf62b09107a014cb4afb044f9d422b14db71"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

