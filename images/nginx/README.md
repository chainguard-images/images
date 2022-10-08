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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:5df7f249cae718486e8ffe3cb7e817ee1babf7b64bc69df90bec1d791cfdb5d7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5df7f249cae718486e8ffe3cb7e817ee1babf7b64bc69df90bec1d791cfdb5d7) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:bc2ac4c16eb5924cd81315f2b088873e341b65474068a60c85fd62fe2f68ef33`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bc2ac4c16eb5924cd81315f2b088873e341b65474068a60c85fd62fe2f68ef33) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:5df7f249cae718486e8ffe3cb7e817ee1babf7b64bc69df90bec1d791cfdb5d7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c18be0e37f1413f995401aed2514fa6e4644d343",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCq3EId0sMoXKIKDQvSWQwQ5MM6QLbWv2dsZmO76AgY2gIgG/J9DLdHpYpU/5b735EPOxZCDD/rEtKlSSPrkx+fQIc=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwNWYwYTY2MjIxMDkzY2Q0MjIyNzEwYzFjNWU5MWMyZDI4MzBkNWIyMGVhNjQ0ZDA4OTVhYWM4OGZkZjk0YjE5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRmE2R1dvZmx1OEdIRUJXeVo2VzJJQ1l1b1ZrTFh1MjRtWVVvWGFJSmpmdkFpRUF5NlV4SDJqUVp5M0doZnFOeEUxamFSakZRUVNDakFQQXBSTzl5QVBldktJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrclowRjNTVUpCWjBsVlMyeGFha0UxVjJKR1EzVXlZbEJPTjJad1QwSkhTbWRoWTNoUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRSTlJFVjZUV3BOTlZkb1kwNU5ha2w0VFVSQk5FMUVSVEJOYWswMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMUmpJNVdISldjM0JaUW5oQk5IZE5SM1E0WjA0ek1qbE5ZVFpFYzBkQ1ZsaHJOVEVLYkdKeFlVTmxNRFpMY1hCNFltSkdaa1I2VVZaeFpsZEZZMlpZU0U1UVZEVnJhVFowTVdzNFRsUmpaREZRWlRacFlYRlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZvWjBObkNtYzBVbWxHVGtjMWVuRkxWbWN6ZEU5NGJGRnNORUpaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm9hazFVYUdsYVZFSnNUWHBrYlUxVVVYaE5NbGsxVDFSVk1FMUVSbWhhVjFGNVRsUkZNRnB0UlRKYVZGRXlDazVFVW10TmVsRjZUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5OMVUxUldSclFVRkJVVVJCUldOM1VsRkphRUZLYUdRdldUTkpjRzhyVVhwM1VsRUtaalJoWW1sT1pqWkZkbXM0TmtwS0szWnVWSEYyUTFwR1JYcGxVVUZwUVcxWmRqRjJlbXBHU2xodk0weHVkVmRKWm5JNE5YZFBWRlF3ZDNOdVUwMXVRZ3B5Y0RCb1dtcDRTMmhVUVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV2UVVSQ2JFRnFRVWhQV0RaMmFFSXhVR1ZtU2xrNVdqTTFWRU5ZUjIxbWJXYzFlVVpTQ2xaRGNWUldTbGRuUVVaVFRteE9Ra1ZITW1SdVMzSTFkMHdyYjBGaGVuY3JObWhKUTAxUlJFMVNaazQ0T0d0MloxUTJZVE5NVUhkSldGWldRMFZXV21rS056SjBLMmx6ZFZGUmFYZFRWV281ZVhBelpGTnFiM1JWSzBaMFVsVnJkVVJJYXpCS1NEaFZQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665192767,
          "logIndex": 4665913,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "c18be0e37f1413f995401aed2514fa6e4644d343",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3208596783",
      "sha": "c18be0e37f1413f995401aed2514fa6e4644d343"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

