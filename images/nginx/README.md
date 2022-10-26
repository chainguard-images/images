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
| `1.22` `stable` | `sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea) | `amd64` `arm64` `armv7` |
| `1.23.1-r0` | `sha256:ef537a031641f9b56e7e52c57dffdbd6ec8749b330114d77343567f733298cad`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ef537a031641f9b56e7e52c57dffdbd6ec8749b330114d77343567f733298cad) |  |
| `1.22.1` `1.22.1-r0` | `sha256:5e38ca41b3c70ecc0646c6cec4ae6f88875406f690e5d652c2822519e040288b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e38ca41b3c70ecc0646c6cec4ae6f88875406f690e5d652c2822519e040288b) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.2` `1.23.2-r0` `latest` `mainline` | `sha256:e83ae111156b09ab88c25ca38f002fa39b4454d91625c17c9c7420cef064e927`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e83ae111156b09ab88c25ca38f002fa39b4454d91625c17c9c7420cef064e927) | `amd64` `arm64` `armv7` |
| `1.23.1` | `sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70) | `amd64` `arm64` `armv7` |
| `1.22.0` `1.22.0-r0` | `sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:e83ae111156b09ab88c25ca38f002fa39b4454d91625c17c9c7420cef064e927"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "b254a29ed6ac910079453ea9241358d5e1c15a2d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCCaWFKhZX7bcYorBQzXuj8GNoGiriGfQLpxEDvbBSrRQIhAKQ/vJ46hzVntPgNV5nMyhg/i9NMOopFukSH6xBDBeU8",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1Yzk0MTZiZGEzMWNkNzU0NjkyMmFkMjU5NzQ1MjdhNGI5ZjA3MjUwNzIwNTQ5Yjg3N2I4Y2U4ZjMxOTdlMzBhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ3pxMkhONlhmWTZSckRxNHNVNkxoZ3FacStHSnk1RkRxM3MwQnFyZ0licUFpRUFwRlgzZ2N4dVZoRkRRb0U2Y1RIRGVtZ1RBZ3dYaytQYUZoTm9XWTg3V0ljPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwcFowRjNTVUpCWjBsVldsSmpURkY0WnpkYVRXbzNWVE5NVFZneWFVazVTbE4xVkVOUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RKTlZGVXhUWHBOTWxkb1kwNU5ha2w0VFVSSk1rMVVXWGROZWsweVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZsWjAxbU5qbHVha2MwWVV0V09WUlFWU3RuY0hsU0wybFJRakpMVFU5ck5HMVBXVVlLU1ZOSGJFRjZXRFpKTkZsQ1QyRkdheXRDV2xoelJqUkNVbEJKVVZwNlZUQnpVM1JYVXpFclZsSnNlWHBNVFZObE5qWlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYxVXpWb0Ntc3hhMlp3ZGpoMGNDdDRUbVk1YVdkbVVURlFiMFZuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRV1pDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0pHTTJJelNuSmFiWGgyWkRFNWF3cGhXRTUzV1ZoU2FtRkVRVEpDWjI5eVFtZEZSVUZaVHk5TlFVVkVRa05vYVUxcVZUQlpWRWsxV2xkUk1sbFhUVFZOVkVGM1RucHJNRTVVVG14WlZHdDVDazVFUlhwT1ZHaHJUbGRWZUZsNlJURlpWRXByVFVKM1IwTnBjMGRCVVZGQ1p6YzRkMEZSVVVWRWEwNTVXbGRHTUZwVFFsTmFWM2hzV1ZoT2JFMURWVWNLUTJselIwRlJVVUpuTnpoM1FWRlZSVVl5VG05WlYyeDFXak5XYUdOdFVYUmhWekZvV2pKV2Vrd3lOVzVoVnpVMFRVSXdSME5wYzBkQlVWRkNaemM0ZHdwQlVWbEZSRE5LYkZwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtOQ2FXZFpTMHQzV1VKQ1FVaFhaVkZKUlVGblVqaENTRzlCWlVGQ01rRkJhR2RyZGtGdkNsVjJPVzlTWkVoU1lYbGxSVzVGVm01SFMzZFhVR05OTkRCdE0yMTJRMGxIVG0wNWVVRkJRVUpvUWxRdmQwdEJRVUZCVVVSQlJXTjNVbEZKWjBsWWQySUtaMFZPVFZKR1NtTTBRVnBJZWtVd1ZtSnhjMWRwTml0R1NHVnplbmxwUW5WSFdVUnJkak56UTBsUlJHbFJUUzgzTmtkbVUwRnNNbVpMVmpjMk1UWlRMd3AwYUc1elJsTkRaVkZMTDBrM1UyTnNkVFJCVUdocVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dlFVUkNiRUZxUWxkMmRtaG9UbWR1WTBRMmFWVkhSMnhXQ2xadlJ6aGtTWEZXVUc1UFMySjZNSHBWWlVOeU5FVk9RWFpUVUZSUFNtTXlaVGgxTUVoS1pqZHZVa2RNU1V4VlEwMVJRMDU1Y2xJeVprbGpTMkUwUzJrS2FWRlNOM05SUzB0UlJUQlBRV2hKVDNoNlFYRlFVVEpyZVhadllXZHhiV1o0YlZnNFkwVjVibE15VTNKRlVqRnpVRWQzUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666799627,
          "logIndex": 5915296,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "b254a29ed6ac910079453ea9241358d5e1c15a2d",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3330384266",
      "sha": "b254a29ed6ac910079453ea9241358d5e1c15a2d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

