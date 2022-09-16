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
| `latest` | `sha256:266a8db1c0fd7427de8f7f8a7951a00fb5abf8d828531ef5edc41901f9a6f558`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:266a8db1c0fd7427de8f7f8a7951a00fb5abf8d828531ef5edc41901f9a6f558) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:266a8db1c0fd7427de8f7f8a7951a00fb5abf8d828531ef5edc41901f9a6f558"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "08271ebe4b282c8ff07561a8ad6dadefe6c76ae1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFlNiHNNUEiTAw6lhh9sm4aJxXWuG45enfQYz59bGrmjAiEAynfIhNWgIE67NCVnfLQ3XKUepxWG93/QKfSN2IeqgeY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhMWY2NjNjNjZlZmYxNzc5OTMzN2UyYjA0NmRiNWYzYWYyNDg5NzQwNGJkOTNmNTEyOWVhZDQ3MmY4ZDg3ZjcyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURnK3ZVUWtoZ0R4SVBNU0U0ZXdHNkRPTDJ1YnVveU55VlJUOEsrUUJabnh3SWdDVEVUVjd0cWZIYnRkbkUybHduTi9KbjBYbFA1eEdmY1VnbnRKVFRKUThVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVla05EUVhsVFowRjNTVUpCWjBsVllWVkVaRTlpUlRoSlNUWTRNemxTWVZORVNVVnRha2hDYkVGQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlJFbDVUMFJSZWxkb1kwNU5ha2wzVDFSRk1rMUVTWHBQUkZGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZTUU0eFprNXlSUzlDTkdKM2QxUXhWRUl5TVd0TVl6RmthRTkxUmpjdlZXMUhRMElLWlcxUGNETmxTV1kwYUhSTGFXazNUMUpCTkhwa1EyVkdZVTVqWVU5MmR6bFJlbE5NU0hwNWFVNWthMHRWY2t0bVpIRlBRMEZyVFhkblowa3ZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZaV0VFckNuTlhOSFJsZUhKNk5UaFhkVWhhZHk5MVNTdFRUV0p6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsUldVUldVakJTUVZGSUwwSkdZM2RXV1ZwVVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqU0d3d1lVYzVkVXg1Tlc1aFdGSnZaRmRKZG1ReU9YbGhNbHB6WWpOa2Vrd3pTbXhpUjFab1l6SlZkV1ZYUm5SaVJVSjVXbGRhZWt3eWFHeFpWMUo2Q2t3eU1XaGhWelIzVDFGWlMwdDNXVUpDUVVkRWRucEJRa0ZSVVhKaFNGSXdZMGhOTmt4NU9UQmlNblJzWW1rMWFGa3pVbkJpTWpWNlRHMWtjR1JIYURFS1dXNVdlbHBZU21waU1qVXdXbGMxTUV4dFRuWmlWRUZYUW1kdmNrSm5SVVZCV1U4dlRVRkZRMEpCYUhwWk1taHNXa2hXYzFwVVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaM2RQUkVrelRWZFdhVnBVVW1sTmFtZDVXWHBvYlZwcVFUTk9WRmw0V1ZSb2FGcEVXbXRaVjFKc1dtMVZNbGw2WXpKWlYxVjRDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlFqaEhRMmx6UjBGUlVVSm5OemgzUVZGVlJVVlhVbkFLWXpOU2VXSXllR3hqTTAxMlkwaHNNR0ZIT1hWTlFqQkhRMmx6UjBGUlVVSm5OemgzUVZGWlJVUXpTbXhhYmsxMllVZFdhRnBJVFhaaVYwWndZbXBEUWdwcGQxbExTM2RaUWtKQlNGZGxVVWxGUVdkU09VSkljMEZsVVVJelFVRm9aMnQyUVc5VmRqbHZVbVJJVW1GNVpVVnVSVlp1UjB0M1YxQmpUVFF3YlROdENuWkRTVWRPYlRsNVFVRkJRbWN3VVdkbWQwbEJRVUZSUkVGRlozZFNaMGxvUVU5dWFVOUVTblp4VlhWaVVGSjFlakp5VEZSR1FXcDFWbGxLYnpKNE1VSUtkbUYxYW1KaU5raGpWRkZhUVdsRlFXZElWM2RVTWtOWlUwZE9ibWxUV2s1dE1FTk9lRUpYYTNOaGVESjFjMkpZZEdoTE1XTldTVTVZYlVsM1EyZFpTUXBMYjFwSmVtb3dSVUYzVFVSaFVVRjNXbWRKZUVGUFVXUjBOekl5TWt4eE5FSmpLek50U2xWbk5FMW1NRXhTUkVobmRrcDVTM1Y1UTNVM1RUbEVTVmxrQ2t0d2FISjFaVGg2T1ZOVE9YUnlaR2w1YTI5d2JIZEplRUZQWW5sdVpXbElUVzFrTVdKdFpVSnVNekYwVEhSWFZXeFBSVmhtUVhORlkwMXhTbE5MYzNVS1MxRjVPRWMzYmsxQ2RIYzNVVXR0UTJKdE9YcGhSMjFyYzBFOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663295342,
          "logIndex": 3512466,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/python/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3065010435",
      "sha": "08271ebe4b282c8ff07561a8ad6dadefe6c76ae1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

