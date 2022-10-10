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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:0557f0cb6f6f8c8099a656c9657f682f45d044a2f0e1b0de87aa1149d8d5ec37`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0557f0cb6f6f8c8099a656c9657f682f45d044a2f0e1b0de87aa1149d8d5ec37) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:4d226c28822dabd14bd191ddb42f41c671c4a909ba0abf293c368ea7ae0cd335`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4d226c28822dabd14bd191ddb42f41c671c4a909ba0abf293c368ea7ae0cd335) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:0557f0cb6f6f8c8099a656c9657f682f45d044a2f0e1b0de87aa1149d8d5ec37"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e3af4f6a72f977f5d185a50437d2070866dc1b97",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCOTnDgKKdrxQ0HSxvcNZQ/eYwbgfGKRwLM46x84IpR/QIhANFRUZjxWyJKI0iE25MDQeamZKSSJVWuEAo6zXBX59jZ",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiOTM2YzJhNmE1M2U0MzZiZjdjMjkzYTY0ODA0ZTcxYzYwNWI4NjkyMDYyNDRiMzUwOTVmYmM4YTI1NzQ2ZDZhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUN4WEpCQktmMHJVcjIxcldXZGhnajBGdFhWL2ZjTzE5TW1zaDlTUHdHNTJRSWhBT3hQcU8yeER2aUU5RW1Fb0F4dzhkVWdIZ0dxcnA2NHNOcWtjYXdaZmNjNyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwRFowRjNTVUpCWjBsVldXbFFPVkJLT1c4MVpFTTFUR0pNTVVwdlVqRmhSbmxMT1VOUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhkTlJFVXdUWHBWTWxkb1kwNU5ha2w0VFVSRmQwMUVSVEZOZWxVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTZHpGbE1qbDVhVXRCVFdSeGRFNW5NV1JLVjJWV01EWnJWSEUzYURaQ1VtNDRhbEFLVlc1QlVrZHhNa0o2TDFSclozVTRRelJoVEZoUVdFTXlZMWRLWW5OMVpsQmpaRk52TWtsTVdVa3JRMjVYT0ZaSlp6WlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtZGtsaUNsZzRSbWd3UVdGRlQxbFJjMFJ4Vm5GeFRWRkhlVE4zZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm9iRTB5Um0xT1Ixa3lXVlJqZVZwcWF6Tk9NbGt4V2tSRk5FNVhSVEZOUkZGNlRqSlJlVTFFWTNkUFJGa3lDbHBIVFhoWmFtc3pUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVhkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpsQ1NITkJaVkZDTTBGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5OeXRSU0hadlFVRkJVVVJCUldkM1VtZEphRUZRVVc0NU5HdHdZa2s0TlZWT1FsWUtTRFpLZURreGNXOXZjbk5DZDFSQk9FcDJZbGxzTTBaMEwyZGhURUZwUlVGMU1taG1ZbXBsY1dsVVpXZEVibTlFUkc4NVFsaEpUbVp5ZFhKR1YxZFJXQXBJS3pORU9YWjBRMkV4WTNkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVVGQmQxcFJTWGRTVEdneGR6STNibk4zUkUxMFZXNDRVaXRhWjNsMFlVNXFiVU5DQ204elVtUlJNRGxOTW5VMVdHSlVlWEpDY0U5alNEaGhWMGx1VVhSdVJFVTVSbmRHUmtGcVJVRTNaRFp3VFZwTVEyMWhVVU0wSzB4c1VGRk9iMVp3YkRRS2RTOU9kMk5ZVjBsU1ZsZExlRlpLYTNsSFdGZFBVblJCZURrdll6TkRiVXRrYjFWd00zcFZXQW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665366246,
          "logIndex": 4786378,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "e3af4f6a72f977f5d185a50437d2070866dc1b97",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3216292678",
      "sha": "e3af4f6a72f977f5d185a50437d2070866dc1b97"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

