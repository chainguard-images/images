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
| `latest` | `sha256:ea8392fc6b32f27101aa949867cdfdb0c8e2ffbe2b11e3934298cd2aeffaef1c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ea8392fc6b32f27101aa949867cdfdb0c8e2ffbe2b11e3934298cd2aeffaef1c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ea8392fc6b32f27101aa949867cdfdb0c8e2ffbe2b11e3934298cd2aeffaef1c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "b22eed1245301fc6047aa2288abe1982f86f3af4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIF+2VsxaVoJa4vVaj4CD0HK4uSp2K1k5Ix68eBxs4AEVAiEAr/sz3uiPaozSpjTmskrQXlr3a4zu36a1XFZK95y9Vwc=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2MzdhNDZjNmVjYTFmY2Y0YzZjM2I3Njk4MjZkYzc1ZTBjOGY0ODZmY2Y2NjI0M2M4MzNkM2E5MzEzOThiNTNjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUN1a2ROc3EwVGw0QUZMSVM2cDEvdXBJYkxDUHRjUHBoSTA5WU1laENCSDBRSWdITlEyYlhIeEE4ZHI1VW5RWHVUVHNTT0FOYy96WGg5a0k0OER3SUJGZm5VPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRWRU5EUVhnclowRjNTVUpCWjBsVlpVOWFVV3QwWlRJeU4wZFJVbGhWZHpZMVdqWndXVVZqYzNnMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDNUMVJGTUZkb1kwNU5ha2wzVDFSRk5VMXFTWGhQVkVVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZwTnl0dVlVWklVemRDZW5kUmFUVlRSR3RUZEd0eGVGSklZWGs1ZEZSbWVEQktPRzhLWkdkMFprdDVkV0p0ZFhKTFkxWjFhRkJ4VUdkclNYQkRjbXRpZW5CUU5pOXdaVVpzVkVWcWJFZ3dRMUJ1ZW5WQ09YRlBRMEZxTkhkblowazJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZMU1ZWakNtMVhkSEpqY1dVM1kxVnpWbmhuUlVKNU5VZFdjREJuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsUldVUldVakJTUVZGSUwwSkdZM2RXV1ZwVVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqU0d3d1lVYzVkVXg1Tlc1aFdGSnZaRmRKZG1ReU9YbGhNbHB6WWpOa2Vrd3pTbXhpUjFab1l6SlZkV1ZYUm5SaVJVSjVXbGRhZWt3eWFHeFpWMUo2Q2t3eU1XaGhWelIzVDFGWlMwdDNXVUpDUVVkRWRucEJRa0ZSVVhKaFNGSXdZMGhOTmt4NU9UQmlNblJzWW1rMWFGa3pVbkJpTWpWNlRHMWtjR1JIYURFS1dXNVdlbHBZU21waU1qVXdXbGMxTUV4dFRuWmlWRUZUUW1kdmNrSm5SVVZCV1U4dlRVRkZRMEpCVW5ka1dFNXZUVVJaUjBOcGMwZEJVVkZDWnpjNGR3cEJVVTFGUzBkSmVVMXRWbXhhUkVWNVRrUlZlazFFUm0xWmVsbDNUa1JrYUZsVVNYbFBSR2hvV1cxVmVFOVVaM2xhYW1jeVdtcE9hRnBxVVhkSVFWbExDa3QzV1VKQ1FVZEVkbnBCUWtKQlVVOVJNMHBzV1ZoU2JFbEdTbXhpUjFab1l6SlZkMGgzV1V0TGQxbENRa0ZIUkhaNlFVSkNVVkZTV2tkc2VtUklTbllLWWtkV2VtTjVPWGRsV0ZKdllqSTBkMGhSV1V0TGQxbENRa0ZIUkhaNlFVSkNaMUZRWTIxV2JXTjVPVzlhVjBaclkzazVkRmxYYkhWTlNVZExRbWR2Y2dwQ1owVkZRV1JhTlVGblVVTkNTSGRGWldkQ05FRklXVUZEUjBOVE9FTm9VeTh5YUVZd1pFWnlTalJUWTFKWFkxbHlRbGs1ZDNwcVUySmxZVGhKWjFreUNtSXpTVUZCUVVkRVZqaDRZemhuUVVGQ1FVMUJVbnBDUmtGcFFsTnhSa2d6YjBOblJsZG5SMlpvYm1wSVpqSnphR1ZyYTB0WWIzaFFaRGgyTjBad05rMEtXbkpIZEVwQlNXaEJTak4wYkVaSlpXWnRZWFZzWW5Gc1UwWk5OMWQyUWxVeFRrbElNSEp3TlVaRFEyeExRVmxpYTFVeWFrMUJiMGREUTNGSFUwMDBPUXBDUVUxRVFUSm5RVTFIVlVOTlJERkxSVU0zZFhKVlJsZE1jbm81TUd0NFVWZFpUSFYwWTJObWJWTmtkbE54U1dobWNtdDBPV2huUVZOQk9XY3dVR0Y0Q21kYVkySkRNbFpCTW1OR09HTm5TWGhCU2pSbk5UQmtNR2hzYTJkM2VHSlVNMWhHY0hRdldqRldkMFV2UkZBNVNYRnZOemN6TW5WWk9GQnNZV0pZTVZnS1dUSjNZMlZUVUZGdmIxUlJZa0oxTm5OQlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663625377,
          "logIndex": 3564181,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/python/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085950890",
      "sha": "b22eed1245301fc6047aa2288abe1982f86f3af4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

