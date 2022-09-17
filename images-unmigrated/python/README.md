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
| `latest` | `sha256:616545e2de726ea75697318c7755286ec4963427fff45a73374e7375d9c31f9e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:616545e2de726ea75697318c7755286ec4963427fff45a73374e7375d9c31f9e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:616545e2de726ea75697318c7755286ec4963427fff45a73374e7375d9c31f9e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "05b71d6a0d7a931628de587cd7165ea4327c6700",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCsC4W/GfuKuP7u9tIZZnGuLEH7/GOO//j97fJ+lCErzwIgbZi8viFVludZNnTAVmk6nMddX4G4D1+wGtM6r2jEXEE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3OTgxMDY4OTBlNTI1YTg0ZjRjZmNhNTQwODMyNjBjYjg4NDZiOTUzNjQ5YzA0MWMwOGE2ODA3YjdjNTMwNzY0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNrckhNNCtZdjRmL2ZQMlpWVGx4T2ZIQ3RwTGp3bUdmUENKK2k1aTl6YlNnSWhBTHl2dmhrK3A3eTljSkJodm16cHloTElwb0FRNTFLcTdaUTBQQmcvR0grWiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVSRU5EUVhsTFowRjNTVUpCWjBsVlNISlZNbVpKU2toMlowRXdZMnhMUWxadk9WVmtiR0ppTm1vd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFbDRUVVJOTlZkb1kwNU5ha2wzVDFSRk0wMUVTWGxOUkUwMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV5VGpSSGIzTmpObWw1ZVVKTlZFZ3JTSG9yWWtVdllrTjRhWEZ2T0NzMFdYcGlOVzBLWWxkbFYyNXVORk5QVDFaRVlUVkhaWFZMZURWcGEyTkNWVmxsYVRkVVkxbEpkaTh3VTBzMWIwMXFNRlp2YTIxcmJ6WlBRMEZyUlhkblowazVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZYVFVKekNrRTFhMlZ6UVV4UVVIUTBXVGhXVlVZeGRXNTNZamgzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsUldVUldVakJTUVZGSUwwSkdZM2RXV1ZwVVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqU0d3d1lVYzVkVXg1Tlc1aFdGSnZaRmRKZG1ReU9YbGhNbHB6WWpOa2Vrd3pTbXhpUjFab1l6SlZkV1ZYUm5SaVJVSjVXbGRhZWt3eWFHeFpWMUo2Q2t3eU1XaGhWelIzVDFGWlMwdDNXVUpDUVVkRWRucEJRa0ZSVVhKaFNGSXdZMGhOTmt4NU9UQmlNblJzWW1rMWFGa3pVbkJpTWpWNlRHMWtjR1JIYURFS1dXNVdlbHBZU21waU1qVXdXbGMxTUV4dFRuWmlWRUZYUW1kdmNrSm5SVVZCV1U4dlRVRkZRMEpCYUhwWk1taHNXa2hXYzFwVVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaM2RPVjBrelRWZFJNbGxVUW10T01rVTFUWHBGTWsxcWFHdGFWRlUwVGpKT2EwNTZSVEpPVjFab1RrUk5lVTR5VFRKT2VrRjNDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlFqaEhRMmx6UjBGUlVVSm5OemgzUVZGVlJVVlhVbkFLWXpOU2VXSXllR3hqTTAxMlkwaHNNR0ZIT1hWTlFqQkhRMmx6UjBGUlVVSm5OemgzUVZGWlJVUXpTbXhhYmsxMllVZFdhRnBJVFhaaVYwWndZbXBEUWdwcFVWbExTM2RaUWtKQlNGZGxVVWxGUVdkU04wSklhMEZrZDBJeFFVRm9aMnQyUVc5VmRqbHZVbVJJVW1GNVpVVnVSVlp1UjB0M1YxQmpUVFF3YlROdENuWkRTVWRPYlRsNVFVRkJRbWN3YXpKVlFrbEJRVUZSUkVGRldYZFNRVWxuWVZOVlZXTkdSV0UwVnpSaU1UQlRiekJFYTNNck5sZFlPRU0wV1hrMFpXb0tXbXhJWm5relYwczVZMEZEU1VOVFNYWjRjM2cwY2xoaFNVSkplVWRVTlZZMFJESldjREpVYjFaa01uWkpUVUpoUTBGWVVHWlBkMDlOUVc5SFEwTnhSd3BUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVkZEVlN0VU1XWktXazRyY1RScmFVNTFkakZuYlZOVGVTOVRiRlZsSzFGTmJrUldUblI2ZERWT1NVcHRlamh6Q21aS1JGVllXa1p1U0hGalVYZzNjMDg1WkRSRFRVRlNOWGR2YWtjNUszTlpTRm80UW5kaWNtWm5NVEpMYkRCdmNsRkJaekZOYlRKd2VXeENaRWQ1YjJzS1Rrc3lRaXRoVG5STWREUmhMMmxGWnpaeloxTm9VVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663380657,
          "logIndex": 3523732,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/python/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071762271",
      "sha": "05b71d6a0d7a931628de587cd7165ea4327c6700"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

