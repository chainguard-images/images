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
| `1.22` `1.22.0` `1.22.0-r0` `latest` `stable` | `sha256:9ff3f55b71e2c9606a882b5ce2eef2d7dde86d1b9b67fbfec60064933d169b9e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9ff3f55b71e2c9606a882b5ce2eef2d7dde86d1b9b67fbfec60064933d169b9e) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.1` `1.23.1-r0` `mainline` | `sha256:e025de4feb49a97c88ba63d699e5ac375856fb632299b97952b27943722c7102`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e025de4feb49a97c88ba63d699e5ac375856fb632299b97952b27943722c7102) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:9ff3f55b71e2c9606a882b5ce2eef2d7dde86d1b9b67fbfec60064933d169b9e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ce7371f275f48aed8f75300924709b1ab721d305",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDA+s5VG6eWUrj88y2mOJfJK0TTbpb6BmviyWNAd8iN7wIgBUwu1xtip+pr2vHRZgzXbhQmOCK7GGMYCBA5YHwiLU8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZGJmZTcyZDc2YzllZGRlZjJkZDU1YTdkYjA4ZjM4Yjg2Yzc1N2JlZTViMGE0MzE3ZmM5ZWEyZWY3YWUyOWIwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQvbnNxcWlGZ0hvcEQvdk5vT0NxWVhuYVdlU0ZyUnFQeUJhTW1TTVBqeUFnSWhBTGplM1dMWnh5YkprMk4wV254K285TWczVnU1UnhJdmNlQ09ibElUWFVybiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrclowRjNTVUpCWjBsVlpWTnRPSEV3VG5CaVFqbFpaWEJZY1d0cVkyZHVhWGhxTm1kVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRWTlJFVjZUMVJWTUZkb1kwNU5ha2w0VFVSQk5VMUVSVEJQVkZVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTZFRaUlJVNXVWa1ZZVXpaUVVqRkNVRE5HY2pacVFVZGxiSFJ5UlhoT1ExQk9jWGNLZVdreFJXaGpTbVpOYlV4b1lWRllVRmxaYW1ONVMwTk5kV0pRUjNKUVRuVjBVVXA1ZFdKdVlqbFdORlpFVWxWalZHRlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZxTjFwd0NucFdUMjVWTmpKQ05YSkNRbEpGUzFONU9WbGhiR1JSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm9hbHBVWTNwT2VrWnRUV3BqTVZwcVVUUlpWMVpyVDBkWk0wNVVUWGROUkd0NVRrUmpkMDlYU1hoWlYwa3pDazFxUm10TmVrRXhUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5OM0J0UlZwclFVRkJVVVJCUldOM1VsRkphRUZOYVc1RlZtRldTa3BSUjJabEsyd0tlalI1ZUVKWlJFTXZPRFp6UldOTFNVWldXamxMTkROQ1RtbDBSa0ZwUVdWTFpHdFNkM2h4YUdwemRFdEVaV1ZVUW1sM2MxUjJibE5oY0V0SGIySjJTUXA1ZFUxcVZYZHFUako2UVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV2UVVSQ2JFRnFRbFF3TVNzd2RHVnJURUoyZWprNVFrOUhkakpVYTNsalFrVjBNSGRhQ2tGM1RGcDBlR1puZFU5WlZWYzNNMWxpY0hGRE4zZFFlSFIyV1ZWNVRrcEtZbUV3UTAxUlJITlJiMDUzU2k5UVZUSjJkelY1WW5NNGIzWmxXRXBXWlVFS2VXVlZlREE0V0RGeVlqbHhUbGxNVVcxVVRFWktSRzQwVGpKMVNVaHBZMmd2VEVGeU0xRTBQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665279602,
          "logIndex": 4726098,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "ce7371f275f48aed8f75300924709b1ab721d305",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3212437280",
      "sha": "ce7371f275f48aed8f75300924709b1ab721d305"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

