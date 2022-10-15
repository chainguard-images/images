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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:0992be2a3ce4d66db02d26529e9ce5d103f4b2cd3746055237e629e29f3ff15e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0992be2a3ce4d66db02d26529e9ce5d103f4b2cd3746055237e629e29f3ff15e) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:6ed36d9eb7be30364efb42060615d77bdb4ce9e5b9bb01145bcdc704a58782fe`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6ed36d9eb7be30364efb42060615d77bdb4ce9e5b9bb01145bcdc704a58782fe) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:0992be2a3ce4d66db02d26529e9ce5d103f4b2cd3746055237e629e29f3ff15e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "422d80ba7bb2f0c9c0893493a6dbd50919a310c4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIC9whNzR7rTdMrl6cflM57Jjh75mXaN87bTgK+sQ+5h2AiEAylEw3nuUz2OGZgt6D6Oqi3Hx/2yFs1Nl0k3oPUKpH8U=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzODhhYzg5Y2JmNTYwMzc4MjI1MTQ3ZTIwZjAwZWYwZmI3ZDc1NmE0ZWQzZTYxOGNiNzJiYjVjZjBkZDlmNGI3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQTFQdXFjemVPWE1meDNLbnVCZlVGVEF6YmNCdVVMMzgwS2NrSFNkUDVuVkFpRUFwbmxURnBUdStHYm5vbnd6SDJsaXRDdlAxQWNxQWxZeUxLMDlJUjR5K0xrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwcFowRjNTVUpCWjBsVldTdGtLek0xYzFwa2IwaHJNakk0YURGbE1WSmlRMVpaZWtoTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRGTlJFa3dUVVJKTUZkb1kwNU5ha2w0VFVSRk1VMUVTVEZOUkVrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZsVUd4b01UWnBhMGRHT0c5a05sWlpja28yVG1aUGEzTk9SMUZ6TjA1bmRqSjFTVlVLVldsalVYWXdUbGR1TVdoemRtNVBjbnBLZGtkM1RXWnNNVlI0TnpKeE5reHZWMXB6YmtoNGJFVlllazVaTkRGV1dIRlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUzTXpKeUNqY3pUR0pPVDBka2RVUTFXRmRhVkU5UVdqSXJTV3QzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRV1pDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0pHTTJJelNuSmFiWGgyWkRFNWF3cGhXRTUzV1ZoU2FtRkVRVEpDWjI5eVFtZEZSVUZaVHk5TlFVVkVRa05uTUUxcVNtdFBSRUpwV1ZSa2FWbHFTbTFOUjAwMVdYcEJORTlVVFRCUFZFNW9DazV0VW1sYVJGVjNUMVJGTlZsVVRYaE5SMDB3VFVKM1IwTnBjMGRCVVZGQ1p6YzRkMEZSVVVWRWEwNTVXbGRHTUZwVFFsTmFWM2hzV1ZoT2JFMURWVWNLUTJselIwRlJVVUpuTnpoM1FWRlZSVVl5VG05WlYyeDFXak5XYUdOdFVYUmhWekZvV2pKV2Vrd3lOVzVoVnpVMFRVSXdSME5wYzBkQlVWRkNaemM0ZHdwQlVWbEZSRE5LYkZwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtOQ2FXZFpTMHQzV1VKQ1FVaFhaVkZKUlVGblVqaENTRzlCWlVGQ01rRkJhR2RyZGtGdkNsVjJPVzlTWkVoU1lYbGxSVzVGVm01SFMzZFhVR05OTkRCdE0yMTJRMGxIVG0wNWVVRkJRVUpuT1cxRWJsWXdRVUZCVVVSQlJXTjNVbEZKWjFoNGNIb0tiRUpoTlN0TFQzYzFUa3B5WTJOclJXbFVNSEU1VGpObUwyTm5ZMnBIWmk5NFdXTnJWWEIzUTBsUlEydDNUelZyVFRWTU4zbHhWVEpwZEhKcVZuaDVkd3BrTlhwdlVXNHdXRUpwVDAxWWNrZHlNMmMxTjA1VVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dlFVUkNiRUZxUlVGNFVYcHZjelo0ZUhkM01VcFFNelpHQ2l0amNXNXZiVWxQU2s5emFGZE5PWFZHYURONVJWUXJhRlo2U3psc2FYVnBValZhVkdaQlNIZFpaMWxsZW5admRrRnFRV3hxZVdSaGFqaFhOMFJPVm00S2NFMXhSV1UwWmxKdWFGWkRUM0k0UzBSbmMyeHFlbFpzS3podE5taFRUblZVTDIweVEwOUVVbkpRVTB0NWRHcFBkVXR2UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665801633,
          "logIndex": 5131242,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "422d80ba7bb2f0c9c0893493a6dbd50919a310c4",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3254069201",
      "sha": "422d80ba7bb2f0c9c0893493a6dbd50919a310c4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

