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
| `1.22.0` `1.22.0-r0` `latest` | `sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2) | `amd64` `arm64` `armv7` |
| `1.23.1` `1.23.1-r0` | `sha256:eff5ece7ecfbaceb4801e5b45cc9b25e1e249915543a715264a5f8c9f2a1b98e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:eff5ece7ecfbaceb4801e5b45cc9b25e1e249915543a715264a5f8c9f2a1b98e) | `amd64` `arm64` `armv7` |
| `1` `1.23` `mainline` | `sha256:569586682ceac6667f87da7591627eb01337c768f757e93fab911591f2c3780d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:569586682ceac6667f87da7591627eb01337c768f757e93fab911591f2c3780d) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "91fd33e3c0cb30a039f7247239f5f10a212e9f02",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDCqjT7+o8SZKgWtXXoc3MIW02xsGCK0Z52MKsonyzGGgIgJwg+Wd4q5VBji3G6w8GqdYB/t8QCL0rlcsxg8KSEYuY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5NzM0Nzc5MGMxY2I2ZGFmMzEyYmIwYjFmNDkyMmQxZDg3MzY2ZTQwYjZhNTk3NmUxZWE2YjhmZmM2MDUyNTQ1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURwUWlpUkdmYWozY2hQSThhSEgrbXBXeDBha0p0MGFFTmR6ZFd2aUk2ODhRSWdJcWVOUFFIYTQ3MHdvajhhVVJMOVdIQkMrTWIxVVBtRXBVSFZ4RU5jc013PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwcFowRjNTVUpCWjBsVlkwaHZNMUZRUlZobFUxbE5iamhrWTI4eFlrdDZRVXRCVlhsSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlJGVjNUMFJKZVZkb1kwNU5ha2w0VFVSSmQwMUVWWGhQUkVsNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZGVFdGRFUxQnJSblpPTHpoM09UQjBkbWQxWlhOcFMxZEJaR0Z1SzJGWVVEWk5kRWtLTlV0MVQyUXpiMDlRWkZGclNVWnlWMlZpY1ZJdmJrRkpVMjVCVldOeUt6VlRiREZhWW5oM2IxcHlVWGRsS3pBM2RXRlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5ZFdWUkNteEdUVGxPSzJsbVMwOVVjVTVyWkVSdk1pdHBhUzluZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRV1pDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0pHTTJJelNuSmFiWGgyWkRFNWF3cGhXRTUzV1ZoU2FtRkVRVEpDWjI5eVFtZEZSVUZaVHk5TlFVVkVRa05uTlUxWFdtdE5lazVzVFRKTmQxa3lTWHBOUjBWM1RYcHNiVTU2U1RCT2VrbDZDazlYV1RGYWFrVjNXVlJKZUUxdFZUVmFha0Y1VFVKM1IwTnBjMGRCVVZGQ1p6YzRkMEZSVVVWRWEwNTVXbGRHTUZwVFFsTmFWM2hzV1ZoT2JFMURWVWNLUTJselIwRlJVVUpuTnpoM1FWRlZSVVl5VG05WlYyeDFXak5XYUdOdFVYUmhWekZvV2pKV2Vrd3lOVzVoVnpVMFRVSXdSME5wYzBkQlVWRkNaemM0ZHdwQlVWbEZSRE5LYkZwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtOQ2FXZFpTMHQzV1VKQ1FVaFhaVkZKUlVGblVqaENTRzlCWlVGQ01rRkJhR2RyZGtGdkNsVjJPVzlTWkVoU1lYbGxSVzVGVm01SFMzZFhVR05OTkRCdE0yMTJRMGxIVG0wNWVVRkJRVUpuTDFCTE0zVnpRVUZCVVVSQlJXTjNVbEZKYUVGUVowZ0thbk0zZGtoQ1dsRlNhV3BpTjJ4Rll5dEJZV3hYTmpaRllqSndUekpQVkVOT1VFVk5UVzg1ZUVGcFFrVm1PRE4zWVVKUFFqUnRPR3AxUzBOSk4ya3pkQXBSUldwdlQxcDViR1UwWkhvelZYQTNabEJrWWtwRVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dlFVUkNiRUZxUlVFeFFsbFJWRlZTVWt0YWNFRkhWakpZQ2xORWF6UlJNbFJuTmxVemREWnJibk4xYlZCaWRXWkdOa1ZJZFZsbmFsbDJNWFZuUTJWSmVFaElWa0oyYkM4MU0wRnFRVGRQU1RsNFdXNUhaV050YUU0S04yWmFjMDVKY1cxNlFrRmtPRE5PU3pWek16VkliRFYwYmtGaFNFdElNblpGTDJ4NU9YZENTWGxHVm1wMVJWRjBUMmhWUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666242512,
          "logIndex": 5476027,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "91fd33e3c0cb30a039f7247239f5f10a212e9f02",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3286897843",
      "sha": "91fd33e3c0cb30a039f7247239f5f10a212e9f02"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

