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
| `latest` | `sha256:ecffae8d448d56a91df91bf76ebfcbc30c16d4cd22f0052ed281601302df9230`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ecffae8d448d56a91df91bf76ebfcbc30c16d4cd22f0052ed281601302df9230) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ecffae8d448d56a91df91bf76ebfcbc30c16d4cd22f0052ed281601302df9230"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e2106cd48b751300f0e981354badc7b8a01f4896",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDRy2OtPCGo5oAwPMDS/t22+jRqOZIJK/ZAsywvSda9CAIhALbC3+VaqWV72X3Tyr6UVW1dbkarudK6VGwSI+Z3LLqi",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhYzk3YjM0ZjU0YzJjZTJjZjBjOTE4YzI2MWVjNzM0N2M0MTQzZmU3Yjc5NjdlMmVhNTQ1NzUzODM3YjNhYzM4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNWdEMvUlpBSVVBQzZYQjNGQ1IzSnJZN2hGSm9qZFNJemJlV2RISUhiWHBRSWdWMmdMMDROcCthVnJiZ0RiZFhHZnV5ZXI5cG9MM3JNZzhoL1liYTBnbXFJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVlpFTnhMMmt4VUc0eGNqbDNWRVYwY0RsTlVsQkxhVEZEVmxsRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJFbDZUVVJCZUZkb1kwNU5ha2wzVDFSSmVFMUVTVEJOUkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZtTW1wNWEwVnFUVW81VFdWd1N5OVphVFkxTXpRMFMxaHFNVmhYYWpaeWEyeFRhR3NLWkdaUFkyMVdZbTlzZGpWRVl6RnJkbUVyVWtaSFRuWlBVWFZUT1c1NFMwcGpOMUJ4UW1ObmFqWTBPWGRUZFV4cldYRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZOUWtodUNqTlhTVXhVVDFVcmMxVjFaWG94ZHl0cVoweGxkVXRCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMXBVU1hoTlJGcHFXa1JSTkZscVl6Rk5WRTEzVFVkWmQxcFVhelJOVkUweFRrZEthRnBIVFROWmFtaG9DazFFUm0xT1JHYzFUbXBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFV0dWR05VZDNRVUZDUVUxQlUwUkNSMEZwUlVFME4wMHpSbWxJZGxReE5WVUthV2g1VVRkSldEQjJNV056YlRCWWFWTllTR0ZuUjFsR1duTk5WVnBPYjBOSlVVTTRValJGV0ZWdk4zUndiMDQwZWpoNk5VMUdUVlJ6ZEZseGRFbDJWd280UTI0MVUzSjBPREY1ZFhVMWFrRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtKVVkwZFhMMFZCZUc5RFJWQkVkVXBuUkhoNGJYRnZTRlZWQ2xOU01ETnpVV3RPYUdSYWNWUllVbVUwWkUxV2FYZDVjbU5UTlZCUE1HdzRibVIyVDBSWFVVTk5TRTlOZEZoTVRWSmtUakYxT1ZKQllsQlVZVWsyVjFvS2NFRnFWRGhTWVV0bk15dHBUa2N3ZHpKRVltYzFibmg2UkhsTWNUUnNaM1ZzVmt4dFltaFVNRVJuUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663727425,
          "logIndex": 3645879,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3094788605",
      "sha": "e2106cd48b751300f0e981354badc7b8a01f4896"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

