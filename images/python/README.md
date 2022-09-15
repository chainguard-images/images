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
| `latest` | `sha256:9563dbf5a49ace4a4a9d65f7ae5fd71c1e00b7176ea50c258cc1f9aab189db10`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9563dbf5a49ace4a4a9d65f7ae5fd71c1e00b7176ea50c258cc1f9aab189db10) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:9563dbf5a49ace4a4a9d65f7ae5fd71c1e00b7176ea50c258cc1f9aab189db10"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "37f1ffdd089202a75fc534e2703e4812fc8f57b1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDq8bTiAGfr2I8ykxhcQOqepqcelqMG7ROiQKdhVxGbBgIgUKDJVEoGgBVA31IpiVB2pQsdnB0+cHHWDzZ5eHN3NOY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2ODAwZTFkYjAzOWYxNzY0ZGEyNzM2MzgyZjYzM2NlMWY0YjhkOTk1OTJjMjMxNmRiNTU1Y2U4MzZmYjg3MmMyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQ5TDBZV2FXQTdlUkhqUUtXd0dPR252citKbnkzZzUzWkZncmZERExmemlnSWhBTWVzSGgzbkVBblVZRUZDcE5PN0VtQzN2L3N0TzFJWW11eDBJMUxBbjBHdiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRha05EUVhnclowRjNTVUpCWjBsVllXOWxUMkpXTVVkM2EwOVliMnBYY21GelFuaEVSa3hKVFZORmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTmFrMTRUMVJWTUZkb1kwNU5ha2wzVDFSRk1VMXFUWGxQVkZVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZIVm5kc0wzWmhTRWc0VDJ0aEswNXRlVlkwWm1GYVZrMTZaVVY0UzNneFJFUTFZalVLZVZGd09HOXhjQzlLUW5GVkwxQjVhVE5CYjIxQ09WRkVOelpYYkdwRVF6TjJaMlp6YkU1d1FWTnhNVlJqWW5waVkzRlBRMEZxTkhkblowazJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTU2pSWENsUm5jWEV4TTFneWRIbGpUaXR5VHpWdVZXZE5jRmc0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsUldVUldVakJTUVZGSUwwSkdZM2RXV1ZwVVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqU0d3d1lVYzVkVXg1Tlc1aFdGSnZaRmRKZG1ReU9YbGhNbHB6WWpOa2Vrd3pTbXhpUjFab1l6SlZkV1ZYUm5SaVJVSjVXbGRhZWt3eWFHeFpWMUo2Q2t3eU1XaGhWelIzVDFGWlMwdDNXVUpDUVVkRWRucEJRa0ZSVVhKaFNGSXdZMGhOTmt4NU9UQmlNblJzWW1rMWFGa3pVbkJpTWpWNlRHMWtjR1JIYURFS1dXNVdlbHBZU21waU1qVXdXbGMxTUV4dFRuWmlWRUZUUW1kdmNrSm5SVVZCV1U4dlRVRkZRMEpCVW5ka1dFNXZUVVJaUjBOcGMwZEJVVkZDWnpjNGR3cEJVVTFGUzBSTk0xcHFSbTFhYlZKclRVUm5OVTFxUVhsWlZHTXhXbTFOTVUxNlVteE5hbU4zVFRKVk1FOUVSWGxhYlUwMFdtcFZNMWxxUlhkSVFWbExDa3QzV1VKQ1FVZEVkbnBCUWtKQlVVOVJNMHBzV1ZoU2JFbEdTbXhpUjFab1l6SlZkMGgzV1V0TGQxbENRa0ZIUkhaNlFVSkNVVkZTV2tkc2VtUklTbllLWWtkV2VtTjVPWGRsV0ZKdllqSTBkMGhSV1V0TGQxbENRa0ZIUkhaNlFVSkNaMUZRWTIxV2JXTjVPVzlhVjBaclkzazVkRmxYYkhWTlNVZExRbWR2Y2dwQ1owVkZRV1JhTlVGblVVTkNTSGRGWldkQ05FRklXVUZEUjBOVE9FTm9VeTh5YUVZd1pFWnlTalJUWTFKWFkxbHlRbGs1ZDNwcVUySmxZVGhKWjFreUNtSXpTVUZCUVVkRVVUTlBhR05uUVVGQ1FVMUJVbnBDUmtGcFFrSnhUVEpMZGpKV05EaHdVWGN5Wm01dFoyc3lSRzFOVmxwQllXZDRjR2hXVGs1WVJHVUtjMlZKWVM5UlNXaEJTaTlsZUdselIyWTFZV0ZITmxab1puSm5aSG8zYWtaM1MxSkdZVkZZVVcxeGNtaHVNMm96WjJoTlEwMUJiMGREUTNGSFUwMDBPUXBDUVUxRVFUSnJRVTFIV1VOTlVVUmpNbkpTYWtOdWRFSnBlRVp1TUhabVNHaHdTbU5rVnpadU5WRllVakUzZGxaRE5rOWxVRVp2TDA1S2JVdGxZV2hLQ201aWFXWTBWR1ZuWWxGMFRrRnNVVU5OVVVOcVZtaFFaMUpFY1ZSTVVtaFZUa05pVG5ORGRGSmxaRm80Tlhka1JuSTBXVzVGZEhwTE5rMHJiV2RuSzFJS2VXNWxMemhVTm5OR1RubG5ObHBHUlZGcldUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663284033,
          "logIndex": 3511631,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/python/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3064333853",
      "sha": "37f1ffdd089202a75fc534e2703e4812fc8f57b1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

