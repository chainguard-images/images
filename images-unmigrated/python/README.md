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
| `latest` | `sha256:ced31a1c47810d91eb8e77e196769e8f6df91459d969e8b999db227d9a4efcaa`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ced31a1c47810d91eb8e77e196769e8f6df91459d969e8b999db227d9a4efcaa) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ced31a1c47810d91eb8e77e196769e8f6df91459d969e8b999db227d9a4efcaa"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1a73780777b758b88261f302457fb64381dfac23",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFvc0k/E8EQMegwNAgXniF1caB5MIFSZOULDAA5ihi0XAiEAt8qpJodEc+hF6gbSZTh/U2oGLCxPl6Ti34zWpG4MqxY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0YmFlOTAxNGNlOWRhNGVlM2M5MDdjMTUyZDkxNDc3YzA4YTVmZjgzNjQ4OGUwZTliMDBlZGE2ZjcwNzBmYzY5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNmTjNFOUZzVUJrOTV2NURPSGFPeDFmcnpmdjhrYjhSZGM0M1FnQkpxSnFnSWdJbFN0OW5YbWMxaTB4MllMVzZpL1FVUGNYLzByRk1jNmttOXRkNmh2YXNnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVSRU5EUVhsTFowRjNTVUpCWjBsVlkxSlhlRmhrYVU1VE1VUnBXRzFzZUdKelFrcEJOM1Z6V0U4d2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFbDZUa1JSZVZkb1kwNU5ha2wzVDFSRk5FMUVTVEJPUkZGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzZEc1WFRTdFpXVmRUZVhFNEwwOWFWRmRvZGtsa2RuY3lOakpQVUVOMVREaE1VbmdLUWxVM1RFZDRjelZ4Y1ZOMmVXVkNWVVpWUTBaSU0xUnVlRzluY3pBM1pHRlROREZXZW5OdlMzWXhWek5hYVc5aGJIRlBRMEZyUlhkblowazVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZaZVRoNENtVjVRemwwVlhOTlRteHdWMmxKUmpneVRWQk5WSFJGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsUldVUldVakJTUVZGSUwwSkdZM2RXV1ZwVVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqU0d3d1lVYzVkVXg1Tlc1aFdGSnZaRmRKZG1ReU9YbGhNbHB6WWpOa2Vrd3pTbXhpUjFab1l6SlZkV1ZYUm5SaVJVSjVXbGRhZWt3eWFHeFpWMUo2Q2t3eU1XaGhWelIzVDFGWlMwdDNXVUpDUVVkRWRucEJRa0ZSVVhKaFNGSXdZMGhOTmt4NU9UQmlNblJzWW1rMWFGa3pVbkJpTWpWNlRHMWtjR1JIYURFS1dXNVdlbHBZU21waU1qVXdXbGMxTUV4dFRuWmlWRUZYUW1kdmNrSm5SVVZCV1U4dlRVRkZRMEpCYUhwWk1taHNXa2hXYzFwVVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaM2haVkdONlRucG5kMDU2WXpOWmFtTXhUMGRKTkU5RVNUSk5WMWw2VFVSSk1FNVVaRzFaYWxrd1RYcG5lRnBIV21oWmVrbDZDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlFqaEhRMmx6UjBGUlVVSm5OemgzUVZGVlJVVlhVbkFLWXpOU2VXSXllR3hqTTAxMlkwaHNNR0ZIT1hWTlFqQkhRMmx6UjBGUlVVSm5OemgzUVZGWlJVUXpTbXhhYmsxMllVZFdhRnBJVFhaaVYwWndZbXBEUWdwcFVWbExTM2RaUWtKQlNGZGxVVWxGUVdkU04wSklhMEZrZDBJeFFVRm9aMnQyUVc5VmRqbHZVbVJJVW1GNVpVVnVSVlp1UjB0M1YxQmpUVFF3YlROdENuWkRTVWRPYlRsNVFVRkJRbWN3TlhselMzTkJRVUZSUkVGRldYZFNRVWxuWWpsalRUZzRaR0Z3VjBob2NFMXJMM2xHWmpaTWRXeFhXbEl2YVVVMmVFWUtOMDVoTW1aMlUwc3dObU5EU1VWRmRsRjJTSFZSVTFoMmIzQkpja3hwWlM4d2JYVTNWSGsyVDNKQlIwWlNXRmRQWmtWTmRrMUZaMEZOUVc5SFEwTnhSd3BUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVVoxYkhSQ00wNXBjWEl2ZGtGNUsyazVhbHBzTWt3MFRWRjZORW95ZGpkUFNWUkNNRzEzVTJSWVVEaGxVakphQ2pJeGVGcEJObUphWmxWM1ExRkNaa2xWVVVsNFFVcDBVUzl2UWtKWFdWcDBSVUZuSzJSdGVITkNjVzh6YzBwTVJHVlVRa041VW0xdlkzaFJWV0puTkdJS01IazNSVTl0YTNKMlUxWXJkRnB0TkhReUwwZGFRVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663468522,
          "logIndex": 3527990,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/python/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075575263",
      "sha": "1a73780777b758b88261f302457fb64381dfac23"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

