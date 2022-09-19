# python

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/python/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/python/actions/workflows/release.yaml)

This is a minimal Python image based on Alpine, using Python apks available on the Alpine Community repositories (not built from source as of now).<br/><br/>While this image is being developed, we will stick to the latest stable Python version which at this moment is `3.10.7`. Supported versions in the long term are TBD.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/python:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:0aa4944e4559e1477411cd4759b7a1c75467f15441408de68c3e98adb111701d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0aa4944e4559e1477411cd4759b7a1c75467f15441408de68c3e98adb111701d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-reference": "ghcr.io/distroless/python"
      },
      "image": {
        "docker-manifest-digest": "sha256:0aa4944e4559e1477411cd4759b7a1c75467f15441408de68c3e98adb111701d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ce4be7983b7d18831cbad2cfe0fd0da58dbde243",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAyJhIQ65xbIRkuSm+k2NxDv8ncEmuJfM00J16khwYxzAiEA8rM1Tg3qMWcCz3DhBirY0UuVE+J3PsIMmrSMn6SyB/0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNjQ1MDY2Yjk2NzliN2YyYmY3ZmYxODMyNzlmZTllNDJmOGMxYTUyZTE5YTQwMWEwNjM5NGZjYjQzOGZjOTJlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRXliRkVnZy8vNFA5OGR5NW5hUUl0anBPY3RYZ1NIU3VnUGFJa0FJSWJnQkFpRUFrc3Y5dWE5dEhjYUtoY29nVmx6TzUvaDUzaHlRUVRuT0ZyUW51cHVCWVdZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVWRU5EUVhsUFowRjNTVUpCWjBsVlFqZFZkV1ZUTVZsMlRtUnBWMEY2VW14U2NsVXlSVXBSTWtoWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlJFbDVUMFJGTVZkb1kwNU5ha2wzVDFSRk5VMUVTWHBQUkVVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZFUWxGcGVqQlVNbXd3THpkRVkyb3hNSGMzYW1waGF6aFVaM2M1VEdNdlNuWmxRazRLUmxkVWIzWm5UVzl1WmtwTFdFdHdiWGhOU3paNFZ5OUpXVEJyVVhkdWNVNTZSbXRKV1RkbFNqSnlXR2xpVlRKUlpYRlBRMEZyU1hkblowa3JUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZUZDFKUkNrVjFVVnBYVld4SlRtTkNla3RtZURkcWJ5OVFhVFIzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsUldVUldVakJTUVZGSUwwSkdZM2RXV1ZwVVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqU0d3d1lVYzVkVXg1Tlc1aFdGSnZaRmRKZG1ReU9YbGhNbHB6WWpOa2Vrd3pTbXhpUjFab1l6SlZkV1ZYUm5SaVJVSjVXbGRhZWt3eWFHeFpWMUo2Q2t3eU1XaGhWelIzVDFGWlMwdDNXVUpDUVVkRWRucEJRa0ZSVVhKaFNGSXdZMGhOTmt4NU9UQmlNblJzWW1rMWFGa3pVbkJpTWpWNlRHMWtjR1JIYURFS1dXNVdlbHBZU21waU1qVXdXbGMxTUV4dFRuWmlWRUZYUW1kdmNrSm5SVVZCV1U4dlRVRkZRMEpCYUhwWk1taHNXa2hXYzFwVVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRhR3BhVkZKcFdsUmpOVTlFVG1sT01sRjRUMFJuZWsxWFRtbFpWMUY1V1RKYWJFMUhXbXROUjFKb1RsUm9hMWx0VW14TmFsRjZDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlFqaEhRMmx6UjBGUlVVSm5OemgzUVZGVlJVVlhVbkFLWXpOU2VXSXllR3hqTTAxMlkwaHNNR0ZIT1hWTlFqQkhRMmx6UjBGUlVVSm5OemgzUVZGWlJVUXpTbXhhYmsxMllVZFdhRnBJVFhaaVYwWndZbXBEUWdwcFoxbExTM2RaUWtKQlNGZGxVVWxGUVdkU09FSkliMEZsUVVJeVFVRm9aMnQyUVc5VmRqbHZVbVJJVW1GNVpVVnVSVlp1UjB0M1YxQmpUVFF3YlROdENuWkRTVWRPYlRsNVFVRkJRbWN4VDFSSk9UaEJRVUZSUkVGRlkzZFNVVWxvUVV0R2R5OTFNSEJCVDJsM1NVaHNSbEZrVTBGeVpubzRaRkoxWVRONVZsUUtWV1JYTTNSV1NqaE9WVWN5UVdsQ09VaE5LelpqY0hobWJXMHJhWEJHWnpWMllVUlZaM0ZyYjFCV01uRjJRVFpaVFRFMkwxTnRkRXhVVkVGTFFtZG5jUXBvYTJwUFVGRlJSRUYzVG05QlJFSnNRV3BGUVdzcmFqQkhSRFl2YlhVM1dtaHZNalJYTlVFM1VYQnVUbTU2UW5Wa1dtWnpVbmhJV1dVMU9GTjNaM2R4Q25wdGQxcFRTelJNY0hSa1VtMW1NMEpxVW14QlFXcEJPVGgyY1hSd05rTmxSRUpCYm5CT1lUbERMM051VG1kbWVIVXdkVUo0TUZoWFlXbERPR1l5V0RNS05XOUdkbFJyTUhkTWVYSnRWalp1ZWxCMU5tZGxaR005Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663554515,
          "logIndex": 3531471,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/python/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3079551382",
      "sha": "ce4be7983b7d18831cbad2cfe0fd0da58dbde243"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

