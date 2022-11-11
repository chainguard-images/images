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
| `latest` | `sha256:3565d088ed37666049bdd5d1ed252cd5f4cafd06d1aaea12a1eca2f1c0fb3081`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3565d088ed37666049bdd5d1ed252cd5f4cafd06d1aaea12a1eca2f1c0fb3081) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:3565d088ed37666049bdd5d1ed252cd5f4cafd06d1aaea12a1eca2f1c0fb3081"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "421864301e6cb7311f5a0a55ca55e4b296e35a3e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC9+ZgR4xvtEVY2kMz15xVEBQji9JyF222faiuQSpboHgIgcEue+6iRgJn1r3td/qnZbgjaaB6urBaZ9ReN72bTtMA=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmN2VjZmQxYWZiMmM4NGVkMmMwZGRhMzNjNzI3MzYyODdmNjA1MWM0NDFkN2E3MGYxN2YwODk1YWU0OWI1ZGQzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUR2bXRBamVqbUFBV3V1ZDNabVJ5Uzd3Znh0NVR3UjBYQytYd3pudGs3Z2JBSWdNREJKSUNNTjhjUEUvV3JnSlExLzZ4NS91Tk9Da2FTbExQaFJsd2tBQkxBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwSFowRjNTVUpCWjBsVlUxaGpTSEZaV1VsNVowRjNiRTlNYW05QlMyczRVekp4WWxCUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhoTlJFVXhUbFJOZDFkb1kwNU5ha2w0VFZSRmVFMUVTWGRPVkUxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZCUnpsdU5qRlpiV0kyVW5neFFUZHpUMFZtYkhGWWRsUjZNRXMxTVdGeWVFeHZWa29LYzI1WlpqWk1VWGhuVTI1bmRHRjFUbkJ2VFcxR05XNXJSRUphUkhaSVEwWm5hamxKVjB0SVRUUk5PVXhDTUdOQk9HRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZsV1haSENqRlJaVE00YW5SblNFWXZRMVJCVjNGa1FYVTVaSGRKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDVFU1hoUFJGa3dUWHBCZUZwVVdtcFphbU42VFZSR2JVNVhSWGRaVkZVeFdUSkZNVTVYVlRCWmFrazFDazV0VlhwT1YwVjZXbFJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGV2tkWk1YQjNRVUZDUVUxQlVucENSa0ZwUlVGMlMwWXpha0ZNVTBveVkwUUtZbWNyTUhjckwxcExkMDF2UTBGS05tNDVXRloyVm0xYVVIVjRUM05CU1VOSlJYTkxSRkpwVFZwR2FWZHJZV2N5UVVKcGVVMW1WMmN2YlhoeU5WZHpTZ28yYVhoQk9VTXhNM1k1ZW1oTlFXOUhRME54UjFOTk5EbENRVTFFUVRKalFVMUhVVU5OUW5oblQzSkhXakZyYUdoYWRYbzNlbmRoU1dnelFuZHRNR0V2Q25wTmVYWk9XUzlxVkRkNWNXY3piMDFQVlVnM1pIWmlSVkpTT1RkQ2NpOVRSMFp0U2tSblNYZFlhV3A1Y0ZGdWFrTjRhRFl4TldGS2EzUmhSazFrVkRVS09USlRlVEkwWWpaV1lVbHRkV0o2V2tOV2VIQmlZa1l6YzBSMVVHTmtla2hFVDBWMU9YcHRjd290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1668131767,
          "logIndex": 6850064,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "421864301e6cb7311f5a0a55ca55e4b296e35a3e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3441882821",
      "sha": "421864301e6cb7311f5a0a55ca55e4b296e35a3e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

