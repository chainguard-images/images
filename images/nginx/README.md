# nginx

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/nginx/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/nginx/actions/workflows/release.yaml)

A minimal nginx base image rebuilt every night from source.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nginx:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:bcf8e52a84b4143b338286825c6e815b34ee3f367d12508b4053377443097cc1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bcf8e52a84b4143b338286825c6e815b34ee3f367d12508b4053377443097cc1) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:01dc8ce7248e456bdb41cf2b73478c1f383d880025be2ab48aa109e7a612761c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:01dc8ce7248e456bdb41cf2b73478c1f383d880025be2ab48aa109e7a612761c) | `amd64` `arm64` `armv7` |


## Usage

To try out the image, run:

```
docker run -p 8080:80 cgr.dev/chainguard/nginx
```

If you navigate to `localhost:8080`, you should see the nginx welcome page.

To run an example Hello World app, navigate to the root of this repo and run:

```
docker run -v $(pwd)/examples/hello-world/site-content:/var/lib/nginx/html -p 8080:80 cgr.dev/chainguard/nginx
```

If you navigate to `localhost:8080`, you should see `Hello World from Nginx!`.



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/nginx:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/nginx:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/nginx"
      },
      "image": {
        "docker-manifest-digest": "sha256:bcf8e52a84b4143b338286825c6e815b34ee3f367d12508b4053377443097cc1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "67c4f942d4d67f55b53edcf2f3223ccd463f8957",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDPsN5vx38Z76hwzfHTNXvI52XyRh1pnd+cAKBMe3ny+wIhAI/rmFrumBiSItqxuXh9MdBpzvipVkGyq8sTQicuQk5F",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiYWVjZjdjOWVkNmNkYWM2MTI5MzQzZGI2NTU3YzUzOTRmMmFhMDQ0NWZmMzNjNTAxMGIzYjZmNTYzMmI3YWNmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNJeDYwZTRadUNqR2pwMVJQNENmVS9rdmFRN1dxajRkVkNpUzVLQVFHRWlRSWdWbEdiMDZJV3Y3Y2QzK2Nsdi90L3ZDdEw3cExTOXIzZG9BZ2dOaFprWXVFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwRFowRjNTVUpCWjBsVlRrZENSMGh5UVVOa1dXWkdiVlEzUlVsVFEzUlZWMWR2TDBrNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFVXdUV3BKZWxkb1kwNU5ha2wzVDFSSmVVMUVSVEZOYWtsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXTjBKb2JIRmlia2hSVEZwdU5YVlZXR3BHVVZOM1luUXpTaTlSU1U1NE1HUm1kbllLYWpsRFFWbEJPSEpsT0dsSlRuRm1OMVZVVUVaNWRrTlhaekJGWm5VM1VXeFRVMlJGZEZSMFJFWktUV3RYTW5FelRqWlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZOT0RaVUNuQXJTMWRIVVZSb2RraEJTbEZsT0hWVVpEZFpkVkpyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5NazR5VFRCYWFtc3dUVzFSTUZwRVdUTmFhbFV4V1dwVmVscFhVbXBhYWtwdFRYcEplVTB5VG1wYVJGRXlDazB5V1RSUFZGVXpUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVhkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpsQ1NITkJaVkZDTTBGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5Na3hqVDJOalFVRkJVVVJCUldkM1VtZEphRUZLYTI1c1RWZFdRbTE0U25vd2JHNEtja3hwTlUweWIxUkRSblp0YjAwNVdESlRXRkpGY1dadFdsSTFhVUZwUlVGNVpFdzBRbGhJY1hkSFNUa3ljRm8yVERsQ1V6aGtkbTVTY0c1MlJreHpRd3AxVlN0eFRFazRTazVqYjNkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVVGQmQxcFJTWGRPWjJ0WFdERTNhRFJtVVROd1N6UnhTbmN3V1d0dWR5dHZVSE12Q21neVYxTXZMM2d6YkdZMlJXMXRRa2d6UTBaeWNVWkdOSGhhYmpGUU5VZHlkSGc0YUVGcVJVRjZRMFZQUzFnelVVTnFVRlJ2TWxkM05sQkVVRUZsY1dNS2IwWXZPVWx3ZFdaTVRYb3dWelJuUzB4NFQzSkVXUzh6U201SlIzSnJVekZXUTFsdFNXazVTUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1663810961,
          "logIndex": 3713964,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102205038",
      "sha": "67c4f942d4d67f55b53edcf2f3223ccd463f8957"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

